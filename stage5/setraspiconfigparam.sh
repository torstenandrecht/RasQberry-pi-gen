#!/bin/bash

# Enable VNC non-interactively
on_chroot << EOF
raspi-config nonint do_vnc 1
EOF

# Set screen resolution (e.g., 1080p)
echo "hdmi_force_hotplug=1" >> ${ROOTFS_DIR}/boot/config.txt
echo "hdmi_group=2" >> ${ROOTFS_DIR}/boot/config.txt
echo "hdmi_mode=82" >> ${ROOTFS_DIR}/boot/config.txt
