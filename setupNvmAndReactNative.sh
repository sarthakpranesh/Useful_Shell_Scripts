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

sudo echo "Installing node version manager"
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
echo "Installing latest version of nodejs"
nvm install node
echo "Installing openjdk-8"
apt_wait
sudo apt install -y openjdk-8-jdk
apt_wait
echo "Installing Android Studio"
if ! command -v snap $> /dev/null
then
	echo "SNAPD not found, installing snapd and snap-store"
  sudo apt install snapd
  sudo snap install snap-store
fi
sudo snap install android-studio --classic
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/emulator' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/tools' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/platform-tools' >> ~/.bashrc
source ~/.bashrc
apt_wait
echo "Installing Watchman"
sudo apt install -y libssl-dev autoconf automake libtool pkg-config
apt_wait
sudo apt install -y git
apt_wait 
git clone https://github.com/facebook/watchman.git -b v4.9.0 --depth 1
cd watchman
./autogen.sh
./configure --without-python --without-pcre
make
sudo make install
apt_wait
cd ../
rm -rf watchman
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
echo fs.inotify.max_user_watches=999999 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
watchman watch-del-all
watchman shutdown-server

echo "React Native Env setup finish"

