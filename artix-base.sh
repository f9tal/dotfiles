#!/bin/bash

### ARTIX BASE INSTALL SCRIPT CREATED BY 463974616c0d0a

# This script is made for Artix Linux wit OpenRC init system, and is
# to be used after running basestrap and you chroot into your freshly
# made install, after mounting disks to their appropriate spots, I run:
#
# $ basestrap /mnt base base-devel openrc linux-zen linux-firmware neovim (intel/amd)-ucode
# $ fstabgen -U /mnt >> /mnt/etc/fstab
# $ artools-chroot /mnt 
#
# After those commands in the install process, you can use this script

#

#     ▄████  ██     ▄▄▄▄▀ ██   █     
#     █▀   ▀ █ █ ▀▀▀ █    █ █  █     
#     █▀▀    █▄▄█    █    █▄▄█ █     
#     █      █  █   █     █  █ ███▄  
#      █        █  ▀         █     ▀ 
#       ▀      █            █        
#      ▀            ▀         


### CREATE A SWAPFILE 

dd=if/dev/zero of=/swapfile bs=1G count=2 status=progress # Creates a swapfile at root dir
chmod 600 /swapfile # Fixes permissions for swapfile
mkswap /swapfile # Turns file into swap
swapon /swapfile # Enables swap
echo "/swapfile     none  swap    defaults    0 0" >> /etc/fstab # Outputs to fstab to start at boot


### SYSTEM CLOCK

ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf


### HOSTNAME/HOSTS

echo "009" >> /etc/hostname # You can change this to whatever

echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1   localhost" >> /etc/hosts
echo "127.0.1.1   009.localdomain   009" >> /etc/hosts
echo root:password | chpasswd

### INSTALLING BASE PACKAGES (You can also change, remove/add whatever you need)
### In some instances, you may not need as many or need more for your use case.

pacman -S grub efibootmgr linux-zen-headers os-prober dialog dosfstools ntfs-3g networkmanager networkmanager-openrc network-manager-applet bluez bluez-openrc openssh openssh-openrc libvirt libvirt-openrc acpi acpi_call acpid-openrc openbsd-netcat qemu edk2-ovmf bridge-utils virt-manager virt-viewer dnsmasq vde2 libguestfs pipewire pipewire-jack pipewire-alsa pipewire-pulse wireplumber


### INSTALLING GRUB 

# NOTICE: My usual boot directory is /boot, however, you may have chosen a different one.
# Make sure that your boot directory isnt different (i.e /boot/efi)

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB # Installs GRUB

grub-mkconfig -o /boot/grub/grub.cfg # Generates GRUB configration file

### ENABLING OPENRC SERVICES

rc-update add NetworkManager default # Enables Networking
rc-update add cupsd default # Enables CUPS Printing Service
rc-update add libvirtd default # Enables KVM
rc-update add acpid default # Enables calls to ACPI methods
rc-update add bluetoothd default # Enables Bluetooth

### ADDDING USERS

useradd -m tommy
echo tommy:password | chpasswd 
usermod -aG libvirt tommy 

echo "tommy ALL=(ALL) ALL" >> /etc/sudoers.d/tommy

### DOWNLOAD AUR HELPER

git clone https://aur.archlinux.org/paru.git ; cd paru ; makepkg -si


### COMPLETION MESSAGE  

printf "\e[1;32mAll operations have completed, type umount -a and reboot.\e[0m"
