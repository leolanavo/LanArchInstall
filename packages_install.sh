#!/bin/bash

# ARGUMENTS:
#     $1 --> your user
#     $2 --> the flag for the specific

# This part is for the specific drivers needed by each of my systems:
# - the battery touchpad and bluetooth drivers are for the notebook;
# - the video card drivers are for the desktop.
if [ $2 == "note" ]; then
    pacman -S acpi libinput bluez bluez-utils blueberry --noconfirm
elif [ $2 == "pc" ]; then
    pacman -S nvidia mesa mesa-libgl lib32-mesa-libgl --noconfirm
fi

pacman -S xorg-server xorg-xinit xorg-twm xorg-xclock xterm xclip xorg-xrandr \
          wpa_supplicant dialog networkmanager openssh network-manager-applet \
          ntp intel-ucode pulseaudio alsa-utils \
          gnome gdm gnome-extra gnome-tweak-tool lightdm \
          file-roller neovim htop evince ranger compton \
          zsh feh maim sxiv mpd pavucontrol wget cmatrix atril \
          emacs gimp inkscape rofi vlc yaourt \
          texstudio texlive-core texlive-lang \
          python3 ruby nodejs npm jre9-openjdk-headless jre9-openjdk \
          jdk9-openjdk openjdk9-doc openjdk9-src racket \
          opera numlockx \
          --noconfirm

# The vte3-ng dependency will conflict with vte3, so I can`t use
# --nocofirm option
pacman -S termite

# Enablem both Network Manager and Lightdm
systemctl enable NetworkManager.service
systemctl enable lightdm.service
