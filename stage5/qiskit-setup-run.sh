#!/bin/bash -e

# Clone the Git repository
GIT_REPO="https://github.com/rishimathur14/RasQberry-Two.git"
GIT_BRANCH="30-sw-platform-rishi"
CLONE_DIR="/tmp/RasQberry-Two"

if [ ! -d "$CLONE_DIR" ]; then
    git clone --branch $GIT_BRANCH $GIT_REPO $CLONE_DIR
fi

# Copy raspi-config to bin 
wget https://raw.githubusercontent.com/rishimathur14/RasQberry-raspi-config/30-sw-platform-rishi/raspi-config -O raspi-config
# Copy the raspi-config file to the desired locations
 cp  raspi-config  ${ROOTFS_DIR}/usr/bin/raspi-config
 cp  raspi-config  ${ROOTFS_DIR}/etc/init.d/raspi-config

cp $CLONE_DIR/bin/*   ${ROOTFS_DIR}/usr/bin/
mkdir -p  ${ROOTFS_DIR}/usr/config && cp $CLONE_DIR/config/*   ${ROOTFS_DIR}/usr/config
chmod +x  ${ROOTFS_DIR}/usr/bin/
chmod +x  ${ROOTFS_DIR}/usr/config 
# Clean up the temporary clone directory if needed
rm -rf $CLONE_DIR