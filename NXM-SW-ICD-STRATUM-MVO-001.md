# STRATUM Multi-Vehicle Orchestration — Interface Contract

**Document** NXM-SW-ICD-STRATUM-MVO-001
**Revision** v0.1 — 2026-09-17
**Governs** The seams between the new `Orchestration` subsystem and the existing STRATUM-Desktop application
**Companion to** NXM-SW-ARCH-STRATUM-MVO-001 (`ORCHESTRATION_ARCHITECTURE.md`) — the architecture; this document is the contract that makes it buildable
**Baseline pinned** STRATUM-Desktop @ `4095ba3`; matching firmware PX4-Autopilot-NX (Standoff = nav_state 9 / custom sub-mode 20)
**Audience** The software agent(s) implementing the subsystem, and their reviewers

---

## 0. What this document is, and how to read it

An architecture states what to build. An interface contract states where the new code is *allowed to touch the old code*, and what each seam guarantees. It exists because the orchestration subsystem is strictly additive — it earns its safety case from the fact that it changes nothing beneath the QML layer — and an additive design is only additive if the seams are named and honoured. This document names them.

A contract has two sides. The **consumed contract** (§2) is the existing STRATUM/QGroundControl surface the new modules may call — pinned to real, verified signatures at `4095ba3`, because an interface you cannot compile against is a wish, not a contract. The **provided contract** (§3–§6) is the surface the new modules expose to each other and to QML. Between them sit the value types (§4), the state enumerations (§5), and the interaction sequences (§7) that are themselves contracts — a command ordering that must not be reordered is an interface as surely as a function signature.

Read §1 first: it is the rule of engagement. It is short and it is binding.

Terms — Target, standoff ring, ring slot, transit level, agent, commit, separation bubble, deconfliction by construction — are defined in NXM-SW-ARCH-STRATUM-MVO-001 §0 and are used here without redefinition. Where this document adds a term, it is defined at first use.

---

## 1. Rules of engagement (binding on every increment)

These are not style preferences. Each one is a load-bearing member of the safety argument; violating one silently converts an additive feature into a regression of a capability that flies today.

**RE1 — Additive only.** No existing file under `src/FlyView/` that implements the single-vehicle path may change behaviour. `StandoffController.qml`, `EngagementController.qml`, the Set Standoff panel, and every `GuidedAction*` component remain the single-vehicle path and remain bound to `QGroundControl.multiVehicleManager.activeVehicle`. The orchestration layer is new files that iterate their *own* agent set. If an increment cannot be built without editing a single-vehicle file, stop and escalate — that is a contract change, not an implementation detail.

**RE2 — Never read `activeVehicle` inside orchestration.** A `VehicleAgent` pins one `Vehicle*` for its entire life. The single most common way this subsystem can fail is for a piece of orchestration code to reach for `QGroundControl.multiVehicleManager.activeVehicle` out of habit and command the wrong airframe. The precedent to copy is `TrackerRoiOverlay.qml` / `TargetTrackingOverlay.qml`, which take `vehicle` as a `required property`. Every orchestration QML component follows that precedent; every orchestration C++ object holds its `Vehicle*` as a member.

**RE3 — The wire contract is frozen.** Command 31010 (`MAV_CMD_USER_1` / DO_STANDOFF), frame `MAV_FRAME_GLOBAL_RELATIVE_ALT`, param layout `(p1=distance, p2=bearing, p3=0, p4=NaN, x=lat, y=lon, z=relHeight)` is the boundary between STRATUM and PX4 and does not move (architecture D3). No orchestration increment introduces a new MAVLink command, a new custom mode, or a firmware change. v1 firmware delta is zero.

**RE4 — Ground never closes an inner loop.** STRATUM plans and supervises; PX4 executes (architecture D1). No orchestration code streams setpoints, and no orchestration code commands an avoidance manoeuvre. The `SeparationMonitor` advises; it does not actuate. The only autonomous mode change the subsystem may issue is operator-authorised HOLD ALL. This is the payoff condition for D1: if the subsystem never makes the link load-bearing for safety, then losing the link degrades the mission without endangering the airframes.

**RE5 — Geometry precedes mode.** For any single commit, the 31010 setpoint is sent and ACK-confirmed *before* the mode switch to Standoff. And speed trim, where used, is sent *after* mode activation is confirmed, never before (architecture F4). These orderings are firmware-coupled facts, not conventions; §7 states them as a sequence contract.

**RE6 — ARM is gated.** No orchestrated mission reaches ARMED until `FailsafeVerifier` has read back and confirmed the D8 parameter block on every participating vehicle and confirmed `MAV_SYS_ID` uniqueness across the fleet. A verification failure blocks the mission and names the vehicle and the parameter. This gate is not optional and not deferrable to "later hardening."

**RE7 — Registration follows the fork's existing idioms.** New C++ lives in a new module registered by `add_subdirectory` in `src/CMakeLists.txt`. New QML is added to the existing `qt_add_qml_module` file list. The QML singleton is exposed by a `Q_PROPERTY` on `QGroundControlQmlGlobal` alongside `multiVehicleManager`. No new registration mechanism is invented. §9 gives the exact edits.

