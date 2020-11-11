echo -e "\n[PACKAGES]"

apps=(
    # other
    flatpak
    vlc
    inkscape
    krita
    youtube-dl
    ulauncher
    keepassxc
    transmission

    # ops
    terminator
    git
    zsh
    tmux
    vim
    zsh
    curl
    sudo
    tree

    #docker
    moby-engine
    docker-compose 

    # tools
    cmake
    valgrind
    net-tools
    powerline
    adb
    htop

    # language
    python3
    ruby
    nodejs

    # lib
    jq
    yarnpkg
    glib2-devel
    ffmpeg-devel
)

echo "add repo rpmfusion..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# remove for docker
sudo dnf -y remove docker-*
sudo dnf -y config-manager --disable docker-*

echo "install ${apps[@]}..."
sudo dnf install -y ${apps[@]}


echo "config for docker..."
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
sudo systemctl enable docker
# add current user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

echo "upgrade pip..."
sudo python3 -m pip install --upgrade pip