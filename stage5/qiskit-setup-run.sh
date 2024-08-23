#!/bin/bash -e

# Clone the Git repository
export CLONE_DIR="/tmp/RasQberry-Two"

if [ ! -d "${CLONE_DIR}" ]; then
    git clone --branch $GIT_BRANCH $GIT_REPO $CLONE_DIR
fi

wget ${RASP_WGET} -O raspi-config
# Copy the raspi-config file to the desired locations
 cp  raspi-config  ${ROOTFS_DIR}/usr/bin/raspi-config
 cp  raspi-config  ${ROOTFS_DIR}/etc/init.d/raspi-config

cp $CLONE_DIR/bin/*   ${ROOTFS_DIR}/usr/bin/
mkdir -p  ${ROOTFS_DIR}/usr/config && cp $CLONE_DIR/config/*   ${ROOTFS_DIR}/usr/config
chmod +x  ${ROOTFS_DIR}/usr/bin/
chmod +x  ${ROOTFS_DIR}/usr/config 
# Clean up the temporary clone directory if needed
# Install Qiskit using pip
pip3 install qiskit
rm -rf $CLONE_DIR