---

## 2. Consumed contract — the existing surface the modules bind to

This is the surface the orchestration subsystem is *permitted* to call. Signatures are verified against the `4095ba3` headers. If any signature below has drifted by the time an increment is implemented, the drift is the first thing to reconcile — treat this section as the compile-time truth the build depends on.

### 2.1 Fleet enumeration — `MultiVehicleManager`

Reached in QML as `QGroundControl.multiVehicleManager`; in C++ via the same singleton. Stock and unmodified; `multiVehicleEnabled()` is already `true`. Multi-vehicle instantiation is live today — the subsystem consumes it, it does not enable it.

| Member | Signature | Use by orchestration |
|---|---|---|
| `vehicles` | `QmlObjectListModel* vehicles()` (`Q_PROPERTY`, CONSTANT) | The authoritative live vehicle set. `OrchestrationManager` iterates it to build agents. |
| `vehicleAdded` | `void vehicleAdded(Vehicle* vehicle)` (signal) | `OrchestrationManager` subscribes; a newly-appeared airframe becomes assignable. |
| `vehicleRemoved` | `void vehicleRemoved(Vehicle* vehicle)` (signal) | `OrchestrationManager` subscribes; drives an agent to `LINK_LOST`/teardown. |
| `getVehicleById` | `Q_INVOKABLE Vehicle* getVehicleById(int vehicleId) const` | Resolve a persisted assignment back to a live `Vehicle*`. |
| `activeVehicle` | `Vehicle* activeVehicle()` (`Q_PROPERTY`) | **Read only for the single-vehicle path. Off-limits to orchestration internals — see RE2.** |

Note (architecture D9 / R1): `MultiVehicleManager` dedupes by `vehicleId`. Two airframes shipped with the default `MAV_SYS_ID = 1` present as **one** vehicle — the second never appears. This is a silent failure that mimics a radio fault. It is detected by `FailsafeVerifier`, not worked around in the manager.

### 2.2 Per-vehicle command surface — `Vehicle` (guided API)

Each is `Q_INVOKABLE` on `Vehicle`; each is scoped to that one vehicle's `MavCommandQueue` (constructed per-`Vehicle`, three retries, ACK-matched). Three concurrent calls against three `Vehicle*` are safe by construction — no new queuing infrastructure is added.

| Method | Verified signature | Role in commit |
|---|---|---|
| `guidedModeTakeoff` | `Q_INVOKABLE void guidedModeTakeoff(double altitudeRelative)` | Launch to the agent's transit level. |
| `guidedModeChangeAltitude` | `Q_INVOKABLE void guidedModeChangeAltitude(double altitudeChange, bool pauseVehicle)` | Climb an already-airborne vehicle to its transit level (relative change). |
| `guidedModeStandoff` | `Q_INVOKABLE bool guidedModeStandoff(const QGeoCoordinate& targetCoord, double distanceMeters, double bearingDegrees, double relativeHeight)` | The one-line multi-vehicle primitive. Internally emits 31010 with `showError=true` (no result callback). See §7 note on ACK. |
| `flightMode` (write) | `Q_PROPERTY QString flightMode ... WRITE setFlightMode`; string `"Standoff"` | Switches into Standoff (`DO_SET_MODE main=4, sub=20`). Set **after** the 31010 setpoint (RE5). |
| `guidedModeChangeGroundSpeedMetersSecond` | `Q_INVOKABLE void guidedModeChangeGroundSpeedMetersSecond(double groundspeed)` | v2 arrival-skew trim. Issue **only after** `nav_state == 9` confirmed (architecture F4). |
| `guidedModeRTL` | `Q_INVOKABLE void guidedModeRTL(bool smartRTL)` | Operator-directed per-agent RTL. Never issued autonomously by the monitor. |
| `sendMavCommandIntWithHandler` | `void sendMavCommandIntWithHandler(const MavCmdAckHandlerInfo_t* ackHandlerInfo, int compId, MAV_CMD command, MAV_FRAME frame, float p1, float p2, float p3, float p4, double p5, double p6, float p7)` | The ACK-matched path for 31010 when the agent needs to key its FSM on `MAV_RESULT_ACCEPTED` rather than fire-and-forget. Preferred inside `VehicleAgent` over the bare `guidedModeStandoff` for exactly that reason. |
| `defaultComponentId` | `int defaultComponentId() const` | Target component for the 31010 COMMAND_INT. |

Wire contract for the ACK-matched 31010, reproduced from `PX4FirmwarePlugin::guidedModeStandoff` so the agent can issue it directly:

