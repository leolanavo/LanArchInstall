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
          gnome gdm gnome-extra gnome-tweak-tool \
          file-roller neovim htop evince ranger compton \
          zsh feh maim sxiv mpd pavucontrol wget cmatrix atril \
          emacs gimp inkscape rofi vlc yaourt \
          texstudio texlive-core texlive-lang \
          python3 ruby nodejs npm jre9-openjdk-headless jre9-openjdk \
          jdk9-openjdk openjdk9-doc openjdk9-src racket \
          opera tty-clock numlockx \
          --noconfirm

# The vte3-ng dependency will conflict with vte3, so I can`t use
# --nocofirm option
pacman -S termite

# Enablem both Network Manager and Lightdm
systemctl enable NetworkManager.service
systemctl enable lightdm.service

su $1

# Import keys for discord app, because they aren`t importing
# properl
gpg --recv-key 8F0871F202119294
gpg --lsign 8F0871F202119294

# AUR packages
yaourt -S google-chrome spotify gnome-software \
          polybar i3-gaps \
          lightdm-webkit2-greeter \
          sublime-text-dev neofetch light discord \
          lightdm-webkit2-theme-material2 \
          opera-ffmpeg-codecs bash-pipes\
          --noconfirm

# The neovim-symlinks will try to remove the vi package, so I can`t
# use --noconfirm option
yaourt -S neovim-symlinks

exit

# Change the greeter for lightdm to webkit2-greeter
sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/' \
	/etc/lightdm/lightdm.conf

# Change the theme of the webkit2 to material2
sed -i 's/webkit_theme        = antergos/webkit_theme        = material2/' \
	/etc/lightdm/lightdm-webkit2-greeter.conf
