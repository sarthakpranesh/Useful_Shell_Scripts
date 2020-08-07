sudo gpasswd -a $USER input
sudo apt-get install -y libinput-tools ruby
sudo gem install fusuma
sudo apt-get install -y xdotool
mkdir -p ~/.config/fusuma
cp fusuma/config.yml ~/.config/fusuma/config.yml
echo "Logout and log backin, also use 'fusuma' command to turn on gestures or add it to startup applications"