```
command = MAV_CMD_USER_1 (31010)      // DO_STANDOFF
frame   = MAV_FRAME_GLOBAL_RELATIVE_ALT   // mandatory; a local frame corrupts lat/lon scaling
p1 = distanceMeters                    // R
p2 = bearingDegrees                    // θ_i  (0 = North, CW, target -> hold point)
p3 = 0
p4 = NaN                               // PX4 chooses yaw; it faces the target
p5 = target.latitude                   // scaled to 1e7 int by the COMMAND_INT path
p6 = target.longitude
p7 = relativeHeight                    // H above home; PX4 adds home altitude
```

### 2.3 Per-vehicle telemetry surface — facts the agent observes

All per-`Vehicle`, all live for three vehicles with no plumbing. Access in C++ via the `Fact*` accessors; in QML via the fact-group properties.

| Fact | Location | Type / units | Consumed for |
|---|---|---|---|
| `flightMode` | `Vehicle::flightMode()` | `QString` (`"Standoff"`, `"Hold"`, …) | Human-readable mode; agent FSM secondary check. |
| `customMode` | `Vehicle::customMode()` → `uint32_t` | PX4 packed custom mode | Primary source of `nav_state`; decode to confirm `9` (Standoff) and the `9→3` transition (Hold). |
| `coordinate` | `Q_PROPERTY QGeoCoordinate coordinate` | lat/lon | Live position for `SeparationMonitor` and the arrival predicate. |
| `altitudeAMSL` | `VehicleFactGroup::altitudeAMSL()` (`Fact*`, double, metres) | AMSL altitude | Transit-level confirmation; arrival predicate altitude check. |
| `altitudeRelative` | `VehicleFactGroup::altitudeRelative()` (`Fact*`, double, metres) | Height above home | Takeoff/climb completion check. |
| `gps.horizontalAccuracy` | `VehicleGPSFactGroup::horizontalAccuracy()` (`Fact*`, metres) | GNSS hAcc (from `GPS_RAW_INT` ext. fields) | The `R_req` inflation term in the separation criterion (§4.6, architecture §6.5). |
| `gps.lock` / `gps.count` | `VehicleGPSFactGroup` | fix type / sat count | PREFLIGHT gate. |
| `homePosition` | `Q_PROPERTY QGeoCoordinate homePosition` | lat/lon | PREFLIGHT gate ("home set"); slot-coordinate reference. |
| `armed` | `Q_PROPERTY bool armed` | bool | Mission state; ARM gate interlock. |
| `id` | `Q_PROPERTY int id` | int | Stable per-vehicle identity for assignment persistence. |

### 2.4 Parameter surface — `ParameterManager`

Reached as `vehicle->parameterManager()` (`Q_PROPERTY parameterManager`, CONSTANT). Used exclusively by `FailsafeVerifier`.

| Member | Signature | Use |
|---|---|---|
| `parameterExists` | `bool parameterExists(int componentId, const QString& paramName) const` | Guard before read. |
| `getParameter` | `Fact* getParameter(int componentId, const QString& paramName)` | Read back the D8 block (`NAV_DLL_ACT`, `NAV_RCL_ACT`, `COM_DLL_EXCEPT`, `COM_RCL_EXCEPT`, `RTL_RETURN_ALT`, `STDF_SEQ`, `MAV_SYS_ID`). |
| `refreshAllParameters` | `Q_INVOKABLE void refreshAllParameters()` | Force a re-read if the cache is cold at PREFLIGHT. |

`STDF_SEQ` is deconfliction-critical (architecture D8/R4): values `{2,4}` set `approach_with_height = true` and collapse the transit-level stratification D4 depends on. The verifier requires `STDF_SEQ ∈ {1,3}` and treats any other value as a hard PREFLIGHT failure.

### 2.5 What the consumed contract deliberately excludes

`MissionManager` (per-vehicle mission upload) is *available* but out of scope for v1 (architecture D2 holds it in reserve for multi-leg routing). No orchestration increment uploads a mission. If terrain ever forces routed run-ins, that is a contract amendment, not a silent extension.

---

## 3. Provided contract — new C++ modules

New module root: `qgroundcontrol/src/Orchestration/`. Each class below states its responsibility, the public surface other code binds to, its invariants, and what it consumes. The public surface is the contract; private implementation is the agent's latitude. Signatures are the intended shape — the agent may refine parameter spelling, but not the responsibilities, the invariants, or the seam.

### 3.1 `OrchestrationManager` — the singleton and mission owner

Exposed to QML as `QGroundControl.orchestration` (§9). Owns the single active `OrchestrationMission`, the agent set, and the mission FSM.

