# Setup yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/

# AUR packages
yay -S google-chrome spotify \
          polybar i3-gaps light \
          lightdm-webkit2-theme-material2 \
          bash-pipes tty-clock fetchmirrors \
          ttf-montserrat otf-cooper-hewitt \
          --noconfirm

# The neovim-symlinks will try to remove the vi package, so I can`t
# use --noconfirm option
yay -S neovim-symlinks

# This installation occurs here, because of its dependencies
sudo pacman -S i3lock

# Change the theme of the webkit2 to material2
sudo sed -i 's/webkit_theme        = antergos/webkit_theme        = material2/' \
	/etc/lightdm/lightdm-webkit2-greeter.conf
