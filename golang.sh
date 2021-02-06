echo "Download the golang amd64 package"
# You can update this later when new release rolls out
wget https://golang.org/dl/go1.15.8.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.8.linux-amd64.tar.gz

echo "Adding the go install location to bashrc"
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc

# Form here it is my personel preference of workflow

echo "Creating directories"
# golib for local package install and Github/GO for active local development
mkdir -p ~/golib
mkdir -p ~/Github/GO/src
mkdir -p ~/Github/GO/bin
mkdir -p ~/Github/GO/pkg

echo "Adding the created directories to GOPATH"
echo "export GOPATH=/home/$USER/golib" >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

echo "Creating compound GOPATH"
echo "export GOPATH=\$GOPATH:/home/$USER/Github/GO" >> ~/.bashrc

rm -rf ./*.tar.gz

source ~/.bashrc
go version
