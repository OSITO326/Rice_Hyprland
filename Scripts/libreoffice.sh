#!/bin/bash

echo "Installing LibreOffice..."

packages=(
  hunspell
  hunspell-es_any
  hunspell-es_es
  hyphen
  hyphen-es
  libreoffice-fresh
  libreoffice-fresh-es
)

# Instalar cada paquete de la lista
for package in "${packages[@]}"; do
    echo "Instalando $package..."
    sudo pacman -S --noconfirm "$package"
done

echo "LibreOffice installation complete."
