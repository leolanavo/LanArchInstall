#!/bin/bash

# ARGUMENTS:

# This part is for the specific drivers needed by each of my systems:
# - the battery touchpad and bluetooth drivers are for the notebook;
# - the video card drivers are for the desktop.
if [ $1 == "note" ]; then
    pacman -S acpi libinput bluez bluez-utils blueberry --noconfirm
    systemctl enable bluetooth.service
elif [ $1 == "pc" ]; then
    pacman -S nvidia nvidia-libgl lib32-nvidia-libgl --noconfirm
fi

pacman -S xorg-server xorg-xinit xorg-twm xorg-xclock xterm xclip xorg-xrandr xorg-xinput \
          wpa_supplicant dialog networkmanager openssh network-manager-applet \
          ntp intel-ucode pulseaudio alsa-utils \
          gnome gdm gnome-extra gnome-tweak-tool lightdm \
          file-roller neovim htop evince ranger compton \
          zsh feh maim sxiv mpd pavucontrol wget cmatrix atril \
          emacs gimp inkscape rofi vlc yaourt scrot imagemagick\
          texstudio texlive-core texlive-lang \
          python3 ruby nodejs npm jre9-openjdk-headless jre9-openjdk \
          jdk9-openjdk openjdk9-doc openjdk9-src racket \
          opera numlockx opera-ffmpeg-codecs docker docker-compose
          docker-machine python-pip yarn \
          --noconfirm

# The vte3-ng dependency will conflict with vte3, so I can`t use
# --nocofirm option
pacman -S termite

# Enablem both Network Manager and Lightdm
systemctl enable NetworkManager.service
systemctl enable gdm.service
systemctl enable docker.socket
systemctl enable docker.service
