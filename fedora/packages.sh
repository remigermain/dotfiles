#!/bin/bash

cd $(dirname $0)
source ../common/linked/.extra.zshrc

echo -e "\n[$(color-blue install packages system)]"

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
    ImageMagick
    chromium
    codium
    dconf

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
	ascii
    g++
    gcc

    # docker
    docker-ce
    docker-ce-cli
    containerd.io
    docker-compose

    # tools
    cmake
    valgrind
    net-tools
    powerline
    adb
    htop
    arduino
    cargo

    # language
    python3
    ruby
    nodejs
    rust


    # lib
    jq
    yarnpkg
    glib2-devel
    ffmpeg-devel
	ffmpeg
	ffmpegthumbnailer
    gnome-directory-thumbnailer
	libavif-tools
	libavif

	# tor
	tor
	secure-delete
	macchanger
    veracrypt
)

echo "add rpmfusion repo..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "add codium repo..."
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]name=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo

# remvove docker
sudo dnf remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine moby-engine docker-compose
# docker repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo


echo "install app..."
sudo dnf install -y ${apps[@]}


echo "config for docker..."
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo firewall-cmd --permanent --zone=docker --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
sudo systemctl enable docker
sudo systemctl start docker
# add current user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER
