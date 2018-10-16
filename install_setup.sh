#!/bin/bash

# ARGUMENTS:
#   $1 -> Root partition
#   $2 -> Boot partition
#   $3 -> Swap partition

# Change keyboard layout
loadkeys br-abnt2

# Setup Swap
mkswap $3
swapon $3

# Setup Root
mkfs.ext4 $1
mount $1 /mnt
mkdir /mnt/boot

# Setup Boot
mkfs.fat -F32 $2
mount $2 /mnt/boot

# Install basic kernel and some developer packages
pacstrap /mnt base base-devel

# Create the filesystem table using UUIDs
genfstab -U /mnt > /mnt/etc/fstab

# Copy this directory to the installed system, so you can run the second
# part of the script there
cp -r $(pwd) /mnt

# Change root to the new system
arch-chroot /mnt