```
class OrchestrationManager : public QObject {
    // --- QML surface ---
    Q_PROPERTY(MissionState        missionState     READ missionState                 NOTIFY missionStateChanged)
    Q_PROPERTY(OrchestrationMission* mission        READ mission                      NOTIFY missionChanged)
    Q_PROPERTY(QmlObjectListModel* agents           READ agents                       CONSTANT)   // VehicleAgent*
    Q_PROPERTY(StandoffRing*       ring             READ ring                         NOTIFY ringChanged)
    Q_PROPERTY(bool                degraded         READ degraded                     NOTIFY degradedChanged)
    Q_PROPERTY(bool                armable          READ armable                      NOTIFY armableChanged)

    // --- operator intent (wizard-driven) ---
    Q_INVOKABLE void beginMission();                                   // IDLE -> DEFINING_RING
    Q_INVOKABLE void setTarget(const QGeoCoordinate& target);
    Q_INVOKABLE void setRing(double radiusMeters, double heightMeters);
    Q_INVOKABLE void proposeAssignment();                             // runs SlotAssignmentSolver
    Q_INVOKABLE bool assignVehicleToSlot(int vehicleId, int slotIndex); // operator override; returns false + advisory on crossing
    Q_INVOKABLE void reviewPlan();                                     // ASSIGNING_SLOTS -> PLAN_REVIEW
    Q_INVOKABLE void runPreflight();                                   // PLAN_REVIEW -> PREFLIGHT (invokes FailsafeVerifier)
    Q_INVOKABLE void execute();                                        // PREFLIGHT -> EXECUTING (guarded by armable)
    Q_INVOKABLE void holdAll();                                        // operator-authorised; every agent -> Hold
    Q_INVOKABLE void terminate();                                     // -> TERMINATING
    Q_INVOKABLE void reslot(int vehicleId, double newBearingDeg);      // ON_STATION re-commit

    // --- signals ---
    void missionStateChanged(MissionState s);
    void degradedChanged(bool degraded);
    void advisory(const OrchestrationAdvisory& a);                    // surfaced to the operator; never actuated
};
```

Invariants:
- Exactly one mission and one target at a time. Multi-target is a different architecture (architecture §3), rejected here.
- Subscribes to `MultiVehicleManager::vehicleAdded/vehicleRemoved` for its whole life; the agent set tracks the fleet.
- `armable` is false until `FailsafeVerifier` has passed every participating vehicle (RE6). `execute()` is a no-op while `!armable`.
- Never holds or reads `activeVehicle` (RE2).

Consumes: §2.1 (fleet), §3.2–§3.8 (its own components).

### 3.2 `VehicleAgent` — one vehicle, one slot, one FSM

The unit of orchestration. Pins its `Vehicle*` at construction and never lets go.

```
class VehicleAgent : public QObject {
    Q_PROPERTY(Vehicle*     vehicle       READ vehicle       CONSTANT)   // pinned for life (RE2)
    Q_PROPERTY(AgentState   state         READ state         NOTIFY stateChanged)
    Q_PROPERTY(RingSlot*    slot          READ slot          NOTIFY slotChanged)
    Q_PROPERTY(double       transitLevel  READ transitLevel  NOTIFY transitLevelChanged)   // AMSL, metres
    Q_PROPERTY(double       runInLengthM  READ runInLengthM  NOTIFY planChanged)
    Q_PROPERTY(double       etaSeconds    READ etaSeconds    NOTIFY planChanged)
    Q_PROPERTY(bool         linkHealthy   READ linkHealthy   NOTIFY linkHealthyChanged)

    // driven by OrchestrationManager, not by the operator directly
    void assignSlot(RingSlot* slot);
    void beginCommit();          // executes the §7 commit sequence for this one agent
    void hold();                 // -> Hold (operator-authorised path only)
    void abortToRtl();           // operator-directed RTL

    void stateChanged(AgentState s);
    void onStation();            // arrival predicate satisfied (§7.4)
};
```

Invariants:
- `vehicle` is set once and is immutable. If the pinned `Vehicle*` is removed from the fleet, the agent transitions to `LINK_LOST` and is torn down by the manager; it never re-points at a different vehicle.
- Issues commands only through the §2.2 per-vehicle API on its own `vehicle`.
- Observes only its own `vehicle`'s facts (§2.3).
- Makes no separation claim. Separation is the `SeparationMonitor`'s sole province (architecture §3).

### 3.3 `StandoffRing` — derived geometry

```
class StandoffRing : public QObject {
    Q_PROPERTY(QGeoCoordinate target   READ target   NOTIFY changed)
    Q_PROPERTY(double         radiusM  READ radiusM  NOTIFY changed)   // R
    Q_PROPERTY(double         heightM  READ heightM  NOTIFY changed)   // H above home
    Q_PROPERTY(double         thetaMinDeg READ thetaMinDeg NOTIFY changed)  // enforced slot spacing (§4)

    Q_INVOKABLE QGeoCoordinate slotCoordinate(double bearingDeg) const;   // target.atDistanceAndAzimuth(R, θ)
    Q_INVOKABLE bool           bearingAllowed(double bearingDeg, const QList<double>& others) const;
};
```

Invariant: the ring is a pure function of `(target, R, H)` and is never stored as an independent geometry. It cannot disagree with the target because it is computed from it (architecture §3).

`thetaMinDeg = 2·asin( R_req / (2·R) )` (architecture §6.2). This is the structural, pre-flight deconfliction of the terminal state.

### 3.4 `RingSlot`

