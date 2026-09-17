# STRATUM Multi-Vehicle Orchestration — Architecture

**Document** NXM-SW-ARCH-STRATUM-MVO-001
**Revision** v0.1 — 2026-09-03
**System of interest** Multi-vehicle orchestration subsystem inside STRATUM-Desktop
**Baseline scanned** STRATUM-Desktop @ `4095ba3`; PX4-Autopilot-NX-main (working tree)

---

## 0. Purpose and definitions

This document defines the architecture for coordinating up to three Dagger air
vehicles onto a standoff ring around a single operator-designated target. It is
written as a set of decisions, because an architecture *is* a set of decisions;
everything else is consequence.

Terms are fixed here and used consistently throughout.

| Term | Definition |
|---|---|
| **Target** | A single geodetic point designated by the operator. One per mission. |
| **Standoff ring** | The horizontal circle of radius `R` centred on the target, at height `H` above home. Derived, never primitive. |
| **Ring slot** | A station on the ring, identified by its bearing `θ` from target to hold point (0 = North, CW). One vehicle per slot; one slot per vehicle. |
| **Transit level** | The AMSL altitude at which a vehicle performs its horizontal run-in. Distinct from the slot's hold height. |
| **Agent** | STRATUM's per-vehicle orchestration object: one `Vehicle*`, one slot, one state machine. |
| **Commit** | The act of sending a vehicle its standoff geometry and switching it into the Standoff flight mode. |
| **Separation bubble** | The keepout sphere carried by each vehicle. Redefined in §6 — the 1 m figure does not survive contact with the position-uncertainty budget. |
| **Deconfliction by construction** | Separation guaranteed by the geometry and schedule chosen before flight, rather than by a runtime avoidance controller. |

---

## 1. Baseline — what the scan established

### 1.1 The single-vehicle control chain, as built

```
Operator (Set Standoff panel, FlyViewWidgetLayer.qml:266-444)
   └─> StandoffController.beginStandoff(d, h, θ, target)      [QML, one instance]
        ├─> Vehicle::guidedModeStandoff(target, d, θ, h)       Vehicle.cc:1927
        │     └─> PX4FirmwarePlugin::guidedModeStandoff        PX4FirmwarePlugin.cc:447
        │           └─> sendMavCommandInt(31010, GLOBAL_RELATIVE_ALT,
        │                  p1=d, p2=θ, p4=NaN, x=lat, y=lon, z=h)
        │                 └─> MavCommandQueue  [per-Vehicle, 3 retries, ACK-matched]
        └─> Vehicle.flightMode = "Standoff"  → DO_SET_MODE(main=4, sub=20)

PX4: mavlink_receiver.cpp:832  → standoff_setpoint (uORB)
     commander                 → nav_state = 9 (NAVIGATION_STATE_STANDOFF)
     navigator/standoff.cpp    → HEADING → APPROACH → HEIGHT → DIRECTION
                               → request_hold_mode()  [one-shot, on settle]
```

The essential division of labour is already correct: **STRATUM sends intent, PX4
owns geometry.** STRATUM transmits the *target* plus three scalars; the firmware
computes the hold point, the hold altitude and the facing yaw itself.

### 1.2 What is already multi-vehicle

Everything below the QML layer. This is the single most consequential finding in
the scan, because it converts the work from a refactor into an addition.

- `MultiVehicleManager` is stock and unmodified. `multiVehicleEnabled()` returns
  `true` and STRATUM does not override it — **multi-vehicle instantiation is
  already live**. `vehicles()` is a full model; `vehicleAdded`/`vehicleRemoved`
  signals exist; `selectedVehicles` exists.
- `MavCommandQueue` is constructed per `Vehicle` (`Vehicle.cc:266`). Retry and
  ACK matching are scoped to one vehicle's queue. Three concurrent
  `guidedModeStandoff` calls against three `Vehicle*` objects are safe **by
  construction** — no new queuing infrastructure is required.
- `VehicleLinkManager` is per-`Vehicle` and already handles many-to-many
  link↔vehicle association. The `NEXAM_TARGET_SELECT` broadcast fix (`d2d616a`)
  established the correct idiom: enumerate *this vehicle's* links, not "the" link.
