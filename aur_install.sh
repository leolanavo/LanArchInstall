# AUR packages
yaourt -S google-chrome spotify gnome-software \
          polybar i3-gaps \
          lightdm-webkit2-greeter \
          sublime-text-dev neofetch light discord \
          lightdm-webkit2-theme-material2 \
          opera-ffmpeg-codecs bash-pipes tty-clock \
          --noconfirm

# The neovim-symlinks will try to remove the vi package, so I can`t
# use --noconfirm option
yaourt -S neovim-symlinks

# Change the greeter for lightdm to webkit2-greeter
sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/' \
	/etc/lightdm/lightdm.conf

# Change the theme of the webkit2 to material2
sed -i 's/webkit_theme        = antergos/webkit_theme        = material2/' \
	/etc/lightdm/lightdm-webkit2-greeter.conf
