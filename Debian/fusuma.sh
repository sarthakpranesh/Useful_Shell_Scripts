echo "Adding the User to the input group"
# Done so that the user is able to get the trackpad events
sudo gpasswd -a $USER input

echo "Installing libinput-tools"
# Required by fusuma and ruby
sudo apt-get install -y libinput-tools ruby

echo "Installing Fusuma"
sudo gem install fusuma

echo "Installing xdotool"
sudo apt-get install -y xdotool

echo "Configuring Fusuma to use my config"
# For now manually change the following to the distro you are using
# By default it is using configs for Pop OS
mkdir -p ~/.config/fusuma
cp Pop/config.yml ~/.config/fusuma/config.yml

echo "Logout and log back in, add 'fusuma' command to startup applications"
