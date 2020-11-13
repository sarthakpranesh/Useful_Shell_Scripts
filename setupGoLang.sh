apt_wait () {
  while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1 ; do
    sleep 1
  done
  while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1 ; do
    sleep 1
  done
  if [ -f /var/log/unattended-upgrades/unattended-upgrades.log ]; then
    while sudo fuser /var/log/unattended-upgrades/unattended-upgrades.log >/dev/null 2>&1 ; do
      sleep 1
    done
  fi
}
sudo apt update
sudo apt upgrade -y

wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz

echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc

mkdir ~/golib
mkdir ~/Github/GO

echo "export GOPATH=/home/$USER/golib" >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

echo "export GOPATH=\$GOPATH:/home/$USER/Github/GO" >> ~/.bashrc

mkdir ~/Github/GO/src
mkdir ~/Github/GO/bin
mkdir ~/Github/GO/pkg

rm -rf ./*.tar.gz

source ~/.bashrc
go version
