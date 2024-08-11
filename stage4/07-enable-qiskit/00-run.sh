#!/bin/bash -e

echo "starting qiskit setup"
# Copy the raspi-config file to the desired locations
cp config/raspi-config  ${ROOTFS_DIR}/usr/bin/raspi-config
cp config/raspi-config  ${ROOTFS_DIR}/etc/init.d/raspi-config
cp bin/*   ${ROOTFS_DIR}/usr/bin/
mkdir -p  ${ROOTFS_DIR}/usr/config && cp config/config-env/*   ${ROOTFS_DIR}/usr/config
echo "end qiskit setup"