- Every FactGroup — including the Nexam-added engagement/target-track groups and
  the GNSS `horizontalAccuracy`/`verticalAccuracy` facts — is a per-`Vehicle`
  member. Three vehicles yield three independent fact trees with no plumbing.
- `VehicleMapItem.qml` is already rendered through a `MapItemView` over the full
  `vehicles` model. The map draws all vehicles today.
- `PlanMasterController::startStaticActiveVehicle(Vehicle*)` exists and is
  already used per-vehicle in `FlyViewMap.qml:463-479`. If multi-leg routing is
  ever needed, the per-vehicle mission-upload path is proven.

### 1.3 What is single-vehicle

Only the Nexam FlyView QML singletons. Each is instantiated exactly once and
bound to `QGroundControl.multiVehicleManager.activeVehicle`:

`StandoffController`, `EngagementController`, `EngagementAbortOverlay`,
`VisionEngagementOverlay`, the Set Standoff panel, every custom `GuidedAction*`
button, the tool strip's accent binding, and — visually — the single standoff
surveillance circle and target marker in `FlyViewMap.qml:796-873`.

Two components already do it correctly and serve as the internal precedent:
`TrackerRoiOverlay.qml` and `TargetTrackingOverlay.qml` both take `vehicle` as a
`required property`.

### 1.4 Five findings that dictate the architecture

**F1 — PX4 owns the hold-point geometry; only one wire parameter differs per
vehicle.** On the wire, a three-vehicle ring mission is three single-vehicle
standoffs that differ in `param2` (bearing) alone. The cheapest possible
extension of a proven contract.

**F2 — Arrival is already observable for free.** `standoff.cpp:139-142` calls
`_navigator->request_hold_mode()` exactly once when the terminal pose settles.
The vehicle therefore transitions `nav_state 9 → 3` on arrival. STRATUM needs no
new telemetry and no arrival-detection logic on the vehicle side.

**F3 — The run-in happens at whatever altitude the vehicle is at when Standoff
activates.** `standoff.cpp:238` latches `_approach_alt_amsl` from the current
global position at `begin_sequence()`, and the APPROACH phase publishes that
altitude (unless `STDF_SEQ` folds height into the approach). **This gives
altitude-stratified transit deconfliction with zero firmware change** — climb
each vehicle to its own transit level *before* commit, and the firmware will run
in at that level and only change height once over its slot.

**F4 — Cruising speed is resettable but only after activation.** `on_activation`
calls `reset_cruising_speed()`, and APPROACH republishes its setpoint every cycle
with `cruising_speed = _navigator->get_cruising_speed()` (`standoff.cpp:388`). A
`DO_CHANGE_SPEED` sent *after* `nav_state == 9` is confirmed will therefore take
effect within one navigator cycle. Arrival-time trimming is available without
firmware change — but only in that order.

**F5 — Failsafe defaults are hostile to a multi-vehicle ring.** No custom mode
has bespoke failsafe treatment; all four are bucketed with stock AUTO modes under
the generic `AutoModes` exception bit (`failsafe.cpp:504-542`). With stock
parameters: `NAV_DLL_ACT = 0` — datalink loss triggers **nothing**;
`COM_RCL_EXCEPT = 0` with `NAV_RCL_ACT = 2` — RC loss triggers **RTL**. Three
vehicles executing independent, uncoordinated RTLs from three points on a ring is
precisely the crossing pattern the orchestration layer exists to prevent.

---

## 2. Architectural decisions

Nine decisions. Each states the option space, the choice, and the consequence
that choice imposes.

### D1 — Locus of coordination

*Options*: (a) ground-side orchestration in STRATUM; (b) onboard distributed
coordination between vehicles; (c) hybrid — ground planning, onboard
deconfliction.

**Decision: (a). STRATUM plans and supervises; PX4 executes. No inter-vehicle
link, no onboard awareness of neighbours.**

Rationale. Option (b) requires an inter-vehicle datalink, a shared world model,
and a distributed consensus safety case — that is a programme, not a feature, and
it is unjustified at n=3. Option (c) requires firmware changes to a stack whose
own documentation admits it was never compile-verified in the sandbox that
produced it. Option (a) reuses a proven contract end to end.

