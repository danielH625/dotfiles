#!/bin/bash

# List of symlinked files and directories to replace
ITEMS=(
    "$HOME/.config/hypr/hyprlock.conf"
    "$HOME/.config/hypr/hyprpaper.conf"
    "$HOME/.config/hypr/mocha.conf"
    "$HOME/.config/kitty/current-theme.conf"
    "$HOME/.config/kitty/kitty.conf"
    "$HOME/.config/backgrounds"
    "$HOME/.config/starship.toml"
    "$HOME/.config/wofi"
    "$HOME/.config/waybar/config.jsonc"
    "$HOME/.config/waybar/mocha.css"
    "$HOME/.config/waybar/style.css"
)

for item in "${ITEMS[@]}"; do
    if [ -L "$item" ]; then  # Check if it's a symlink
        if [ -d "$item" ]; then  # If it's a directory
            echo "Converting symlinked directory $item to a real directory..."
            target=$(readlink -f "$item")  # Get actual target path
            rm -rf "$item"  # Remove the symlink
            cp -r "$target" "$item"  # Copy the original directory
        else  # If it's a file
            echo "Converting $item to a regular file..."
            cp --remove-destination "$item" "$item.bak"
            mv "$item.bak" "$item"
        fi
    else
        echo "$item is not a symlink, skipping."
    fi
done

echo "All symlinks replaced with regular files/directories!"
