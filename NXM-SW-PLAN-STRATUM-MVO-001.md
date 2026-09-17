# STRATUM Multi-Vehicle Orchestration — Development Roadmap & Sequence

**Document** NXM-SW-PLAN-STRATUM-MVO-001
**Revision** v0.1 — 2026-09-17
**Governs** The order in which the orchestration subsystem is built, tested, and flown
**Companions** NXM-SW-ARCH-STRATUM-MVO-001 (architecture); NXM-SW-ICD-STRATUM-MVO-001 (interface contract)
**Baseline** STRATUM-Desktop @ `4095ba3`

---

## 0. The shape of the plan, and why it is shaped that way

A roadmap is a sequencing decision, and sequencing is a risk decision before it is a schedule. The architecture already established the single most consequential fact: everything below the QML layer is already multi-vehicle. That converts the programme from a refactor into an addition, and it moves the risk off the code and onto two other things — the firmware behaving as the static review claims it does, and the failsafe parameter block being right. So the plan front-loads exactly those two.

The ordering principle is: **retire the risk that can invalidate the design before building the surface that assumes it.** Concretely, prove three vehicles fly independently in SITL (S0) and prove three deconflicted run-ins actually stay apart (S2) *before* investing in the wizard and the polish (S3–S4). If S0 or S2 surprises us, the surprise is cheap; if it surprises us after the UI is built, it is not.

The plan is expressed as six stages, S0–S5, inherited from architecture §9 and expanded here into workstreams, gates, and a critical path. Stages are not equal in risk. S0 through S2 carry the technical risk and are largely serial. S3 onward is execution and parallelises.

A note on register: a stage is *done* when its exit gate is demonstrated, not when the code is written. Every gate below is an observable, not an assertion.

---

## 1. Workstreams

Four threads run through the stages. Naming them lets parallel work proceed without colliding.

| WS | Workstream | Spans | Owner discipline |
|---|---|---|---|
| **WS-A** | Core C++ orchestration (`OrchestrationManager`, `VehicleAgent`, ring/slot, FSMs) | S1–S4 | Application C++ |
| **WS-B** | Planning & safety (`SlotAssignmentSolver`, `TransitPlanner`, `FailsafeVerifier`, `SeparationMonitor`) | S2, S4 | Systems + C++ |
| **WS-C** | Operator UI (wizard, map overlays, status strip, advisories) | S3–S4 | QML/UX |
| **WS-D** | Test & flight (SITL harness, fault injection, log analysis, flight test) | S0, S2, S4, S5 | Test/flight |

WS-D is not a phase at the end. It opens at S0 and gates every subsequent stage.

---

## 2. The sequence

Each stage states its intent, the interfaces (per NXM-SW-ICD-STRATUM-MVO-001) it lands, its dependencies, and the single observable that closes it. The exit gate is binding: the next stage does not start until it is demonstrated.

### S0 — Multi-instance SITL bring-up  *(WS-D; risk-retirement)*

**Intent.** Establish the ground truth the whole architecture rests on: three PX4 instances, distinct `MAV_SYS_ID`, presenting as three independently commandable vehicles in STRATUM. This is where R6 (the custom modes were statically reviewed but, by their own documentation, never compile-verified in the environment that produced them) is retired by a real run rather than an argument.

**Lands.** No product interfaces. A repeatable multi-instance SITL harness under `sim-setup/`, and a documented `MAV_SYS_ID` provisioning procedure (feeds architecture D9).

**Depends on.** Nothing. Starts immediately.

**Exit gate.** Three vehicles visible in STRATUM at once, each independently commandable through the *existing* single-vehicle path (Set Standoff panel against each in turn), each entering `nav_state 9` and settling to Hold on its commanded bearing. Confirmed in log, not by eye alone.

**Why first.** If the firmware does not do in three instances what the scan says it does in one, every downstream assumption is void, and we want that discovery on day one at zero sunk cost.

---

### S1 — Core module skeleton  *(WS-A; the spine)*

**Intent.** Stand up the orchestration objects and prove the pinning discipline (ICD RE2) with real airframes — three agents, three pinned `Vehicle*`, three concurrent standoffs commanded *from orchestration code*, arriving on three bearings. No operator UI beyond a throwaway debug panel.

**Lands (ICD §3, §5, §7, §9):**
- `OrchestrationManager` singleton, registered on `QGroundControlQmlGlobal` (ICD §9.2).
- `VehicleAgent` with the agent FSM (ICD §5.2) and the per-agent commit sequence (ICD §7).
- `StandoffRing`, `RingSlot` value objects (ICD §3.3–§3.4).
- Module build wiring (ICD §9.1).

**Depends on.** S0 (needs three real SITL vehicles to command).

**Exit gate.** From the debug panel, one action commits three agents; SITL logs show, per agent, 31010 ACK **before** `DO_SET_MODE`, `nav_state 9`, then `9→3`, with each vehicle on its assigned bearing. The RE2 static check passes (no `activeVehicle` in the module). This is the architecture's S1 criterion made concrete.

**Critical path.** Yes. Everything else binds to these objects.

---