Consequence, stated plainly: ground-side coordination promotes the C2 link from a
supervisory element to a mission-critical one. That consequence is *paid off* by
D4 — if separation is guaranteed by geometry rather than by supervision, then
losing the link degrades the mission without endangering the airframes. The link
must not be load-bearing for safety. This is the single most important structural
commitment in this document.

### D2 — Command primitive

*Options*: (a) reuse `DO_STANDOFF` (31010) + `DO_SET_MODE` per vehicle;
(b) upload per-vehicle missions through `MissionManager`; (c) stream offboard
setpoints from STRATUM.

**Decision: (a), with (b) held in reserve for multi-leg routing.**

Option (c) is rejected outright: streaming setpoints from a ground station makes
the radio link an inner control loop, which fails the D1 payoff condition
immediately. Option (b) is over-engineering for a single straight-line run-in, but
the machinery exists and is per-vehicle, so it remains available if terrain or
airspace ever forces routed approaches.

### D3 — Geometry boundary

**Decision: STRATUM owns *ring* geometry and *scheduling*. PX4 owns *hold-point*
geometry and *approach staging*. The boundary is the existing 31010 contract,
unchanged.**

STRATUM computes: the ring from `(target, R, H)`; the per-slot bearing `θ_i`; the
per-vehicle transit level; the commit schedule. STRATUM sends `(target, R, θ_i,
H)` to vehicle *i*. Nothing else crosses the boundary.

This decision is what keeps the change small. The wire contract is untouched. The
firmware is untouched. Three vehicles differ by one float.

### D4 — Transit deconfliction mechanism

*Options*: (a) closed-loop ground-commanded avoidance; (b) altitude
stratification during run-in; (c) strict temporal sequencing (one vehicle at a
time); (d) crossing-free slot assignment.

**Decision: (b) + (d) as the primary mechanism; (c) as an operator-selectable
conservative mode; (a) rejected.**

Option (a) is a control loop that cannot close, and it is worth being explicit
about why. The loop would enforce a metre-class separation criterion using
positions known to roughly ±1–2.5 m per vehicle, sampled at telemetry rate,
transported over a link with variable latency, actuated by a mode change with an
ACK round-trip. The loop delay is comparable to the time a 15 m/s vehicle needs to
traverse the entire keepout volume. Such a controller does not add safety; it adds
a new failure mode that activates precisely when the link is degraded. **STRATUM
will not command avoidance manoeuvres.**

Options (b) and (d) are free, deterministic, and verifiable before the vehicles
leave the ground. §6 develops them.

### D5 — Slot assignment policy

**Decision: STRATUM proposes; the operator disposes. The proposal is the
cyclic-order-preserving assignment that minimises total run-in path length. The
operator may override any assignment. An override that induces a path crossing is
flagged with an advisory, not blocked.**

Rationale. "Optimum" was undefined in the original objectives; this decision
defines it as *minimum total path length subject to a no-crossing constraint*,
which is the objective that also happens to buy deconfliction. At n=3 the
assignment problem is trivially enumerable (6 permutations) — no solver is needed,
and the enumeration cost is nil.

The no-crossing constraint has a clean geometric basis: if slots are assigned so
that the cyclic angular order of the vehicles' launch positions about the target
matches the cyclic order of their assigned slot bearings, straight-line run-ins do
not cross.

### D6 — Separation enforcement semantics

**Decision: the separation function is an advisory monitor that can recommend and,
on operator authorisation, command HOLD. It never commands a manoeuvre. The 1 m
bubble is retained as the hard body keepout but is not the operative criterion.**

§6 defines the operative criterion as an uncertainty-inflated separation minimum,
and moves its enforcement from runtime to *slot-placement time* in the wizard.
Deconfliction becomes a UI constraint, not a controller.

### D7 — Arrival synchronisation

**Decision: v1 achieves time coherence by staggered commit — an open-loop schedule
computed from path length and nominal cruise speed, closed by observation of
actual arrival skew. v2 adds post-activation `DO_CHANGE_SPEED` trim per F4.**

