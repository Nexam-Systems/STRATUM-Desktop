#!/usr/bin/env bash
# =====================================================================
# One-shot PX4 SITL setup for WSL2 (Ubuntu 22.04 / 24.04)
# Run INSIDE the WSL Ubuntu shell:
#     bash setup-px4-sitl.sh
# Idempotent: safe to re-run. Builds nothing you already have.
# =====================================================================
set -euo pipefail

PX4_DIR="${HOME}/PX4-Autopilot"
PX4_REPO="https://github.com/PX4/PX4-Autopilot.git"

echo "==> [1/4] Base packages"
sudo apt-get update -y
sudo apt-get install -y git curl

echo "==> [2/4] Clone PX4-Autopilot (recursive)"
if [ ! -d "${PX4_DIR}/.git" ]; then
    git clone "${PX4_REPO}" --recursive "${PX4_DIR}"
else
    echo "    Already cloned. Updating submodules."
    git -C "${PX4_DIR}" submodule update --init --recursive
fi

echo "==> [3/4] Run PX4 toolchain installer (Gazebo + jMAVSim + NuttX)"
bash "${PX4_DIR}/Tools/setup/ubuntu.sh"

echo "==> [4/4] Pre-build SITL (quad, Gazebo gz_x500)"
cd "${PX4_DIR}"
# HEADLESS build first so it compiles even on a GPU-less box.
HEADLESS=1 make px4_sitl gz_x500 || {
    echo "Gazebo build failed; falling back to jMAVSim build."
    make px4_sitl jmavsim
}

cat <<'EOF'

=====================================================================
  SETUP COMPLETE.

  Launch the simulator (from ~/PX4-Autopilot):

      make px4_sitl gz_x500      # Gazebo, with GUI
      HEADLESS=1 make px4_sitl gz_x500   # no GUI, lighter
      make px4_sitl jmavsim      # jMAVSim alternative

  With mirrored networking (.wslconfig), STRATUM-QGC on Windows
  connects automatically over UDP 14550 / 18570.

  If it does NOT auto-connect, get the WSL IP:
      ip addr | grep eth0
  then add a UDP Comm Link in STRATUM-QGC to that IP, port 18570.
=====================================================================
EOF
