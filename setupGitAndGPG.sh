sudo apt install -y git
git config --global user.name "sarthakpranesh"
git config --global user.email "sarthak.pranesh2018@vitstudent.ac.in"
gpg --full-generate-key
echo "Copy the key ID and run 'gpg --armor --export YOUR-COPIED-KEY'"
gpg --list-secret-keys --keyid-format LONG
echo "Paste this GPG key id in Github setup"