Rationale. Whether simultaneous arrival is a requirement at all is still open
(§10). Staggered commit costs nothing and delivers arrival coherence to within the
accuracy of the cruise-speed estimate — likely a few seconds over a 500 m run-in.
If a tighter number is required operationally, F4 provides the mechanism, and the
strict ordering constraint (speed *after* mode activation) is documented so it is
not discovered the hard way in flight test.

### D8 — Authority and failsafe posture

**Decision: an orchestrated mission cannot reach ARMED until STRATUM has read back
and verified a required failsafe parameter block on every participating vehicle.
Verification failure blocks the mission and names the offending vehicle and
parameter.**

Per F5, the defaults are wrong for this mission. The required block (values to be
ratified in flight test, but the *mechanism* is the decision here):

| Parameter | Required | Why |
|---|---|---|
| `NAV_DLL_ACT` | non-zero (Hold, or RTL with a deconflicted RTL altitude) | A vehicle that loses STRATUM must not continue indefinitely unsupervised. |
| `NAV_RCL_ACT` | Hold, or `COM_RCL_EXCEPT` bit 1 set | Three independent RTLs from a ring is the crossing case. |
| `COM_DLL_EXCEPT` | explicit, not defaulted | Must be a decision, not an accident. |
| `RTL_RETURN_ALT` | per-vehicle, stratified | If RTL is the chosen action, the return legs must be vertically separated by the same discipline as the run-in. |
| `MAV_SYS_ID` | unique across the fleet | See D9. |
| `STDF_SEQ` | 1 or 3 (`approach_with_height = false`) | F3 — folding height into the approach destroys the transit-level stratification. |

That last row is not a preference. `STDF_SEQ ∈ {2, 4}` sets
`approach_with_height = true`, which makes the run-in climb toward the hold
altitude *during* the horizontal translation — collapsing the vertical separation
that D4 depends on. **`STDF_SEQ` is a deconfliction-critical parameter and must
be verified, not assumed.**

### D9 — Vehicle identity provisioning

**Decision: `MAV_SYS_ID` is a per-airframe configuration item under production
control. STRATUM detects and refuses a colliding fleet.**

`MAV_SYS_ID` defaults to 1 and is unmanaged in the fork; nothing auto-assigns it.
`MultiVehicleManager` dedupes by `vehicleId`, so two Daggers shipped with the
default will present as **one** vehicle — the second simply never appears. This is
a silent failure that looks like a radio problem and is not one. It belongs in the
production build and acceptance-test procedure, not in software.

---

## 3. Entity model

```
OrchestrationMission
  ├── 1 Target                (QGeoCoordinate)
  ├── 1 StandoffRing          (radius R, height H, derived from Target)
  ├── 3 RingSlot              (bearing θ, transitLevel, state)
  ├── 3 VehicleAgent          (Vehicle*, RingSlot, agent FSM)
  ├── 1 CommitSchedule        (ordered (agent, t_offset) pairs)
  └── 1 SeparationMonitor     (pairwise, over the live agent set)
```

Relationships and their cardinalities:

- A mission designates exactly one target. Multi-target is out of scope and is a
  different architecture, not a bigger one.
- `StandoffRing` is a *derived* entity — a function of `(Target, R, H)`. It is
  never stored independently, so it can never disagree with the target.
- `RingSlot ↔ VehicleAgent` is a bijection. An unassigned slot does not exist; an
  unassigned vehicle is not an agent.
- `SeparationMonitor` is the only entity with visibility across agents. Separation
  is an **emergent property of the ensemble**, and this is the only component that
  can observe the ensemble. Nothing else in the system may make a separation
  claim.

---

## 4. Component architecture

### 4.1 New C++ module — `qgroundcontrol/src/Orchestration/`

