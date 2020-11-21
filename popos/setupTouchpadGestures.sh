# Adding the User to the input group
sudo gpasswd -a $USER input

# Installing libinput-tools required by fusuma and ruby
sudo apt-get install -y libinput-tools ruby

# Installing Fusuma
sudo gem install fusuma

# Installing xdotool
sudo apt-get install -y xdotool

# Configuring Fusuma to use my config
mkdir -p ~/.config/fusuma
cp fusuma/config.yml ~/.config/fusuma/config.yml


echo "Logout and log back in, add 'fusuma' command to startup applications"
