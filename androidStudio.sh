echo "Installing Android Studio {flatpak}"
flatpak install com.google.AndroidStudio

echo "Configuring paths for Android Studio Sdk"
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/emulator' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/tools' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/Android/Sdk/platform-tools' >> ~/.bashrc

# Sourcing the bash terminal
source ~/.bashrc