| Class | Responsibility |
|---|---|
| `OrchestrationManager` | QML singleton (`QGroundControl.orchestration`). Owns the mission, the agent set, and the mission FSM. Subscribes to `MultiVehicleManager::vehicleAdded/Removed`. |
| `StandoffRing` | Target, radius, height. Computes slot coordinates for display. Enforces `θ_min` (§6). |
| `RingSlot` | Bearing, transit level, assigned agent, slot state. `QObject` for QML binding. |
| `VehicleAgent` | Pins one `Vehicle*` for its life (never reads `activeVehicle`). Owns the per-vehicle FSM. Issues commands through the existing per-vehicle API. Observes `nav_state`, `coordinate`, `altitudeAMSL`, `gpsFactGroup.horizontalAccuracy`. |
| `SlotAssignmentSolver` | Enumerates the ≤6 permutations, scores by total path length, filters by the cyclic-order constraint. |
| `TransitPlanner` | Allocates transit levels, computes path lengths and estimated run-in durations, produces the `CommitSchedule`. |
| `FailsafeVerifier` | Reads back the D8 parameter block per vehicle; gates ARM. |
| `SeparationMonitor` | Pairwise predicted separation with uncertainty inflation; emits advisories. Commands nothing. |

Registration follows the fork's established pattern: `add_subdirectory(Orchestration)`
plus a `target_link_libraries` entry in `src/CMakeLists.txt`, and a `Q_PROPERTY`
on `QGroundControlQmlGlobal` alongside `multiVehicleManager`.

### 4.2 New QML — `qgroundcontrol/src/FlyView/Orchestration/`

| File | Responsibility |
|---|---|
| `OrchestrationWizard.qml` | Five-page flow: Target → Ring → Slots → Assignment review → Commit. |
| `RingEditorOverlay.qml` | Map layer: ring, draggable slot handles, live `θ_min` feedback, per-slot vehicle badge. |
| `AssignmentReviewPanel.qml` | Proposed assignment, path lengths, transit levels, estimated arrival skew, crossing advisories. |
| `OrchestrationStatusStrip.qml` | Three lanes, one per agent: state, slot, altitude, link health, hAcc. |
| `SeparationAdvisoryOverlay.qml` | Advisory banner + one-touch HOLD ALL. |
| `FlyViewOrchestrationAction.qml` | Tool-strip entry, added to `FlyViewToolStripActionList.qml`. |

### 4.3 What is *not* changed

The existing `StandoffController`, `EngagementController` and the Set Standoff
panel are untouched and remain the single-vehicle path. The orchestration layer
is strictly additive: it iterates its own agent set and calls the same per-vehicle
`Vehicle` API the singletons call. No existing behaviour regresses, and the
single-vehicle capability that works today keeps working exactly as it does.

---

## 5. Behavioural architecture

### 5.1 Mission state machine

```
IDLE ─▶ DEFINING_RING ─▶ ASSIGNING_SLOTS ─▶ PLAN_REVIEW ─▶ PREFLIGHT
                                    ▲                          │
                                    └──────── (edit) ──────────┤
                                                               ▼
                                                          EXECUTING
                                                               │
                                                               ▼
                                    ┌──────────────────── ON_STATION
                                    │                          │
                              RESLOTTING ◀────────────────────┤
                                                               ▼
                                                          TERMINATING
```

`DEGRADED` is an orthogonal flag, not a state: it is raised whenever any agent
leaves its nominal lane, and it changes what the operator is shown without
changing what the mission is doing.

### 5.2 Agent state machine

```
UNASSIGNED ─▶ ASSIGNED ─▶ PREFLIGHT ─▶ LAUNCH_QUEUED ─▶ TAKEOFF
                                                            │
                                             CLIMB_TO_TRANSIT_LEVEL
                                                            │
                                                   COMMIT_QUEUED
                                                            │
                                              STANDOFF_COMMANDED
                                                            │
                                                        RUN_IN        (nav_state == 9)
                                                            │
                                                     ON_STATION       (nav_state 9→3)
                                                            │
                              ┌──────────────┬──────────────┼──────────────┐
                           HOLD          RESLOT           RTL         LINK_LOST
```

`PREFLIGHT` gates on: armable; GPS fix and `horizontalAccuracy` within the
mission's separation budget; home position set; D8 parameter block verified;
`MAV_SYS_ID` unique.

### 5.3 Commit sequence — one agent

