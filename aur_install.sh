# Setup yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# AUR packages
yay -S google-chrome spotify gnome-software \
          polybar i3-gaps-next-git \
          lightdm-webkit2-greeter \
          sublime-text-dev neofetch light \
          lightdm-webkit2-theme-material2 \
          bash-pipes tty-clock fetchmirrors \
          telegram-desktop-bin visual-studio-code-bin \
          ttf-montserrat otf-cooper-hewitt \
          --noconfirm

# The neovim-symlinks will try to remove the vi package, so I can`t
# use --noconfirm option
yay -S neovim-symlinks

# This installation occurs here, because of its dependencies
sudo pacman -S i3lock

# Change the greeter for lightdm to webkit2-greeter
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/' \
	/etc/lightdm/lightdm.conf

# Change the theme of the webkit2 to material2
sudo sed -i 's/webkit_theme        = antergos/webkit_theme        = material2/' \
	/etc/lightdm/lightdm-webkit2-greeter.conf

sudo systemctl enable -f lightdm.service
