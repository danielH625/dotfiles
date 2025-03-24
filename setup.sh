#!/bin/bash

# Detect OS
if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$ID
else
  echo "Unsupported OS"
  exit 1
fi

# Function to install packages based on OS
install_packages() {
  case "$OS" in
  arch)
    echo "Detected Arch Linux. Installing packages..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm --needed \
      kitty hyprland wofi waybar ttf-font-awesome git base-devel

    if ! command -v yay &>/dev/null; then
      echo "Installing yay..."
      git clone https://aur.archlinux.org/yay.git "$HOME/yay"
      cd "$HOME/yay" || exit
      makepkg -si --noconfirm
      cd "$HOME" || exit
      rm -rf "$HOME/yay"
    fi

    yay -S --noconfirm \
      hyprshot swaync hyprlock hypridle hyprpaper stow starship wlogout \
      ttf-cascadia-code-nerd ttf-jetbrains-mono-nerd nwg-look catppuccine-gtk-theme-mocha
    ;;
  debian | ubuntu | kali)
    echo "Detected Debian-based OS. Installing packages..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y \
      kitty hyprland wofi waybar fonts-font-awesome git stow starship \
      swaylock swayidle fonts-cascadia-code fonts-jetbrains-mono grim slurp nwg-look
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
  esac
}

# Install packages
install_packages

# Stow dotfiles (force overwrite)
echo "Applying dotfiles with stow..."
stow --restow --verbose */

echo "Setup complete!"