1. `guidedModeTakeoff(transitLevel_i)`; await `altitudeRelative` within tolerance.
   (Alternatively, if already airborne, `guidedModeChangeAltitude` to the level.)
2. `sendMavCommandIntWithHandler(31010, GLOBAL_RELATIVE_ALT, p1=R, p2=θ_i, p3=0,
   p4=NaN, x=target.lat, y=target.lon, z=H)`; await `MAV_RESULT_ACCEPTED`.
3. Set flight mode → `DO_SET_MODE(main=4, sub=20)`; await `nav_state == 9`
   confirmed in `HEARTBEAT.custom_mode`, with bounded retry.
4. *(v2 only)* `DO_CHANGE_SPEED` — **after** step 3, never before (F4).
5. Observe `nav_state 9 → 3`, then confirm the arrival predicate before declaring
   `ON_STATION`.

Geometry precedes mode selection. PX4 tolerates either order, but a mode entered
with no target holds position — a benign but confusing state that is trivially
avoided.

### 5.4 Arrival predicate

The `9 → 3` transition alone is not sufficient, because a vehicle can reach Hold
by other routes (operator action, a failsafe). `ON_STATION` requires all three:

1. `nav_state` transitioned `9 → 3`, **and**
2. horizontal distance to the computed slot coordinate < `NAV_ACC_RAD`, **and**
3. `|altitudeAMSL − (home_alt + H)| <` altitude acceptance.

Belt and braces, at zero cost.

### 5.5 Re-slotting

An `ON_STATION` vehicle is in Hold, not Standoff. Re-slotting therefore repeats
the full commit sequence with the new bearing. A vehicle still in `RUN_IN` can be
re-slotted by sending a fresh 31010 alone — `standoff.cpp:117-121` restarts the
staged manoeuvre from phase 1 on any new setpoint — but note that this replays the
in-place yaw, which will look abrupt to an operator watching the video. Prefer
re-slotting from Hold.

---

## 6. Deconfliction architecture

### 6.1 Reframing the problem

The 1 m bubble was specified as a station-keeping guard. The geometry says it is
not needed there.

Chord separation between two slots on a ring of radius `R` separated by angle `θ`
is `2R·sin(θ/2)`. For three evenly spaced vehicles (`θ = 120°`) the separation is
`1.73·R` — 519 m on a 300 m ring, 87 m even on a 50 m ring. For two slots to come
within 5 m of each other on a 300 m ring they would have to be placed less than
one degree apart.

**The terminal state is deconflicted by ring geometry. The conflict lives entirely
in the transit phase — and specifically near the launch point, where three
vehicles may depart from within tens of metres of one another.** Any architecture
that spends its effort on station-keeping separation is solving the wrong problem.

### 6.2 Layer 1 — structural, at slot-placement time

The wizard enforces a minimum angular separation, computed from the operative
separation minimum `R_req` and the ring radius:

```
θ_min = 2 · asin( R_req / (2R) )
```

Slot handles cannot be dragged closer than `θ_min`. Deconfliction of the terminal
state is therefore a **UI constraint evaluated before flight**, not a runtime
controller. It cannot fail in the air because it has already succeeded on the
ground.

### 6.3 Layer 2 — vertical stratification during transit

Each agent is assigned a distinct transit level:

```
transitLevel_i = base + i · ΔH,    ΔH ≥ 10 m
```

Per F3, the firmware's APPROACH phase flies at the altitude latched when Standoff
activates. Climb each vehicle to its own level *before* commit and the run-ins are
vertically separated by construction, whatever their lateral paths do. The HEIGHT
phase then brings each vehicle to the common hold altitude `H` only once it is
over its own slot — by which point Layer 1 guarantees the lateral separation.

`ΔH = 10 m` is chosen against a metre-class vertical position budget with wide
margin. This layer is the workhorse, and it costs one extra climb command per
vehicle.

*Precondition:* `STDF_SEQ ∈ {1, 3}`. See D8.

### 6.4 Layer 3 — assignment and schedule

Cyclic-order-preserving assignment (D5) removes lateral crossings for
straight-line run-ins. Staggered commit (D7) separates departures in time. Neither
costs anything; both are computed in the planner before commit.

