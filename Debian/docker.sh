# Helpful to wait after installing something with sudo, or lock error may occure 
apt_wait () {
  while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1 ; do
    sleep 1
  done
  while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1 ; do
    sleep 1
  done
  if [ -f /var/log/unattended-upgrades/unattended-upgrades.log ]; then
    while sudo fuser /var/log/unattended-upgrades/unattended-upgrades.log >/dev/null 2>&1 ; do
      sleep 1
    done
  fi
}

# Uninstall any other older version of docker
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# Setup repository
sudo apt-get update
apt_wait
sudo apt-get install ca-certificates curl gnupg lsb-release -y
apt_wait

# Add docker's gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add docker reposotory to apt
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update once
sudo apt-get update

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
apt_wait

# This makes sure you don't need to use sudo for using docker command
sudo groupadd docker
sudo usermod -aG docker ${USER}
newgrp docker

# Check if docker is working
docker run hello-world
