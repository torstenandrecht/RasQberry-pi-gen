#!/bin/bash -e
# Enable vnc server start at boot

on_chroot << EOF
	raspi-config nonint do_vnc 1
	systemctl enable wayvnc.service
	systemctl start wayvnc.service
EOF
# Optional: Set resolution for headless operation
echo "hdmi_force_hotplug=1" >> ${ROOTFS_DIR}/boot/config.txt
echo "hdmi_group=2" >> ${ROOTFS_DIR}/boot/config.txt   # Set for monitor (DMT)
echo "hdmi_mode=82" >> ${ROOTFS_DIR}/boot/config.txt   # 1920x1080 @ 60Hz