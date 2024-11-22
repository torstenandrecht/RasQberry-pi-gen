echo "Starting docker Installation"
curl -sSL https://get.docker.com | sh
echo "Add docker user"
sudo usermod -aG docker ${FIRST_USER_NAME}

