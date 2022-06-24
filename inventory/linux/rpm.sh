#!/bin/bash

# Este repositorio debe de colocarse en ~/Documents/git

# ------------------------------------------------------------ # 

cd ~/Downloads

##  Adding Repos and Updates

### Vagrant
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

### Vivaldi
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo

### Flatpak Installation
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ------------------------------------------------------------ # 

## Update repos
sudo dnf updates

# Installation Process

## Install basic utils

### Core Utils
sudo dnf install -y dnf-plugins-core
sudo dnf install -y dnf-utils

### Gnome Stuff
sudo dnf install -y gnome-extensions-app
sudo dnf install -y gnome-tweaks

### git 
sudo dnf -y install git

###  Virtualization Tools for Fedora
sudo dnf -y install bridge-utils libvirt virt-install qemu-kvm
lsmod | grep kvm # check if the virtualization is ready
sudo dnf -y install libvirt-devel virt-top libguestfs-tools # More Virtualization tools for Fedora
### https://computingforgeeks.com/how-to-install-kvm-on-fedora/ Virtualization tools reference. 

## Install other Apps

### Vagrant Installation
sudo dnf -y install vagrant

### Ansible Installation
sudo dnf -y install ansible

### Neovim Installation
sudo dnf -y install neovim

### zsh install 
sudo dnf -y install zsh

### Other Utilities
sudo dnf -y install exa
sudo dnf -y install bat
sudo dnf -y install screenkey
sudo dnf -y install ocrfeeder
sudo dnf -y install plank
sudo dnf -y install paperwork
sudo dnf -y install gitg
sudo dnf -y install gittyup
sudo dnf -y install virt-manager

### Flatpak Apps

flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub org.fedoraproject.MediaWriter
flatpak install -y flathub de.haeckerfelix.Fragments
flatpak install -y flathub org.gnome.SoundRecorder
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub com.orama_interactive.Pixelorama
flatpak install -y flathub org.darktable.Darktable
flatpak install -y flathub org.flameshot.Flameshot
flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub org.zotero.Zotero
flatpak install -y flathub org.gustavoperedo.FontDownloader
flatpak install flathub com.github.Murmele.Gittyup
flatpak install flathub org.flameshot.Flameshot

# ------------------------------------------------------------ # 

# Config Files

## zsh config
chsh -s $(which zsh)
ln -s $HOME/Documents/git/dotfiles/zsh-config/linux/zshrc $HOME/.zshrc

## Neovim config

mkdir $HOME/.config/nvim/
touch $HOME/.config/nvim/init.vim
ln -s $HOME/Documents/git/dotfiles/nvim-config/init.vim $HOME/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# MANUAL INSTALLATION
echo "Install Jetbrains ToolBox"
echo "Install and configure VirtualBox"
echo "Install Ner Fonts"

"$@"
# This is my Fedora Server condifguraton
