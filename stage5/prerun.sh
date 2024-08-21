#!/bin/bash -e
chmod +x qiskit-setup-run.sh
./qiskit-setup-run.sh
if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous
fi
