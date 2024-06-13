#!/bin/bash

# ASCII Art
ascii_art="
██████╗ ██╗ ██████╗███████╗    ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ 
██╔══██╗██║██╔════╝██╔════╝    ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
██████╔╝██║██║     █████╗      ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
██╔══██╗██║██║     ██╔══╝      ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
██║  ██║██║╚██████╗███████╗    ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝    ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 
                                                                                                  "

# Mostrar el ASCII Art
echo "$ascii_art"

# Asignar permisos de ejecución a los scripts
chmod +x ./Scripts/install_aur_packages.sh
chmod +x ./Scripts/install_packages.sh
chmod +x ./Scripts/install_rice.sh
chmod +x ./Scripts/libreoffice.sh

# Scripts changebrightness y changevolume
chmod +x ./bin/changebrightness
chmod +x ./bin/changevolume

# Bucle para mostrar el menú hasta que el usuario elija salir
while true; do
    echo
    echo "Select an option to install:"
    echo "1: Packages"
    echo "2: AUR Packages"
    echo "3: Rice"
    echo "4: LibreOffice"
    echo "5: Exit"
    read -p "Enter the option number: " option

    case $option in
        1)
            ../Scripts/install_packages.sh
            break
            ;;
        2)
            ../Scripts/install_aur_packages.sh
            break
            ;;
        3)
            ../Scripts/install_rice.sh
            break
            ;;
        4)
            ../Scripts/libreoffice.sh
            break
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac

    # Esperar antes de volver al menú principal
    read -p "Press Enter to continue..."
done
