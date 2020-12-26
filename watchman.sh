echo "Installing and configuring Watchman"
# Required by the React Native bundler
wget https://github.com/facebook/watchman/releases/download/v2020.12.21.00/watchman-v2020.12.21.00-linux.zip
unzip watchman-*-linux.zip
sudo mkdir -p /usr/local/{bin,lib} /usr/local/var/run/watchman
cd watchman-*-linux
sudo cp ./bin/* /usr/local/bin
sudo cp ./lib/* /usr/local/lib
cd ../
sudo chmod 755 /usr/local/bin/watchman
sudo chmod 2777 /usr/local/var/run/watchman

rm -rf watchman-*-linux*

echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
echo fs.inotify.max_user_watches=999999 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
watchman watch-del-all
watchman shutdown-server
