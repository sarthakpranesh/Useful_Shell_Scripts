echo "Downloading the Flutter SDK"
# You can update this later when new release rolls out
wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.0.1-stable.tar.xz

echo "Extracting the SDK and placing it under your home"
tar -C ~/ -xf flutter_linux_2.0.1-stable.tar.xz

# Clean up the downloaded flutter tar
rm -rf ./flutter_linux_2.0.1-stable.tar.xz

echo "Adding the Flutter SDK path to bashrc"
echo 'export PATH=$PATH:$HOME/flutter/bin' >> ~/.bashrc

# Reload configurations from .bashrc
source ~/.bashrc

echo "Precaching binaries"
flutter precache
