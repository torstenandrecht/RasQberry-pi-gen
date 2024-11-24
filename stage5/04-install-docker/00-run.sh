echo "Starting docker Installation"
# on_chroot << EOF
# 	SUDO_USER="${FIRST_USER_NAME}" curl -sSL https://get.docker.com | sh
# EOF
#
# echo "Add docker user"
# on_chroot << EOF
#	SUDO_USER="${FIRST_USER_NAME}" sudo usermod -aG docker ${FIRST_USER_NAME}
# EOF


# Add Docker's official GPG key:
on_chroot << EOF

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
EOF
