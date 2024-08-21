#!/bin/bash -e
chmod +x qiskit-setup-run.sh

if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous
fi
echo "Starting qiskit conf"
./qiskit-setup-run.sh
echo "End qiskit conf"

