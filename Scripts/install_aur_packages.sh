#!/bin/bash

echo "Installing packages from AUR..."

# Verificar si yay o paru están instalados
if command -v yay &> /dev/null; then
    AUR_HELPER="yay"
elif command -v paru &> /dev/null; then
    AUR_HELPER="paru"
else
    echo "Neither 'yay' nor 'paru' are installed. Please install one of them to continue."
    exit 1
fi

# Lista de paquetes de AUR para instalar
aur_packages=(
  archlinux-tweak-tool-git
  downgrade
  mongodb-compass
  postman-bin
  rofi-emoji-git
  sddm-theme-tokyo-night-git
  simplenote-electron-bin
  swappy-git
  ttf-apple-emoji
  ttf-ms-fonts
)

# Instalar cada paquete de la lista
for package in "${aur_packages[@]}"; do
    echo "Instalando $package con $AUR_HELPER..."
    $AUR_HELPER -S --noconfirm "$package"
done

echo "AUR package installation completed."
