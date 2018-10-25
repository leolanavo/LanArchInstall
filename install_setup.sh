#!/bin/bash

# ARGUMENTS:
root=$1   # $1 -> Root partition
boot=$2   # $2 -> Boot partition
swap=$3   # $3 -> Swap partition

# Change keyboard layout
loadkeys br-abnt2

# Setup Swap
mkswap $swap
swapon $swap

# Setup Root
mkfs.ext4 $root
mount $root /mnt
mkdir /mnt/boot

# Setup Boot
mkfs.fat -F32 $boot
mount $boot /mnt/boot

# Install basic kernel and some developer packages
pacstrap /mnt base base-devel

# Create the filesystem table using UUIDs
genfstab -U /mnt > /mnt/etc/fstab

# Copy this directory to the installed system, so you can run the second
# part of the script there
cp -r $(pwd) /mnt

# Change root to the new system
arch-chroot /mnt
