#!/bin/bash

# ARGUMENTS:
#     $1 --> your user
#     $2 --> the flag for the system specific drivers
#     $3 --> your hostname

# Setting up locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Setting up NTP and Time
ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
hwclock --systohc

# Hostname setting
echo $3 > /etc/hostname

# Expanding MirroList
sed -i 's/^#Color/Color/g' /etc/pacman.conf
sed -i 's/^#TotalDownload/TotalDownload\nILoveCandy/g' /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrolist" >> /etc/pacman.conf
pacman -Sy

# Packages
./packages_install.sh $2

# Add user
useradd -m -g users -G wheel,storage,power,docker -s /bin/zsh $1

# Add sudo power to new user
sed -ri 's/^#( %wheel ALL=\(ALL\) ALL$)/\1/g' /etc/sudoers
clear

# Set up passwords
echo "Set up the root password"
passwd
echo "Set up your own password"
passwd $1
