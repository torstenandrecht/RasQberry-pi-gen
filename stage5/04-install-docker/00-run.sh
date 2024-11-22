# Add Docker's official GPG key:
echo "Starting docker Installation"
sudo apt-get update
echo "STEP 1"
sudo apt-get install ca-certificates curl
echo "STEP 2"
sudo install -m 0755 -d /etc/apt/keyrings
echo "STEP 3"
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
echo "STEP 4"
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "STEP 5"

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "STEP 6"
sudo apt-get update
echo "STEP 1"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
