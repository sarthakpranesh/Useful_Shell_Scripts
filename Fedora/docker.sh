echo "Removing any old version of Docker"
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

echo "Configuring Docker repository"
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

echo "Installing Docker engine"
sudo dnf install docker-ce docker-ce-cli containerd.io

echo "Starting Docker"
sudo systemctl start docker

echo "Configuring Docker to run without sudo preface"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

