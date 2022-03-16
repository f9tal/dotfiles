#!/bin/bash

### ARTIX BASE INSTALL SCRIPT CREATED BY 463974616c0d0a
# This script is made for Artix Linux wit OpenRC init system, and is
# to be used after running basestrap and you chroot into your freshly
# made install, after mounting disks to their appropriate spots, I run:

# 1. $ basestrap /mnt base base-devel openrc elogind-openrc linux-zen linux-firmware neovim (intel/amd)-ucode
# 2. $ fstabgen -U /mnt >> /mnt/etc/fstab
# 3. $ artix-chroot /mnt 

# After those commands in the install process, you can use this script
# NOTE: Keep this repo in your / directory for the sake of the other scripts,
# you can remove this folder or move it somewhere else afterwards.
printf "\e[1;32mBeginning System Installation.\e[0m"



### SYSTEM CLOCK
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

printf "\e[1;32mSystem Clock has been configured.\e[0m"

### HOSTNAME/HOSTS
echo "009" >> /etc/hostname # You can change this to whatever

echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1   localhost" >> /etc/hosts
echo "127.0.1.1   009.localdomain   009" >> /etc/hosts
echo root:password | chpasswd #CHANGE :password to YOUR PASSWORD

printf "\e[1;32mHostname and Hosts have been configured.\e[0m"

### INSTALLING BASE PACKAGES 
# (You can also change, remove/add whatever you need)
sed -i '37s/.//' /etc/pacman.conf # Enables Parralel Downloads (3)
sed -i '33s/.//' /etc/pacman.conf # Enables Color in pacman

pacman -S --noconfirm grub efibootmgr linux-zen-headers os-prober dialog dosfstools ntfs-3g networkmanager networkmanager-openrc network-manager-applet bluez bluez-openrc firewalld firewalld-openrc openssh openssh-openrc libvirt libvirt-openrc acpi acpi_call acpid-openrc cups cups-openrc avahi avahi-openrc openbsd-netcat qemu edk2-ovmf bridge-utils virt-manager dnsmasq vde2 pipewire pipewire-jack pipewire-alsa pipewire-pulse wireplumber 

printf "\e[1;32mBase packages have been installed.\e[0m"

sed -i '49s/.//' /etc/makepkg.conf # Enables MultiThreading in makepkg

printf "\e[1;32mMulti-Threading enabled in makepkg.\e[0m"

### INSTALLING GRUB 
# NOTICE: My usual boot directory is /boot, however, you may have chosen a different one.
# Make sure that your boot directory isnt different (i.e /boot/efi)
# Uncheck the disable os-prober flag in /etc/default/grub to add Windows Boot Loader

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB # Installs GRUB
grub-mkconfig -o /boot/grub/grub.cfg # Generates GRUB configration file

printf "\e[1;32mGrub successfully configured.\e[0m"

### ENABLING OPENRC SERVICES
# Enabling and disabling a service in OpenRC can be done as follows:

# Starting a service: rc-service <service> start
# Adding a service to default: rc-update add <service> default

rc-update add NetworkManager default # Enables Networking
rc-update add cupsd default # Enables CUPS Printing Service
rc-update add libvirtd default # Enables KVM
rc-update add acpid default # Enables calls to ACPI methods
rc-update add bluetoothd default # Enables Bluetooth
rc-update add firewalld default # Enables Firewall
rc-update add avahi default # Enables Avahi

printf "\e[1;32mServices have been enabled.\e[0m"

### ADDING USERS
useradd -m tommy
echo tommy:password | chpasswd # Change password to YOUR PASSWORD
usermod -aG libvirt tommy 

echo "tommy ALL=(ALL) ALL" >> /etc/sudoers.d/tommy

printf "\e[1;32mUsername tommy has been added.\e[0m"

### COMPLETION MESSAGE  
printf "\e[1;32mAll operations have completed, Add user then unmount.\e[0m"
