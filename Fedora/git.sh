echo "Install Git"
sudo dnf install git-all

echo "Configure gi"
#  You should replace my name and email with your github credentials
git config --global user.name "sarthakpranesh"
git config --global user.email "sarthak.pranesh2018@vitstudent.ac.in"

# Setting up the GPG github key
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG

echo "Copy the key ID and run 'gpg --armor --export YOUR-COPIED-KEY'"
echo "Paste the output GPG key in Github/Setting/SSH and GPG keys"
