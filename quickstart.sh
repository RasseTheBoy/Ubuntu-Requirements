
ai () {
    sudo nala update
    sudo nala install -y $@
}

# ---------------------------------------

echo "Update and upgrade"
sudo apt update && sudo apt upgrade

# ---------------------------------------

echo "Nala"
sudo apt install nala
sudo nala fetch

# ---------------------------------------

echo "Add repositories"
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo add-apt-repository universe
sudo add-apt-repository multiverse Steam

sudo dpkg --add-architecture i386

sudo nala update && sudo nala upgrade

# ---------------------------------------

echo "Install necessary packages"
ai \
    curl \
    wget \
    git \
    nano \
    fastfetch \
    btop \
    gnome-tweaks \
    gnome-shell-extension-manager \
    steam-installer \
    ca-certificates

# ---------------------------------------

echo "Brave (beta)"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg] https://brave-browser-apt-beta.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-beta.list
ai brave-browser-beta

echo "Remove Firefox"
sudo apt remove -y firefox

# ---------------------------------------

echo "Spotify"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
ai spotify-client

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
sudo nala install ./vscode.deb
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
ai docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Run the hello-world container to verify that Docker is installed correctly:
sudo docker run hello-world

# ---------------------------------------

echo "Snap packages"

function si() {
    for pacakge in $@; do
        sudo snap install $pacakge
    done
}

sudo snap install blender --classic
si mailspring

# ---------------------------------------

echo "DisplayLink"
wget -O displaylink.deb https://www.synaptics.com/sites/default/files/Ubuntu/pool/stable/main/all/synaptics-repository-keyring.deb
sudo nala install -y ./displaylink.deb
ai displaylink-driver
rm ./displaylink.deb

# ---------------------------------------

sudo nala autoremove

# ---------------------------------------

echo "Steam"
steam
