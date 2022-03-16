#!/bin/bash

# This script installs and configures everything needed for my bspwm
# environment, You are to use this script after running the base script,
# and this script is recommended on freshly installed systems where 
# you have only ran basestrap and the base script.

# Prerequisites:

# 1. Artix Linux (OpenRC init system)
# 2. Base script has ran (artix-base.sh)
# 3. PARU AUR Helper


### CHECK FOR FASTEST MIRRORS
sudo reflector -c Canada -a 12 --sort rate --save /etc/pacman.d/mirrorlist #Change to your country if Needed

### CONFIGURE FIREWALL
sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

### ADD CONFIG DIRECTORIES FOR WINDOW MANAGER
mkdir -p $HOME/.config/bspwm
mkdir -p $HOME/.cofnig/polybar
mkdir -p $HOME/.config/sxhkd

### INSTALLING PACKAGES FOR ENVIRONMENT
sudo pacman -Syy --noconfirm zsh xorg-server xorg-xinit xorg-server-devel xorg-xsetroot xorg-xrandr pacman-contrib dmenu rofi bspwm sxhkd dmenu nitrogen pavucontrol pcmanfm xarchiver alacritty xterm xdg-utils xdg-user-dirs lxappearance lxsession qt5ct htop alsa-utils kvantum-qt5 firefox keepassxc gtk-engines gtk-engine-murrine polkit-qt5 libdbusmenu-qt5 qt5-base qt5-multimedia


### COPY CONFIGURATION FILES OVER
sudo cp /dotfiles/config/bspwmrc $HOME/.config/bspwm/
sudo cp /dotfiles/config/sxhkdrc $HOME/.config/sxhkd/
sudo cp /dotfiles/config/polybar/config.ini $HOME/.config/polybar/
sudo cp /dotfiles/config/polybar/launch.sh $HOME/.config/polybar/
sudo cp /dotfiles/config/polybar/scripts $HOME/.config/polybar/
sudo cp /dotfiles/config/picom.conf $HOME/.config/picom.conf
sudo cp /dotfiles/.xinitrc $HOME/.xinitrc
sudo cp /dotfiles/config/alacritty/alacritty.yml $HOME/.config/alacritty/
sudo cp /dotfiles/zsh $HOME/.zsh
sudo cp /dotfiles/.zshrc $HOME/.zshrc


### MAKE POLYBAR SCRIPTS EXECUTABLE
sudo chmod +x $HOME/.config/polybar/launch.sh
sudo chmod +x $HOME/.config/polybar/scripts/updates-pacman-aurhelper.sh
sudo chmod +x $HOME/.config/polybar/scripts/polybar-mullvad-status.sh
sudo chmod +x $HOME/.config/polybar/scripts/system-nvidia-smi.sh
sudo chmod +x $HOME/.config/polybar/scripts/player-cmus.sh

### CONFIGURE ENVIRONMENT FOR KVANTUM
sudo echo "QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment 

### INSTALL POLYBAR, MULLVAD, SPOTIFY AND FONTS
paru -S --noconfirm polybar mullvad-vpn-beta mullvad-openrc spotify 
paru -S --noconfirm ttf-ms-fonts # Windows Fonts
paru -S --noconfirm apple-fonts # Apple Fonts
paru -S --noconfirm nerd-fonts-sf-mono # San Francisco Mono with Nerd Fonts patched
paru -S --noconfirm gruvbox-dark-icons-gtk gruvbox-dark-gtk #Gruvbox Dark 
paru -S --noconfirm picom-ibhagwan-git


### ENABLE MULLVAD OPENRC SERVICE
sudo rc-update add mullvadd default
sudo rc-service mulladd start

### COMPLETION MESGSAGE
printf "\e[1;32mAll operations have completed, Install a video driver. (Intel,AMD,Nvidia).\e[0m"
