#!/bin/bash

# ARGUMENTS:
driver=$1   # $1 --> the flag for the specific driver

# This part is for the specific drivers needed by each of my systems:
# - the battery touchpad and bluetooth drivers are for the notebook;
# - the video card drivers are for the desktop.
if [ $driver == "note" ]; then
    pacman -S xf86-video-intel acpi libinput bluez bluez-utils blueberry --noconfirm
    systemctl enable bluetooth.service
elif [ $driver == "pc" ]; then
    pacman -S nvidia nvidia-libgl lib32-nvidia-libgl --noconfirm
fi

# Audio
pacman -S pulseaudio alsa-utils mpd pavucontrol --noconfirm

# Wifi
pacman -S wpa_supplicant dialog networkmanager network-manager-applet --noconfirm

# Base
pacman -S zsh openssh wget intel-ucode ntp htop terminator --noconfirm

# Xorg
pacman -S xorg-server xorg-xinit xorg-twm \
    xorg-xclock xterm xclip xorg-xrandr \
    xorg-xinput --noconfirm

# Editors
pacman -S neovim code --noconfirm

# Images
pacman -S feh maim sxiv gimp inkscape scrot imagemagick --noconfirm

# LaTeX
pacman -S texstudio texlive-core texlive-lang --noconfirm

# Docker
pacman -S docker docker-compose docker-machine --noconfirm

# Langs
pacman -S python3 python-pip ruby nodejs npm go go-tools crystal shards yarn --noconfirm

# Browser
pacman -S opera opera-ffmpeg-codecs --noconfirm

# Display Managers
pacman -S gnome gnome-extra gnome-tweak-tool i3-gaps \
    lightdm lightdm-webkit2-greeter --noconfirm

# Utils
pacman -S file-roller numlockx lxappearance \
    compton rofi arc-gtk-theme arc-icon-theme \
    evince cmatrix atril vlc telegram-desktop \
    neofetch --noconfirm

# Enablem both Network Manager and Lightdm
systemctl enable NetworkManager.service
systemctl enable lightdm.service
systemctl enable docker.socket
systemctl enable docker.service

# Change the greeter for lightdm to webkit2-greeter
sed -i \
    's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/' \
	/etc/lightdm/lightdm.conf