### S2 — Planner and safety gate  *(WS-A + WS-B; the risk core)*

**Intent.** Turn three independent standoffs into one *deconflicted* three-vehicle run-in, and put the ARM gate in place. This is the stage that proves the deconfliction-by-construction claim (architecture §6) with measured separation, and the stage that makes the failsafe block enforceable rather than aspirational.

**Lands (ICD §3.5–§3.7, §4, §10):**
- `SlotAssignmentSolver` — ≤6-permutation enumeration, min-path, cyclic-order (no-crossing) filter (ICD §3.5).
- `TransitPlanner` — transit-level allocation (`ΔH ≥ 10 m`), path/ETA, staggered `CommitSchedule` (ICD §3.6).
- `FailsafeVerifier` — D8 block read-back + `MAV_SYS_ID` uniqueness; ARM gate wired to `OrchestrationManager::armable` (ICD §3.7, RE6).
- `θ_min` enforcement in `StandoffRing`/`RingSlot`.

**Depends on.** S1 (agents to schedule), S0 (SITL to measure in).

**Exit gate.** A deconflicted three-vehicle run-in in SITL, verified by **log analysis of pairwise separation**: separation ≥ `R_req` throughout, transit legs vertically separated by ≥ `ΔH`. A vehicle seeded with `STDF_SEQ=2` or a duplicate `MAV_SYS_ID` blocks the mission with a finding that names it. This is the architecture's S2 criterion plus the D8 gate.

**Critical path.** Yes. This is where the design is either proven or sent back.

**Risk note.** S0–S2 together carry essentially all the technical risk. Budget for iteration here; do not compress it to protect S3.

---

### S3 — Operator surface  *(WS-C; execution)*

**Intent.** Replace the debug panel with the real five-page wizard and the map, so an operator flies the mission end to end without touching code. Risk is now execution risk, not design risk.

**Lands (ICD §6):**
- `OrchestrationWizard.qml` (Target → Ring → Slots → Assignment review → Commit).
- `RingEditorOverlay.qml` with live `θ_min` clamping and per-slot vehicle badges.
- `AssignmentReviewPanel.qml` (assignment, path lengths, transit levels, arrival skew, crossing advisories).
- `OrchestrationStatusStrip.qml` (per-agent lane).
- `FlyViewOrchestrationAction.qml` tool-strip entry (ICD §9.3).

**Depends on.** S1 (manager/agent surface), S2 (planner output to display and edit).

**Exit gate.** An operator drives the full mission from the tool strip — designate target, set ring, review the proposed assignment, override a slot, run preflight, execute — with the debug panel removed. The single-vehicle path passes its existing manual test unchanged with the module present (RE1).

**Parallelism.** WS-C can begin scaffolding against the ICD §6 required-property contract during S2, since the QML binds to a frozen surface. Only integration waits on S2.

---

### S4 — Monitor, advisories, degraded modes  *(WS-B + WS-C; the safety finish)*

**Intent.** Add the cross-agent observer and make the failure matrix real. This is where the subsystem earns its degraded-mode behaviour under injected faults.

**Lands (ICD §3.8, §8):**
- `SeparationMonitor` — pairwise predicted separation, `R_req` inflation, advisories; commands nothing (RE4).
- `SeparationAdvisoryOverlay.qml` + one-touch HOLD ALL.
- Degraded-mode handling across the §8 event table (link loss single/all, mid-transit abort, GNSS degradation, battery failsafe display).

**Depends on.** S3 (operator surface to raise advisories into), S2 (`hAcc` budget, agent set).

**Exit gate.** The **injected-fault matrix passes** (ICD §8): single-vehicle link loss → that vehicle completes and holds, ensemble DEGRADED, lane flagged; all-vehicle link loss → all hold, post-timeout per `NAV_DLL_ACT`; mid-transit abort → survivors continue as briefed, re-plan offered not taken; close-approach → advisory + HOLD ALL offered, **no** autonomous manoeuvre. This is the architecture's S4 criterion.

---

### S5 — Flight test  *(WS-D; proof)*

**Intent.** Fly the three-vehicle ring and measure reality against prediction.

**Lands.** No new interfaces. Ratified values for the D8 block and the acceptance tolerances; the flight-test record.

**Depends on.** S4 (full subsystem), and the S0 provisioning procedure applied to real airframes (`MAV_SYS_ID` per-airframe under production control — R1).

**Exit gate.** Three-vehicle ring flown; **measured minimum separation and arrival skew recorded against prediction.** Deviations feed back into `R_req`, `ΔH`, and the arrival-skew decision (§4 below).

---

## 3. Dependency map and critical path

```
S0 ──▶ S1 ──▶ S2 ──▶ S3 ──▶ S4 ──▶ S5
             (│)      ▲
              └── WS-C scaffolding (parallel, binds to frozen ICD §6) ──┘

Critical path:  S0 → S1 → S2 → S4 → S5
Parallelisable: WS-C (S3 UI) scaffolds during S2; WS-D harness (S0) is reused every stage.
```

