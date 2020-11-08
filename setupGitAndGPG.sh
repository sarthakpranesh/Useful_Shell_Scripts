sudo apt install -y git
git config --global user.name "sarthakpranesh"
git config --global user.email "sarthak.pranesh2018@vitstudent.ac.in"
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG
echo "Copy the key ID and run 'gpg --armor --export YOUR-COPIED-KEY'"
echo "Paste the output GPG key in Github/Setting/SSH and GPG keys"