#!/bin/bash -e
chmod +x qiskit-setup-run.sh
chmod +x setraspiconfigparam.sh
if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous
fi
echo "Starting qiskit conf"
./qiskit-setup-run.sh
echo "End qiskit conf"

echo "Enable raspi config"
./setraspiconfigparam.sh
echo "enabling done"
