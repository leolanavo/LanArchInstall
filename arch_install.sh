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
ls -s /usr/share/zoneinfo/Brazil/East > /etc/localtime
hwclock --systohc --utc

# Hostname setting
echo $3 > /etc/hostname

# Expanding MirroList
nano /etc/pacman.conf
pacman -Sy

# Add user. I'm adding the user now, because I can`t use
# yaourt as root
useradd -m -g users -G wheel,storage,power -s /bin/bash $1

# Packages
./packages_install.sh $1 $2

# Now that zsh is installed, I can change my default shell
chsh -s /bin/zsh $1

# Add sudo power to new user
echo "Uncomment the %wheel line"
sleep(3)
EDITOR=nano visudo

# Set up passwords
echo "Set up the root password"
passwd
echo "Set up your own password"
passwd $1
