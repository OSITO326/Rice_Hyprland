#!/bin/bash

echo "Installing Hyprland and Waybar Configuration ..."

# Verificar si yay o paru están instalados
if command -v yay &> /dev/null; then
    AUR_HELPER="yay"
elif command -v paru &> /dev/null; then
    AUR_HELPER="paru"
else
    echo "Neither 'yay' nor 'paru' are installed. Please install one of them to continue."
    exit 1
fi

packages=(
  hyprcursor
  hypridle
  hyprland
  hyprlock
  hyprpaper
  rofi-emoji-git
  swappy-git
  ttf-apple-emoji
  xdg-desktop-portal-hyprland
  waybar-git
)

# Instalar cada paquete de la lista
for package in "${packages[@]}"; do
    echo "Instalando $package con $AUR_HELPER..."
    $AUR_HELPER -S --noconfirm "$package"
done

echo "Hyprland and Waybar package installation completed."

# Copiar directorios a ~/.config/
echo "Copying directories to ~/.config/ ..."
cp -r ../Configs/hypr ~/.config/
cp -r ../Configs/mako ~/.config/
cp -r ../Configs/rofi ~/.config/
cp -r ../Configs/swappy ~/.config/
cp -r ../Configs/waybar ~/.config/
echo "Directories copied to ~/.config/ ."

echo "Giving execution permissions to scripts"
chmod +x ~/.config/mako/load
chmod +x ~/.config/waybar/scripts/arch-updates.sh
chmod +x ~/.config/waybar/scripts/aur-updates.sh
chmod +x ~/.config/waybar/scripts/pulseaudio.sh
chmod +x ~/.config/waybar/scripts/trash-info.sh
chmod +x ~/.config/waybar/scripts/weather.py
echo "Execution permissions completed"

echo "Copy changebrightness and changevolume script"
cp -r ../bin/ ~/.local/
chmod +x ~/.local/bin/changebrightness
chmod +x ~/.local/bin/changevolume
echo "Copy done!"

echo "Copy fonts!"
cp -r ../fonts ~/.local/share/
fc-cache -f -v
echo "Copy done!"

echo "
    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗      █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║
    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
echo "
         ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗██████╗ ██╗
        ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║
        ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗  ██║  ██║██║
        ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝  ██║  ██║╚═╝
        ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗██████╔╝██╗
         ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═════╝ ╚═╝"