```
class RingSlot : public QObject {
    Q_PROPERTY(double       bearingDeg   READ bearingDeg   WRITE setBearingDeg  NOTIFY changed)  // θ
    Q_PROPERTY(double       transitLevel READ transitLevel                      NOTIFY changed)  // AMSL, metres
    Q_PROPERTY(VehicleAgent* agent       READ agent                             NOTIFY changed)  // bijection
    Q_PROPERTY(SlotState    slotState    READ slotState                         NOTIFY changed)
};
```

Invariant: `RingSlot ↔ VehicleAgent` is a bijection (architecture §3). An unassigned slot does not exist; an unassigned vehicle is not an agent. `setBearingDeg` refuses a value that violates `thetaMinDeg` against the other assigned slots and emits an advisory instead.

### 3.5 `SlotAssignmentSolver`

```
class SlotAssignmentSolver {
    struct Assignment { QVector<QPair<int/*vehicleId*/, double/*bearingDeg*/>> pairs; double totalPathM; bool crossingFree; };
    // Enumerates <=6 permutations (n<=3), scores by total run-in path length,
    // filters by the cyclic-order (no-crossing) constraint. No solver library.
    Assignment propose(const QVector<Vehicle*>& vehicles, const StandoffRing& ring, const QVector<double>& slotBearings) const;
    bool       inducesCrossing(const Assignment& a, const StandoffRing& ring) const;
};
```

Contract (architecture D5): "optimum" is defined as *minimum total run-in path length subject to no crossing*. The no-crossing test is the cyclic-order match between launch positions and slot bearings about the target. The solver *proposes*; the operator *disposes*; an operator override that induces a crossing is flagged, not blocked.

### 3.6 `TransitPlanner`

```
class TransitPlanner {
    struct Plan { QVector<double> transitLevels; QVector<double> pathLengths; QVector<double> etas; CommitSchedule schedule; };
    Plan build(const QVector<VehicleAgent*>& agents, const StandoffRing& ring, double deltaH /*>=10m*/, double nominalCruiseMps) const;
};
```

Contract: allocates distinct transit levels `base + i·ΔH`, `ΔH ≥ 10 m` (architecture §6.3 — the workhorse deconfliction layer, one extra climb command per vehicle). Computes path lengths and ETAs; produces the staggered `CommitSchedule` (architecture D7). Precondition it must assume and the verifier must enforce: `STDF_SEQ ∈ {1,3}`.

### 3.7 `FailsafeVerifier`

```
class FailsafeVerifier {
    struct Result { bool pass; QVector<Finding> findings; };  // Finding: {vehicleId, param, expected, actual}
    Result verify(const QVector<Vehicle*>& fleet) const;      // reads §2.4; checks D8 block + MAV_SYS_ID uniqueness
};
```

Contract (architecture D8/D9, RE6): gates ARM. Reads the required block per vehicle, checks fleet-wide `MAV_SYS_ID` uniqueness, and returns a per-vehicle, per-parameter finding list on failure. The required values are ratified in flight test; the *mechanism* — read back, compare, block, name the offender — is fixed here. Required block:

| Parameter | Required | Rationale |
|---|---|---|
| `NAV_DLL_ACT` | non-zero (Hold, or RTL at a deconflicted altitude) | Datalink loss must not leave a vehicle running unsupervised forever. |
| `NAV_RCL_ACT` | Hold, or `COM_RCL_EXCEPT` bit 1 set | Three independent RTLs from a ring is the crossing case. |
| `COM_DLL_EXCEPT` | explicit | A decision, not a default. |
| `RTL_RETURN_ALT` | per-vehicle, stratified | If RTL is retained, return legs inherit the same vertical discipline as the run-in. |
| `MAV_SYS_ID` | unique across fleet | Collision makes the second vehicle silently vanish (§2.1). |
| `STDF_SEQ` | 1 or 3 | `{2,4}` collapses transit stratification. Deconfliction-critical. |

### 3.8 `SeparationMonitor` — the only cross-agent observer

```
class SeparationMonitor : public QObject {
    Q_PROPERTY(bool anyAdvisoryActive READ anyAdvisoryActive NOTIFY advisoryChanged)
    // pairwise predicted separation over a short horizon from position + velocity,
    // inflated by R_req(i,j); raises advisories; commands NOTHING.
    void advisory(const SeparationAdvisory& a);   // {pairVehicleIds, timeToCA, predictedSepM, requiredSepM}
};
```

Contract (architecture D6/§6.5, RE4):
- Operative criterion is `R_req(i,j) = R_body + k·(hAcc_i + hAcc_j)`, `R_body = 1 m`, `k = 2`. The 1 m bubble is the hard body keepout, not the operative alarm threshold — a criterion smaller than the measurement noise produces alarms, not safety.
- Raises an **advisory** on predicted breach, naming the pair and the time to closest approach; offers the operator a single HOLD ALL (a mode change PX4 supports natively).
- Degrades to advisory-only, agents marked, when `hAcc` is stale or absent — it never substitutes an optimistic value.
- It **commands nothing autonomously.** This is deliberate and is the RE4 payoff.