### 6.5 Layer 4 — the monitor, and what the bubble actually is

The operative separation minimum is not a constant. It is:

```
R_req(i,j) = R_body + k · ( hAcc_i + hAcc_j )
```

where `R_body` is the 1 m hard keepout, `hAcc` is each vehicle's reported GNSS
horizontal accuracy — **already available in STRATUM as
`vehicle.gpsFactGroup.horizontalAccuracy` from the `GPS_RAW_INT` extension
fields** — and `k` is a confidence multiplier (2 for ~95%). With typical
`hAcc ≈ 1.5 m` this yields `R_req ≈ 7 m`, seven times the nominal bubble.

That the operative minimum is seven times the specified bubble is not a criticism
of the specification; it is the reason the bubble cannot be the enforcement
mechanism. A criterion smaller than the measurement noise generates alarms, not
safety.

`SeparationMonitor` therefore:

- computes pairwise predicted separation over a short horizon from position and
  velocity;
- inflates by `R_req(i,j)`;
- raises an **advisory** on predicted breach, naming the pair and the time to
  closest approach;
- offers the operator a single **HOLD ALL** action, which is a mode change PX4
  supports natively;
- degrades to advisory-only, with the affected agents marked, when `hAcc` is
  stale or absent — it never silently substitutes an optimistic value.

It commands nothing autonomously. Per D6, that is deliberate.

---

## 7. Failure and degraded modes

| Event | Behaviour |
|---|---|
| One vehicle fails PREFLIGHT | Mission blocks; operator may de-scope to two vehicles and re-plan, or clear the fault. Slots are not silently reassigned. |
| Link loss to one vehicle mid-transit | Agent → `LINK_LOST`. The vehicle continues its firmware-owned run-in and settles into Hold on its own slot — **safe, because the run-in was deconflicted before commit and does not depend on supervision.** This is the D1 payoff being collected. STRATUM alerts and marks the ensemble DEGRADED. |
| Link loss to all vehicles | Each vehicle completes and holds. `NAV_DLL_ACT` (D8) governs what happens after the configured timeout. This must be an explicit decision, not the stock default of nothing. |
| One vehicle aborts / RTLs mid-transit | Remaining agents continue as briefed. The ring is **not** re-solved automatically — re-spacing two survivors is a re-commit under uncertainty, and it is an operator decision. STRATUM offers the re-plan; it does not take it. |
| Separation advisory | Advisory to operator; HOLD ALL offered. No autonomous manoeuvre. |
| GNSS accuracy degradation | `R_req` grows; the monitor may raise an advisory on a geometry that was compliant at commit. This is correct behaviour and the operator is told why. |
| Battery failsafe on one vehicle | Uncoordinated by design — no mode-aware deferral exists in the firmware. STRATUM must display remaining-endurance per agent so the operator sees it coming. |

---

## 8. Firmware deltas required

**For v1: none.**

The entire architecture rides on the existing 31010 contract, the existing
Standoff mode, the existing `request_hold_mode()` hand-off, and the existing
`STDF_SEQ` staging. That is the strongest argument for this design.

Non-blocking firmware candidates, for later consideration:

- A sequence/echo identifier on `standoff_setpoint` would let STRATUM confirm
  *which* setpoint a vehicle is flying, not merely that one was accepted. Useful
  when re-slotting under a degraded link.
- The asymmetry between `EngagementDive` (no self-abort on target loss — it levels
  and waits) and `VisionEngagement` (self-aborts to nav_state 16) should be
  resolved before any multi-vehicle engagement is contemplated.

---

## 9. Implementation staging

| Stage | Content | Exit criterion |
|---|---|---|
| **S0** | Multi-instance SITL bring-up; three PX4 instances with distinct `MAV_SYS_ID` presenting as three vehicles in STRATUM. | Three vehicles visible, independently commandable via the existing single-vehicle path. |
| **S1** | `Orchestration` C++ module skeleton: manager, agents, ring, slots. No UI beyond a debug panel. | Three agents pinned to three vehicles; three concurrent standoffs commanded from code, arriving on three bearings. |
| **S2** | Planner: assignment solver, transit levels, commit schedule, `FailsafeVerifier`. | Deconflicted three-vehicle run-in in SITL, verified by log analysis of pairwise separation. |
| **S3** | Wizard and map UI; `θ_min` constraint; status strip. | Operator can fly the mission end to end without touching the debug panel. |
| **S4** | `SeparationMonitor`, advisories, HOLD ALL, degraded-mode handling. | Injected-fault matrix passes (link loss, preflight failure, mid-transit abort). |
| **S5** | Flight test. | Three-vehicle ring flown; measured minimum separation and arrival skew recorded against prediction. |

