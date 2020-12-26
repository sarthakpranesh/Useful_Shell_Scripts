bash ../nvm.sh

echo "Installing openjdk-8"
sudo dnf install java-1.8.0-openjdk

bash ../androidStudio.sh

bash ../watchman.sh

echo "Finish"
