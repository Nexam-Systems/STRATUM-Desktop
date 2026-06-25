# PX4 SITL Harness for STRATUM-QGC (Windows)

Test STRATUM-QGC against a simulated vehicle — no airframe, no radio, no airspace.
PX4 runs inside WSL2 (Ubuntu); STRATUM-QGC runs natively on Windows; they bridge
over UDP/MAVLink. That WSL↔Windows boundary is the only thing that ever breaks,
so it is the focus below.

## Files

| File | Goes where | Purpose |
|------|-----------|---------|
| `.wslconfig` | `C:\Users\<you>\.wslconfig` | Enables mirrored networking (auto-connect) |
| `setup-px4-sitl.sh` | Inside WSL (`~`) | Clones + builds PX4 SITL, one shot |
| `README.md` | Here | This guide |

## One-time setup

1. **Install WSL2 + Ubuntu** — PowerShell as Administrator:

   ```powershell
   wsl --install -d Ubuntu-22.04
   ```

   Reboot, then set a Linux username/password when the shell opens.

2. **Apply mirrored networking** — copy `.wslconfig` to `C:\Users\<you>\`, then:

   ```powershell
   wsl --shutdown
   ```

   Reopen Ubuntu. (Mirrored mode needs Windows 11 22H2+. On Windows 10, skip
   this and use the manual UDP link under Troubleshooting.)

3. **Build PX4** — inside the Ubuntu shell, from where you copied the script:

   ```bash
   bash setup-px4-sitl.sh
   ```

   First build takes 15–40 min depending on machine. Re-running is cheap.

## Daily use

In the Ubuntu shell:

```bash
cd ~/PX4-Autopilot
make px4_sitl gz_x500          # Gazebo with GUI
# or
HEADLESS=1 make px4_sitl gz_x500   # no GUI — let STRATUM-QGC be the only display
# or
make px4_sitl jmavsim          # lighter alternative
```

Launch STRATUM-QGC on Windows. With mirrored networking it connects
automatically (UDP 14550/18570). Arm and fly from STRATUM's UI.

## What this validates for STRATUM

The SITL vehicle is the right harness for the single-view + AOP work:
fly the simulated airframe across the AOP inclusion-geofence boundary and
confirm STRATUM enforces it — all without risking hardware.

## Troubleshooting — manual UDP link (fallback)

If auto-connect fails (mirrored mode off, or Windows 10):

1. In WSL: `ip addr | grep eth0` → note the IP (e.g. `172.x.x.x`).
2. STRATUM-QGC → **Application Settings → Comm Links → Add**:
   - Type: **UDP**, Port: **18570**, Target host: `<the WSL IP>`
3. The WSL IP is **dynamic** — re-enter it after every `wsl --shutdown`.
   This fragility is why mirrored networking is preferred.

## Known limits

- **No USB/serial passthrough** in WSL2 — this rig simulates only; you cannot
  flash a real Pixhawk through it.
- Gazebo GUI may stutter without GPU passthrough — run `HEADLESS=1`.

## References

- PX4 WSL2 dev environment: https://docs.px4.io/main/en/dev_setup/dev_env_windows_wsl
- Connecting QGC to PX4 in WSL2: https://discuss.px4.io/t/connecting-qgc-to-px4-running-in-wsl2/37188
- PX4 simulation overview: https://docs.px4.io/main/en/simulation/
