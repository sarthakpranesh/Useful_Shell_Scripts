#!/usr/bin/env bash

# Get Go Version supplied by user
GO_VERSION=$1

echo "Download the golang amd64 package"
# You can update this later when new release rolls out
if [ -z "$GO_VERSION" ]; then
    GO_VERSION="1.26.1"
fi
wget https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz

echo "Adding the go install location to bashrc"
echo '# Go' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc

# Form here it is my personel preference of workflow

echo "Creating directories"
# golib for local package install and Github/GO for active local development
mkdir -p ~/golib
mkdir -p ~/work/github/sarthakpranesh/
mkdir -p ~/work/github/go/bin
mkdir -p ~/work/github/go/pkg

echo "Adding the created directories to GOPATH"
echo "export GOPATH=/home/$USER/golib" >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

echo "Creating compound GOPATH"
echo "export GOPATH=\$GOPATH:/home/$USER/work/github/go" >> ~/.bashrc

rm -rf ./*.tar.gz

source ~/.bashrc

go version
