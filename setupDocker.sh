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

# Update and Upgrade system before install
sudo apt update
sudo apt upgrade -y

# Install necessary dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
apt_wait

# Add docker's gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add docker reposotory to apt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Update once
sudo apt update

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
apt_wait

# This makes sure you don't need to use sudo for using docker command
sudo groupadd docker
sudo usermod -aG docker ${USER}
su - ${USER}
