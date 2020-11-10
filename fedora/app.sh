echo -e "\n[APP]"

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

    # tools
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
    glib2-devel
    yarnpkg
    glib2-devel
)

echo "add repo rpmfusion..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "install ${apps[@]}..."
sudo dnf install -y ${apps[@]}

echo "upgrade pip..."
sudo python3 -m pip install --upgrade pip