S0 through S2 carry the technical risk. S3 onward is execution.

---

## 10. Open decisions requiring your ruling

These are not gaps in the architecture; they are the places where the
architecture is deliberately parameterised pending an operational answer.

1. **Common or per-slot hold height?** The architecture assumes a common `H` with
   distinct *transit* levels. Per-slot heights are trivially supported (the wire
   contract already carries `z` per vehicle) but change the sensor geometry and
   the endurance picture. Which does the mission want?
2. **Is arrival skew a requirement with a number?** If "all three on station
   within `T` seconds" is a real operational constraint, state `T` and v2 speed
   trim becomes S3 work rather than deferred.
3. **Launch topology — single pad or dispersed?** This drives the takeoff
   sequencing hard. Three vehicles from one pad requires departure separation in
   time as well as altitude; three dispersed launch points make the cyclic-order
   assignment materially more useful.
4. **On losing a vehicle mid-mission, does the ring re-solve?** The architecture
   defaults to *hold as briefed, offer the re-plan*. Automatic re-spacing is
   implementable but is a re-commit under degraded conditions.
5. **Does an orchestrated standoff ever transition to engagement?** This is the
   scoping question that matters most. The engagement modes exist in the firmware
   and in STRATUM's UI. Multi-vehicle coordination *plus* terminal engagement is a
   materially heavier safety case — a different authorisation chain, a different
   abort architecture, and a different verification burden. It should be either
   scoped in now with eyes open, or explicitly excluded from this subsystem's
   remit. It should not be left to arrive by accident because both capabilities
   happen to live in the same application.

---

## 11. Risk register

| # | Risk | Class | Mitigation |
|---|---|---|---|
| R1 | `MAV_SYS_ID` collision across shipped airframes — second vehicle silently never appears | Production configuration | D9; per-airframe config item in the build and acceptance procedure; STRATUM detects and refuses |
| R2 | `NAV_DLL_ACT = 0` default — datalink loss triggers nothing | Systemic, latent | D8 verified parameter block gates ARM |
| R3 | `NAV_RCL_ACT = 2` default — three uncoordinated RTLs from a ring | Systemic, emergent | D8; stratified `RTL_RETURN_ALT` if RTL is retained |
| R4 | `STDF_SEQ ∈ {2,4}` silently collapses transit stratification | Design-coupling | D8 makes `STDF_SEQ` deconfliction-critical and verified |
| R5 | Custom MAVLink IDs 42001–42006 are a project-local allocation | Interoperability | Accept for now; document; revisit before any mixed-dialect fleet |
| R6 | The custom firmware modes were statically reviewed but, by their own documentation, never compile-verified in the environment that produced them | Process | S0 exit criterion is a real multi-instance SITL run, not a static argument |
| R7 | `EngagementDive` has no self-abort on target loss, unlike `VisionEngagement` | Safety asymmetry | Out of scope for v1; blocking for any multi-vehicle engagement (§10.5) |

---

## 12. Summary of the argument

The scan changed three things about the design.

Because PX4 owns the standoff geometry, STRATUM does not need a trajectory
generator; it needs a *scheduler* and a *constraint*. Because the firmware latches
the run-in altitude at mode activation, vertical deconfliction is available for
the price of one climb command. And because the ring geometry separates the
terminal stations by hundreds of metres, the 1 m bubble was guarding the one phase
of flight that was never in danger.

The remaining risk is not in the flight geometry. It is in the failsafe parameter
block, where the stock defaults would have three vehicles making independent,
uncoordinated decisions at exactly the moment the ground station stops watching.

Decisions dictate destiny.