---

## 4. Value types (the data contract)

These cross module boundaries. Fields, types and units are the contract; a unit error here is a flight-geometry error. All distances metres, all angles degrees (compass, 0 = North, CW), all coordinates WGS-84.

| Type | Fields | Notes |
|---|---|---|
| `OrchestrationMission` | `target: QGeoCoordinate`, `ring: StandoffRing*`, `slots: RingSlot[3]`, `agents: VehicleAgent[≤3]`, `schedule: CommitSchedule`, `state: MissionState` | The aggregate root. One per session. |
| `RingGeometry` | `target`, `radiusM (R)`, `heightM (H, above home)`, `thetaMinDeg` | Derived; never persisted independently of the target. |
| `SlotAssignment` | `pairs: (vehicleId, bearingDeg)[]`, `totalPathM`, `crossingFree: bool` | Solver output; operator-editable. |
| `TransitPlan` | `transitLevels: double[] (AMSL m)`, `pathLengths: double[] (m)`, `etas: double[] (s)`, `deltaH (≥10 m)` | Planner output. |
| `CommitSchedule` | `entries: (vehicleId, tOffsetSeconds)[]` ordered | Staggered-commit schedule (D7). |
| `SeparationAdvisory` | `pairVehicleIds: (int,int)`, `timeToCASeconds`, `predictedSepM`, `requiredSepM (R_req)`, `stale: bool` | Advisory only. |
| `FailsafeFinding` | `vehicleId`, `param: QString`, `expected: QString`, `actual: QString` | One per non-compliant parameter. |
| `OrchestrationAdvisory` | `kind: enum`, `vehicleId (opt)`, `text` | Operator-facing; never triggers actuation. |

Separation criterion, restated as the binding formula:

```
R_req(i,j) = R_body + k·(hAcc_i + hAcc_j)      R_body = 1 m,  k = 2  (~95%)
θ_min      = 2·asin( R_req / (2·R) )
chord(θ)   = 2·R·sin(θ/2)                       // terminal separation between two slots
```

---

## 5. State enumerations (the FSM contract)

Enum values are contract: QML, logging, and the fault matrix key on them. They are stable across the subsystem's versions unless this document is revised.

### 5.1 `MissionState` (architecture §5.1)

```
IDLE, DEFINING_RING, ASSIGNING_SLOTS, PLAN_REVIEW, PREFLIGHT, EXECUTING, ON_STATION, RESLOTTING, TERMINATING
```

`DEGRADED` is **not** a state. It is an orthogonal boolean flag (`OrchestrationManager::degraded`) raised when any agent leaves its nominal lane. It changes what the operator is shown, not what the mission is doing.

### 5.2 `AgentState` (architecture §5.2)

```
UNASSIGNED, ASSIGNED, PREFLIGHT, LAUNCH_QUEUED, TAKEOFF,
CLIMB_TO_TRANSIT_LEVEL, COMMIT_QUEUED, STANDOFF_COMMANDED,
RUN_IN,            // nav_state == 9
ON_STATION,        // nav_state 9 -> 3 AND arrival predicate (§7.4)
HOLD, RESLOT, RTL, LINK_LOST
```

`PREFLIGHT` (agent) gates on all of: armable; GPS fix and `gps.horizontalAccuracy` within the mission's separation budget; `homePosition` set; D8 block verified; `MAV_SYS_ID` unique.

### 5.3 `SlotState`

```
EMPTY, ASSIGNED, COMMITTED, OCCUPIED, VACATED
```

---

## 6. QML contract

### 6.1 Singleton surface

`QGroundControl.orchestration` resolves to the `OrchestrationManager` (§3.1). Its `Q_PROPERTY`/`Q_INVOKABLE`/signal surface in §3.1 is the entire QML-visible contract. QML must not reach into agents to command them — it drives the manager, the manager drives the agents.

### 6.2 New QML components — required-property contract

Root: `qgroundcontrol/src/FlyView/Orchestration/`. Every component that represents a single agent takes `vehicle` (or `agent`) as a `required property` — the `TrackerRoiOverlay.qml` precedent (RE2). None binds to `activeVehicle`.

| File | Required properties | Responsibility |
|---|---|---|
| `OrchestrationWizard.qml` | `orchestration` | Five-page flow: Target → Ring → Slots → Assignment review → Commit. Calls only the §3.1 `Q_INVOKABLE`s. |
| `RingEditorOverlay.qml` | `ring`, `agents` | Map layer: ring, draggable slot handles, live `θ_min` feedback, per-slot vehicle badge. Drag is clamped to `θ_min` client-side and re-validated in `RingSlot::setBearingDeg`. |
| `AssignmentReviewPanel.qml` | `mission` | Proposed assignment, path lengths, transit levels, estimated arrival skew, crossing advisories. |
| `OrchestrationStatusStrip.qml` | `agents` | One lane per agent: `state`, slot bearing, `altitudeAMSL`, `linkHealthy`, `gps.horizontalAccuracy`. |
| `SeparationAdvisoryOverlay.qml` | `orchestration` | Advisory banner + one-touch HOLD ALL (`orchestration.holdAll()`). |
| `FlyViewOrchestrationAction.qml` | — | Tool-strip entry; added to `FlyViewToolStripActionList.qml`. |

