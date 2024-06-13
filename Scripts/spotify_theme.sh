#!/bin/bash

echo "Installing packages from Spotify Themes..."

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
  spicetify-cli
)

# Instalar cada paquete de la lista
for package in "${aur_packages[@]}"; do
    echo "Instalando $package con $AUR_HELPER..."
    $AUR_HELPER -S --noconfirm "$package"
done

echo "Configuring spicetify-cli..."
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
echo "Generate a new config file..."
spicetify
spicetify backup apply enable-devtools
echo "Configuring complete."
echo "Themes Installation..."
git clone --depth=1 https://github.com/spicetify/spicetify-themes.git
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes
echo "Themes complete."

echo "Spotify Themes installation completed."

echo "How to apply a theme? 🤔🤔"
echo "Go to this url: https://github.com/spicetify/spicetify-themes/blob/master/THEMES.md"
echo "Select a theme and copy the name of the theme."
echo "Select a colorscheme of theme and copy the name of the colorscheme theme."
echo -e "example:\nspicetify config current_theme Dribbblish\nspicetify config color_scheme Gruvbox-Material-Dark\nspicetify apply"

echo "Spotify marketplace for themes, plugins third-party and more: https://github.com/spicetify/marketplace/wiki/Installation#manual-install-recommended"
