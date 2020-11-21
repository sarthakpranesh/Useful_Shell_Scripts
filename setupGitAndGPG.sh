# install git if not installed already
sudo apt install -y git

# Configure git, you should replace my name and email with your github credentials
git config --global user.name "sarthakpranesh"
git config --global user.email "sarthak.pranesh2018@vitstudent.ac.in"

# Setting up the GPG github key
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG
echo "Copy the key ID and run 'gpg --armor --export YOUR-COPIED-KEY'"
echo "Paste the output GPG key in Github/Setting/SSH and GPG keys"