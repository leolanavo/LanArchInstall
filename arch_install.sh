#!/bin/bash

# ARGUMENTS:
#     $1 --> your user
#     $2 --> the flag for the system specific drivers
#     $3 --> your hostname

# Setting up locale
nano /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Setting up NTP and Time
ln -sf /usr/share/zoneinfo/Brazil/East > /etc/localtime
hwclock --systohc

# Hostname setting
echo $3 > /etc/hostname

# Expanding MirroList
nano /etc/pacman.conf
pacman -Sy

# Packages
./packages_install.sh $1 $2

# Add user
useradd -m -g users -G wheel,storage,power -s /bin/zsh $1

# Add sudo power to new user
echo "Uncomment the %wheel line"
sleep 3
EDITOR=nano visudo
clear

# Set up passwords
echo "Set up the root password"
passwd
echo "Set up your own password"
passwd $1
