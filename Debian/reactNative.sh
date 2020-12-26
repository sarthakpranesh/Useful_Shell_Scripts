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

bash ../nvm.sh

echo "Installing openjdk-8"
sudo apt install -y openjdk-8-jdk
apt_wait

bash ../androidStudio.sh

bash ../watchman.sh

echo "Finish"
