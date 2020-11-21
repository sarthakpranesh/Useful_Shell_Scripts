# Updating the system before install
sudo apt update
sudo apt upgrade -y

# download the golang amd64 package - you can update this later when new release rolls out
wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz

# Adding the go install location to bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc

# Form here it is my personel preference of workflow

# Creating directories, golib for local package install and Github/GO for active local development
mkdir ~/golib
mkdir ~/Github/GO

# Adding the created directories to GOPATH
echo "export GOPATH=/home/$USER/golib" >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

# Compound GOPATH
echo "export GOPATH=\$GOPATH:/home/$USER/Github/GO" >> ~/.bashrc

mkdir ~/Github/GO/src
mkdir ~/Github/GO/bin
mkdir ~/Github/GO/pkg

rm -rf ./*.tar.gz

source ~/.bashrc
go version