### 6.3 Map integration

The existing `VehicleMapItem.qml` already renders every vehicle through a `MapItemView` over the full `vehicles` model — the map draws all three today with no change. Orchestration adds overlays (ring, slots, advisories) as new map layers; it does not touch vehicle rendering.

---

## 7. Interaction contract — the commit sequence

This is an interface in the strongest sense: the *order* is firmware-coupled and is not the implementer's to reorder (RE5). `VehicleAgent::beginCommit()` executes exactly this, per agent.

### 7.1 Sequence (one agent)

```
1. Ensure transit level.
   If on ground:  guidedModeTakeoff(transitLevel_i)        ; await altitudeRelative within tol
   If airborne:   guidedModeChangeAltitude(Δ, pause=false)  ; await altitudeAMSL ≈ transitLevel_i
   AgentState: TAKEOFF / CLIMB_TO_TRANSIT_LEVEL

2. Send the standoff setpoint (ACK-matched):
   sendMavCommandIntWithHandler(ack, defaultComponentId(), MAV_CMD_USER_1,
        MAV_FRAME_GLOBAL_RELATIVE_ALT,
        p1=R, p2=θ_i, p3=0, p4=NaN, p5=target.lat, p6=target.lon, p7=H)
   await MAV_RESULT_ACCEPTED
   AgentState: COMMIT_QUEUED -> STANDOFF_COMMANDED

3. Switch mode:
   vehicle.flightMode = "Standoff"     // DO_SET_MODE main=4, sub=20
   await nav_state == 9 (decode customMode), bounded retry
   AgentState: RUN_IN

4. (v2 only) Arrival-skew trim:
   guidedModeChangeGroundSpeedMetersSecond(v_i)   // AFTER step 3 confirmed, never before (F4)

5. Arrival:
   observe nav_state 9 -> 3, then confirm the arrival predicate (§7.4)
   AgentState: ON_STATION
```

The whole-mission commit issues step-1..3 per agent on the staggered `CommitSchedule` offsets (D7). Steps do not interleave across agents in a way that reorders any single agent's 2→3.

### 7.2 Why the order is fixed
- Setpoint before mode (2 before 3): a Standoff mode entered with no setpoint holds position — a benign but confusing state, trivially avoided.
- Speed after mode (4 after 3): `on_activation` calls `reset_cruising_speed()`; a `DO_CHANGE_SPEED` sent before activation is discarded. Sent after, it takes effect within one navigator cycle (F4).

### 7.3 ACK vs fire-and-forget
`guidedModeStandoff` (§2.2) emits 31010 with `showError=true` and **no result callback**. Inside `VehicleAgent`, prefer `sendMavCommandIntWithHandler` so the FSM keys `COMMIT_QUEUED → STANDOFF_COMMANDED` on the actual `MAV_RESULT_ACCEPTED` rather than assuming acceptance. The single-vehicle path may keep using `guidedModeStandoff`; the orchestrated path wants the ACK.

### 7.4 Arrival predicate (all three, belt-and-braces — architecture §5.4)
`ON_STATION` requires, together:
1. `nav_state` transitioned `9 → 3`, **and**
2. horizontal distance to `ring.slotCoordinate(θ_i)` `< NAV_ACC_RAD`, **and**
3. `|altitudeAMSL − (home_alt + H)| <` altitude acceptance.

The `9→3` transition alone is insufficient — a vehicle can reach Hold by other routes (operator action, failsafe). The predicate discriminates arrival from every other path into Hold.

### 7.5 Re-slotting
An `ON_STATION` vehicle is in Hold, not Standoff. Re-slotting repeats §7.1 with the new bearing. A vehicle still in `RUN_IN` *can* be re-slotted with a fresh 31010 alone (the firmware restarts the staged manoeuvre on any new setpoint), but that replays the in-place yaw and looks abrupt on video — prefer re-slotting from Hold.

---

## 8. Error and degraded-mode contract (architecture §7)

Each row is what a specific failure *surfaces* — the observable contract, not just the intent. No row commands an autonomous manoeuvre (RE4).

