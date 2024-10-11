#!/bin/bash
# Enable VNC and set boot to desktop with autologin for any user

# Install VNC
on_chroot << EOF
apt-get install -y realvnc-vnc-server
systemctl enable vncserver-x11-serviced.service
EOF

# Modify lightdm.conf to leave autologin-user commented out (no default user)
on_chroot << EOF
sed -i 's/^autologin-user=/#autologin-user=/' /etc/lightdm/lightdm.conf
EOF


# Optional: Set resolution for headless operation
echo "hdmi_force_hotplug=1" >> ${ROOTFS_DIR}/boot/config.txt
echo "hdmi_group=2" >> ${ROOTFS_DIR}/boot/config.txt
echo "hdmi_mode=85" >> ${ROOTFS_DIR}/boot/config.txt
