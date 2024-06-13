#!/bin/bash

echo "Installing packages from official repositories..."

# Lista de paquetes para instalar
official_packages=(
  alsa-card-profiles
  alsa-lib
  alsa-plugins
  alsa-topology-conf
  alsa-ucm-conf
  alsa-utils
  android-file-transfer
  arandr
  blueman
  bluez
  bluez-libs
  bluez-utils
  brave-bin
  cups
  cups-filters
  cups-pdf
  cups-pk-helper
  docker
  docker-buildx
  docker-compose
  docker-scan
  eww-wayland
  file-roller
  font-manager
  glib2
  gnome-calculator
  gnome-keyring
  google-chrome
  grim
  gvfs
  hplip
  kitty
  ksshaskpass
  kvantum
  kvantum-qt5
  libcups
  lsd
  neovim
  obsidian
  pamixer
  pipewire
  pipewire-alsa
  pipewire-audio
  pipewire-jack
  pipewire-pulse
  pipewire-session-manager
  pipewire-zeroconf
  playerctl
  polkit
  polkit-gnome
  powertop
  pulsemixer
  python-pyqt5
  python-pyqt5-sip
  qbittorrent
  qt5-base
  qt5-declarative
  qt5-graphicaleffects
  qt5-quickcontrols
  qt5-quickcontrols2
  qt5-svg
  qt5-translations
  qt5-wayland
  qt5-x11extras
  qt6-5compat
  qt6-base
  qt6-declarative
  qt6-shadertools
  qt6-svg
  qt6-translations
  qt6-wayland
  ristretto
  scrcpy
  sddm
  slack-desktop
  slurp
  spotify
  tlp
  thunar
  thunar-archive-plugin
  thunar-media-tags-plugin
  thunar-shares-plugin
  thunar-volman
  udiskie
  unrar
  unzip
  vlc
  wayland
  wayland-protocols
  wl-clipboard
  wlroots
  xcb-util-cursor
  xdg-dbus-proxy
  xdg-desktop-portal
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-wlr
  xdg-user-dirs
  xdg-utils
  xf86-input-elographics
  xf86-input-libinput
  # xf86-video-amdgpu
  # xf86-video-ati
  xorg-bdftopcf
  xorg-fonts-encodings
  xorg-iceauth
  xorg-mkfontscale
  xorg-server
  xorg-server-common
  xorg-sessreg
  xorg-setxkbmap
  xorg-smproxy
  xorg-x11perf
  xorg-xauth
  xorg-xbacklight
  xorg-xcmsdb
  xorg-xcursorgen
  xorg-xdpyinfo
  xorg-xdriinfo
  xorg-xev
  xorg-xgamma
  xorg-xhost
  xorg-xinit
  xorg-xinput
  xorg-xkbcomp
  xorg-xkbevd
  xorg-xkbprint
  xorg-xkbutils
  xorg-xkill
  xorg-xlsatoms
  xorg-xlsclients
  xorg-xmodmap
  xorg-xpr
  xorg-xprop
  xorg-xrandr
  xorg-xrdb
  xorg-xrefresh
  xorg-xset
  xorg-xsetroot
  xorg-xvinfo
  xorg-xwayland
  xorg-xwd
  xorg-xwininfo
  xorg-xwud
  xorgproto
  yt-dlp
  zip
  zsh
)

# Instalar cada paquete de la lista
for package in "${official_packages[@]}"; do
    echo "Instalando $package..."
    sudo pacman -S --noconfirm "$package"
done

echo "Official package installation completed."

# Configuración adicional para Docker
echo "Configuring Docker..."

# Iniciar el servicio Docker
sudo systemctl start docker.service

# Habilitar Docker para que se inicie al arrancar el sistema
sudo systemctl enable docker.service

# Agregar el usuario actual al grupo docker (reemplaza 'username' con tu nombre de usuario o usa $USER)
sudo usermod -aG docker $USER

# Reiniciar Docker para aplicar cambios
sudo systemctl restart docker.service

echo "Docker configuration complete. You may need to restart your session to apply the group changes."

echo "Enabling SDDM service..."
sudo sudo systemctl start sddm.service
sudo sudo systemctl enable sddm.service
sudo sudo systemctl restart sddm.service
echo "SDDM enablement completed. You may need to restart your session to apply the changes."

echo "Configuring Bluetooth..."
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
sudo systemctl restart bluetooth.service
echo "Bluetooth setup complete. You may need to restart your session to apply the changes."

echo "Configuring zsh..."
chsh -s $(which zsh)
echo "zsh configuration complete. You may need to restart your session to apply the group changes."

echo "Configuring CUPS Printer"
sudo systemctl start cups.service
sudo systemctl enable cups.service
sudo systemctl restart cups.service
echo "CUPS setup complete. You may need to restart your session to apply the changes."