| Event | Agent/Mission effect | Operator-visible contract |
|---|---|---|
| One vehicle fails PREFLIGHT | Mission blocks; slots not silently reassigned | `FailsafeFinding` list names vehicle + parameter; operator may de-scope to 2 and re-plan, or clear the fault. |
| Link loss to one vehicle mid-transit | Agent → `LINK_LOST`; vehicle completes its firmware-owned run-in and holds on its own slot — **safe, because the run-in was deconflicted before commit** (D1 payoff) | Ensemble → DEGRADED; that lane flagged. |
| Link loss to all vehicles | Each vehicle completes and holds; post-timeout governed by `NAV_DLL_ACT` | DEGRADED; operator told the configured post-timeout action. |
| One vehicle aborts / RTLs | Remaining agents continue as briefed; ring **not** auto-re-solved | Re-plan offered, not taken (re-spacing survivors is a re-commit under uncertainty — operator's call). |
| Separation advisory | Advisory raised; HOLD ALL offered | Pair named, time-to-CA shown; no autonomous manoeuvre. |
| GNSS accuracy degradation | `R_req` grows; a compliant-at-commit geometry may breach | Advisory with the reason; correct behaviour, not a fault. |
| Battery failsafe on one vehicle | Uncoordinated by design (no mode-aware deferral in firmware) | Per-agent remaining-endurance displayed so the operator sees it coming. |

---

## 9. Build & registration contract (exact edits — RE7)

### 9.1 C++ module
- New dir `qgroundcontrol/src/Orchestration/` with its own `CMakeLists.txt` (`qt_add_library(OrchestrationModule STATIC)` + sources).
- `src/CMakeLists.txt`: add `add_subdirectory(Orchestration)` in the existing block (alongside `add_subdirectory(FlyView)` etc.), and add `OrchestrationModule` to the `target_link_libraries` list that the app target already uses for the other `*Module` libraries.

### 9.2 QML singleton exposure
- `src/QmlControls/QGroundControlQmlGlobal.h`: add, next to the `multiVehicleManager` line,
  `Q_PROPERTY(OrchestrationManager* orchestration READ orchestration CONSTANT)`
  with the forward-declare + `Q_MOC_INCLUDE("OrchestrationManager.h")` pattern already used for `MultiVehicleManager`.
- Provide the `orchestration()` accessor and construct/own the singleton where the other toolbox singletons are constructed.

### 9.3 QML files
- New dir `src/FlyView/Orchestration/` (or a subgroup within the FlyView module). Add each new `.qml` to the `QML_FILES` list of the existing `qt_add_qml_module(FlyViewModule URI QGroundControl.FlyView ...)` in `src/FlyView/CMakeLists.txt`.
- Add `FlyViewOrchestrationAction.qml` to `FlyViewToolStripActionList.qml`.

### 9.4 What is not edited
No change to `Vehicle`, `MultiVehicleManager`, `PX4FirmwarePlugin`, `MavCommandQueue`, the MAVLink dialect, or any single-vehicle FlyView file (RE1/RE3). If an increment appears to need such a change, it is out of contract — escalate.

---

## 10. Verification hooks (per-interface acceptance)

Each interface ships with the check that proves it. These are the exit criteria the roadmap (NXM-SW-PLAN-STRATUM-MVO-001) sequences.

| Interface | Acceptance check |
|---|---|
| §2 consumed surface | Compiles and links against `4095ba3` headers; a smoke test commands three concurrent single-vehicle standoffs from code and observes three distinct bearings. |
| `VehicleAgent` pinning (RE2) | Static check / review: no `activeVehicle` reference anywhere under `src/Orchestration/` or `src/FlyView/Orchestration/`. A unit test constructs two agents on two vehicles and confirms a command to agent A never touches vehicle B. |
| Commit sequence (§7) | SITL log shows, per agent: 31010 ACK precedes `DO_SET_MODE`; `nav_state 9`; then `9→3`; arrival predicate satisfied. Speed trim (v2) appears only after `nav_state==9`. |
| Deconfliction (§4, D4) | SITL log analysis: pairwise separation ≥ `R_req` throughout; transit legs vertically separated by ≥ `ΔH`. |
| `FailsafeVerifier` (RE6/D8) | A vehicle with `STDF_SEQ=2` or a duplicate `MAV_SYS_ID` blocks the mission with a finding naming it. |
| `SeparationMonitor` (RE4/D6) | Injected close-approach raises an advisory and offers HOLD ALL; it issues no mode change on its own. |
| Additive guarantee (RE1) | The single-vehicle standoff path passes its existing manual test unchanged with the orchestration module present. |

---

## 11. Contract stability and change control

This document is the stable surface. The build agent may freely choose internal data structures, threading details, private helpers, and the spelling of private members. It may **not**, without a revision of this document and the architecture:

- change the wire contract (RE3),
- edit a single-vehicle file's behaviour (RE1),
- read `activeVehicle` inside orchestration (RE2),
- reorder the commit sequence (RE5),
- introduce an autonomous manoeuvre command (RE4),
- or ungate ARM (RE6).

The open decisions in NXM-SW-ARCH-STRATUM-MVO-001 §10 (common vs per-slot hold height; arrival-skew requirement; launch topology; ring re-solve on vehicle loss; standoff→engagement transition) are the parameters this contract is deliberately written around. Each is a `Q_PROPERTY` or a planner input today, not a hard-coded assumption — so a ruling changes a value, not the interface.

Decisions dictate destiny. This contract is where they are enforced.
