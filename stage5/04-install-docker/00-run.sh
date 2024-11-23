#!/bin/bash -e

echo "Starting docker Installation"
on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" curl -sSL https://get.docker.com | sh
EOF

echo "Add docker user"
on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" sudo usermod -aG docker ${FIRST_USER_NAME}
EOF


