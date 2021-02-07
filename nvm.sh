echo "Installing NVM - Node Version Manager"
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

echo "Using NVM to install latest version of Nodejs"
nvm install node
