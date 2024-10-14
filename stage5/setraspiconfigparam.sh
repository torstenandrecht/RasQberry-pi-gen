#!/bin/bash
# Enable VNC and set boot to desktop with autologin for any user using raspi-config in non-interactive mode

# Enable VNC through raspi-config (non-interactive mode)
on_chroot << EOF
raspi-config nonint do_vnc 0
EOF

# Set boot option to desktop with autologin (non-interactive mode)
on_chroot << EOF
raspi-config nonint do_boot_behaviour B4
EOF

# Modify lightdm.conf to leave autologin-user commented out (no default user)
on_chroot << EOF
sed -i 's/^autologin-user=/#autologin-user=/' /etc/lightdm/lightdm.conf
EOF

# Optional: Set resolution for headless operation
echo "hdmi_force_hotplug=1" >> ${ROOTFS_DIR}/boot/config.txt
echo "hdmi_group=2" >> ${ROOTFS_DIR}/boot/config.txt
echo "hdmi_mode=85" >> ${ROOTFS_DIR}/boot/config.txt



