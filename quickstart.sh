#!/bin/bash

# Nala Install
ni () {
    sudo nala update
    sudo nala install -y $@
}

# ---------------------------------------

echo "Update and upgrade"
sudo apt update && sudo apt upgrade -y

# ---------------------------------------

echo "Nala"
sudo apt install nala
sudo nala fetch

# ---------------------------------------

echo "Add repositories"
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo add-apt-repository multiverse # Required by: Steam

sudo nala update && sudo nala upgrade -y 

# ---------------------------------------

echo "Install necessary packages"
ni \
    curl \
    wget \
    git \
    nano \
    fastfetch \
    btop \
    gnome-tweaks \
    gnome-shell-extension-manager \
    ca-certificates

# ---------------------------------------

echo "Set background"
sudo wget -O /usr/share/backgrounds/black.png https://htmlcolorcodes.com/assets/images/colors/black-color-solid-background-1920x1080.png
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/black.png
gsettings set org.gnome.desktop.background picture-uri-dark file:////usr/share/backgrounds/black.png

# ---------------------------------------

echo "Brave (beta)"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg] https://brave-browser-apt-beta.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-beta.list
ni brave-browser-beta

echo "Remove Firefox"
sudo apt remove -y firefox

# ---------------------------------------

echo "Spotify"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
ni spotify-client

echo "Spicetfiy"
source ~/.bashrc
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
spicetify backup apply
rm ./install.log

# ---------------------------------------

echo "Lutris"
curl -LO $(curl -s -L https://api.github.com/repos/lutris/lutris/releases/latest | jq -r '.assets[] | select(.name | endswith(".deb")) .browser_download_url')
sudo nala install -y ./lutris*.deb
rm ./lutris*.deb

# ---------------------------------------

echo "VS Code"
wget -O vscode.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
sudo nala install -y ./vscode.deb
rm ./vscode.deb

echo "VS Code extensions"
for extension in \
    GitHub.copilot \
    ZainChen.json \
    Nur.just-black \
    bmalehorn.shell-syntax \
    ms-azuretools.vscode-docker \
    Gruntfuggly.todo-tree \
    ms-python.python \
    ms-vscode-remote.remote-ssh\
    DavidAnson.vscode-markdownlint \
    yzhang.markdown-all-in-one
do code --install-extension $extension; done

# ---------------------------------------

echo "Snap packages"

# Snap Install
si () {
    for pacakge in $@; do
        sudo snap install $pacakge
    done
}

sudo snap install blender --classic
si mailspring

# ---------------------------------------

echo "Steam"
sudo dpkg --add-architecture i386
ni steam-installer
steam

# ---------------------------------------

echo "DisplayLink"
wget -O displaylink.deb https://www.synaptics.com/sites/default/files/Ubuntu/pool/stable/main/all/synaptics-repository-keyring.deb
sudo nala install -y ./displaylink.deb
ni displaylink-driver
rm ./displaylink.deb

# ---------------------------------------

echo "Docker"
# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Install Docker:
ni docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add your user to the docker group:
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# ---------------------------------------

sudo nala autoremove