The critical path runs through the safety core, not the UI. S3 is on the path only where it feeds S4's fault matrix; its construction is not the pacing item. The pacing items are S0 (does the firmware behave), S2 (does the geometry stay apart), and S4 (does it degrade safely).

Two things gate S5 from outside software and must be started early despite living at the end:
- **`MAV_SYS_ID` provisioning as a production configuration item** (architecture D9/R1). Begin the procedure at S0; it is a build-and-acceptance artifact, not code.
- **Failsafe parameter values ratified in flight test** (architecture D8). The *mechanism* lands in S2; the *values* are an S5 output. Do not let the mechanism wait on the values.

---

## 4. Decision gates the plan is waiting on

These are architecture §10 open decisions. Each maps to a stage where a ruling stops costing optionality and starts costing rework. The interface contract is written so a ruling changes a value, not a seam — but a late ruling still burns schedule.

| Open decision (arch §10) | Needed by | If unresolved | Cheap because |
|---|---|---|---|
| Common vs per-slot hold height | S2 (planner) | Planner assumes common `H`, distinct transit levels | Wire contract already carries `z` per vehicle; a ruling flips a planner input. |
| Is arrival skew a hard number `T`? | S3/S4 | v1 ships staggered-commit only; v2 speed trim deferred | F4 mechanism is known; if `T` is real, v2 trim moves into S4 rather than "later." |
| Launch topology — single pad or dispersed? | S2 | Assume dispersed; single-pad needs departure-time separation added to the schedule | `CommitSchedule` already carries per-agent `tOffset`; single-pad tightens the values. |
| Ring re-solve on vehicle loss? | S4 | Default: hold as briefed, offer re-plan | Auto-re-spacing is a re-commit under uncertainty; default is the conservative one. |
| Does orchestrated standoff ever go to engagement? | **Before S3 scope-lock** | v1 is standoff-only; engagement is explicitly excluded | Multi-vehicle + terminal engagement is a materially heavier safety case (different authorisation chain, abort architecture, verification burden). Decide with eyes open or exclude — do not let it arrive by accident because both capabilities live in the same app. This is the ruling that matters most. |

The engagement question is the one to answer first, because it sets the outer boundary of the whole subsystem's remit and therefore of this plan.

---

## 5. Test strategy per stage

Testing is layered to match where risk lives, and it is an exit gate at every stage, never a trailing activity.

| Layer | Where | What it proves |
|---|---|---|
| Multi-instance SITL | S0 onward, every stage | The firmware contract holds for N=3; regressions caught against a live stack, not a static argument (retires R6). |
| Log-analysis of pairwise separation | S2, S5 | Deconfliction-by-construction is real, measured, not asserted. The core safety claim. |
| Static / review gate for RE2 | S1 onward | No orchestration code reads `activeVehicle`; commands never cross to the wrong airframe. |
| Failsafe read-back test | S2 | The ARM gate blocks a mis-provisioned vehicle and names it (D8/D9). |
| Injected-fault matrix | S4 | Degraded modes behave per ICD §8 — including the discipline of *not* commanding manoeuvres (RE4). |
| Single-vehicle regression | S3, S4 | The additive guarantee (RE1): today's capability is untouched. |
| Flight test | S5 | Prediction vs reality on separation and arrival skew; ratifies the parameter values. |

---

## 6. Definition of done (subsystem)

The subsystem is done, for v1, when all of the following hold together:

1. An operator commits three vehicles onto a standoff ring from the tool strip, end to end, without touching code.
2. Measured minimum separation in flight test meets or exceeds `R_req` throughout, and transit legs were vertically separated by ≥ `ΔH` (S5 record).
3. A mis-provisioned vehicle (`STDF_SEQ ∈ {2,4}`, or duplicate `MAV_SYS_ID`) cannot reach ARM and is named at the block (RE6).
4. The injected-fault matrix (ICD §8) passes, including the standing proof that the subsystem commands no autonomous avoidance manoeuvre (RE4).
5. The single-vehicle standoff and engagement paths pass their existing tests unchanged with the module present (RE1).
6. Firmware delta for v1 is zero (RE3) — demonstrated, not assumed.

Anything beyond this — v2 arrival-skew trim, ring re-solve on vehicle loss, five-vehicle growth, engagement transition — is a scoped follow-on, not part of v1 done, and each is already parameterised in the contract so it lands as an addition rather than a rework.

---

## 7. The five-vehicle growth objective

Scope is three vehicles fielded, five as the growth objective. The plan protects that growth without paying for it now:

- `SlotAssignmentSolver` at n=5 is 120 permutations — still trivially enumerable; no solver library is introduced, so the growth costs nothing structural.
- `TransitPlanner` stratifies `base + i·ΔH` for arbitrary `i`; five levels is five climbs, no new mechanism.
- `θ_min` and `R_req` are geometry, independent of vehicle count.
- The one place five bites harder than three is the departure schedule from a single pad and the total vertical stack (5·ΔH of transit-level headroom). Both are `CommitSchedule`/`TransitPlanner` values, ratified in flight test, not interface changes.

The subsystem is therefore built for three and sized for five by construction, not by a second project.

Decisions dictate destiny. This plan is the order in which they are made real.
