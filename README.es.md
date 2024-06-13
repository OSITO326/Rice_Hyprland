# Rice Hyperland

<p align="left">
    <img src="https://img.shields.io/github/license/OSITO326/Rice_Hyprland?style=for-the-badge">
    <img src="https://img.shields.io/github/stars/OSITO326/Rice_Hyprland?style=for-the-badge">
    <img src="https://img.shields.io/github/issues/OSITO326/Rice_Hyprland?color=violet&style=for-the-badge">
    <img src="https://img.shields.io/github/forks/OSITO326/Rice_Hyprland?color=teal&style=for-the-badge">
</p>

<p align="left">Configuración para <a href="https://github.com/hyprwm/Hyprland">Hyprland</a>.</p>

---

**_Idioma_**

- 🇪🇸 Español
- [🇺🇸 English](https://github.com/OSITO326/Rice_Hyprland)

# Tabla de Contenidos

- [Paquetes](#paquetes)
- [Instrucciones de instalación](#instrucciones-de-instalación)
- [Configuración básica](#configuración-básica)
  - [Fuentes](#fuentes)
  - [Fondo de pantalla](#fondo-de-pantalla)
  - [Monitores](#monitores)
  - [Notificaciones](#notificaciones)
  - [Waybar](#waybar)
    - [Configuración inicial](#configuración-inicial)
    - [Módulo del tiempo (API Key)](#api-key-del-módulo-del-tiempo)
    - [Configurar módulo de batería](#configurar-módulo-de-batería)
    - [Configurar módulo personalizado](#configurar-módulo-personalizado)
    - [Crear módulo personalizado](#crear-módulo-personalizado)
  - [Rofi](#rofi)
  - [Tematización de GTK](#tematización-de-gtk)
  - [Qt](#qt)
  - [Cambiar tema de SDDM](#cambiar-tema-de-sddm)
- [Asignación de teclas](#asignación-de-teclas)

### Paquetes

Esta configuración contiene los paquetes necesarios para el funcionamiento de los siguientes paquetes:

- Hyprland (WM, Asignación de teclas, Fondo de pantalla, Bloqueo de pantalla) [hyprland](https://github.com/hyprwm/Hyprland) [hyprpaper](https://github.com/hyprwm/hyprpaper) [hyprlock](https://github.com/hyprwm/hyprlock)
- Mako (Centro de notificaciones) [mako](https://github.com/emersion/mako)
- Rofi (Lanzador) [rofi wayland](https://github.com/lbonn/rofi)
- Sddm (Gestor de inicio de sesión) [sddm](https://github.com/sddm/sddm)
- Waybar (Barra) [waybar-git](https://github.com/Alexays/Waybar)

### Instrucciones de instalación

Clonar el repositorio

```bash
git clone --depth=1 https://github.com/OSITO326/Rice_Hyprland.git Rice_Hyprland && chmod +x Rice_Hyprland/Scripts/install.sh && Rice_Hyprland/Scripts/install.sh
```

# Configuración básica

En esta sección, cubriremos algunos de los programas de configuración que son necesarios para esta configuración del sistema. Sin embargo, ten en cuenta que los cambios que vamos a hacer no serán permanentes. Puedes modificarlos como desees.

## Fuentes

Para el correcto funcionamiento de los glifos en Waybar, estas fuentes son necesarias.

- Awesome Fonts v6 pro [versión gratuita](https://fontawesome.com/v6/download)
- JetBrains Nerd Font Mono [enlace](https://www.nerdfonts.com/font-downloads)

## Fondo de pantalla

Primero, tu pantalla tendrá wall0.png como fondo de pantalla si usas solo un monitor, y si tienes el segundo monitor conectado, tendrá wall1.png como fondo de pantalla, por lo que es posible que desees tener un fondo de pantalla que se adapte a tus gustos.
Para cambiar el fondo de pantalla, ve a la ubicación `.config/hypr/` y edita el archivo `hyprpaper.conf`. Esto es lo que contendrá el archivo.

```conf
preload = ~/Pictures/Wallpapers/wall0.png
preload = ~/Pictures/Wallpapers/wall1.png
wallpaper = eDP-1,~/Pictures/Wallpapers/wall0.png
wallpaper = HDMI-A-1,~/Pictures/Wallpapers/wall1.png
```

Solo tendremos que modificar las rutas con el fondo de pantalla que desees, para saber qué formatos admite hyprpaper, consulta su documentación.

PD. [ver Monitores](#monitores) para cambiar la variable del controlador de video de salida. `eDP-1` `HDMI-A-1`.

## Monitores

Si tienes un sistema multi-monitor, seguramente querrás usar todas tus pantallas. Para hacerlo, ve a `.config/hypr/` y edita el archivo `hyprland.conf`. Encuentra la sección de monitores en el archivo.

```conf
################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
# monitor=nombre,resolución,posición,escala
# hyprctl monitors all
monitor=eDP-1,1920x1080@60,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1 # Monitor 60hz
# monitor=HDMI-A-1,1920x1080@120,1920x0,1 # Monitor 120hz
```

Te preguntarás de dónde vienen `eDP-1` o `HDMI-A-1`. Para averiguarlo, ejecuta el siguiente comando en la terminal: `hyprctl monitors`

```bash
hyprctl monitors
Monitor eDP-1 (ID 0):
	1920x1080@60.00000 at 0x0
	description: Samsung Display Corp. 0x4146
	make: Samsung Display Corp.
	model: 0x4146
	serial:
	active workspace: 5 (5)
	special workspace: 0 ()
	reserved: 0 25 0 0
	scale: 1.00
	transform: 0
	focused: yes
	dpmsStatus: 1
	vrr: 0
	activelyTearing: false
	disabled: false
	currentFormat: XRGB8888
	availableModes: 1366x768@60.00Hz

Monitor HDMI-A-1 (ID 1):
	1920x1080@120.00000 at 1920x0
	description: ASUSTek COMPUTER INC ASUS VG277Q1A 0x00034F09
	make: ASUSTek COMPUTER INC
	model: ASUS VG277Q1A
	serial: 0x00034F09
	active workspace: 7 (7)
	special workspace: 0 ()
	reserved: 0 25 0 0
	scale: 1.00
	transform: 0
	focused: no
	dpmsStatus: 1
	vrr: 0
	activelyTearing: false
	disabled: false
	currentFormat: XRGB8888
	availableModes: 1920x1080@120.00Hz 1920x1080@119.88Hz 1920x1080@60.00Hz 1920x1080@60.00Hz 1920x1080@59.94Hz 1920x1080@50.00Hz 1680x1050@59.88Hz 1280x1024@75.03Hz 1280x1024@60.02Hz 1440x900@59.90Hz 1280x960@60.00Hz 1152x864@75.00Hz 1280x720@60.00Hz 1280x720@60.00Hz 1280x720@59.94Hz 1280x720@50.00Hz 1440x576@50.00Hz 1440x576@50.00Hz 1024x768@75.03Hz 1024x768@70.07Hz 1024x768@60.00Hz 1440x480@60.00Hz 1440x480@60.00Hz 1440x480@59.94Hz 1440x480@59.94Hz 800x600@75.00Hz 800x600@72.19Hz 800x600@60.32Hz 800x600@56.25Hz 720x576@50.00Hz 720x576@50.00Hz 720x480@60.00Hz 720x480@60.00Hz 720x480@59.94Hz 720x480@59.94Hz 640x480@75.00Hz 640x480@72.81Hz 640x480@66.67Hz 640x480@60.00Hz 640x480@59.94Hz 640x480@59.94Hz 720x400@70.08Hz
```

Para modificar los Hz de tu monitor edita esta linea:

```conf
# monitor=HDMI-A-1,1920x1080@120,1920x0,1 # Monitor 120hz
monitor=HDMI-A-1,1920x1080@60,1920x0,1 # Monitor 60hz
```

Para más información de como configurar el monitor [aquí](https://wiki.hyprland.org/Configuring/Monitors/)

## Notificaciones

Mako se usa como centro de notificaciones. Las notificaciones están basadas en la esquina superior derecha, justo en el medio.
Para ver la configuración esta es la ruta: `./config/mako`

```bash
font=JetBrainsMono Nerd Font Mono Ultra-Bold 10
```

Para cambiar el tamaño de fuente, o la fuente que gustes. Para ver todas las variables de configuración ejecuta este comando en la terminal:

```bash
man 5 mako
```

Y verás todas las variables que puedes modificar.

## Waybar

Altamente personalizable Wayland [bar](https://github.com/alexays/waybar) para los compositores basados en Sway y Wlroots.
Debe saber cómo configurar la sección del módulo de módulos [aquí](https://github.com/alexays/waybar/wiki/module:-backlight-slider).

##### Configuración inicial

En esta configuración inicial, solo será para agregar o revolver cualquier módulo que no use, para esto iremos a esta ubicación: `~/.config/way bar/config.jsonc`

```jsonc
[
  // Monitor
  {
    "layer": "top", // Waybar position (top|bottom|left|right)
    "output": "eDP-1", // Waybar output
    "include": "~/.config/waybar/modules/modules.jsonc",
    "spacing": 3, // Gaps between modules (4px)
    "height": 25,
    // MODULES
    "modules-left": ["hyprland/workspaces", "hyprland/window"],
    "modules-center": ["clock"],
    "modules-right": [
      "group/group-widgets",
      "group/group-system",
      "network",
      "group/group-data",
    ],
  },
  // HDMI-A-1
  {
    "layer": "top", // Waybar position (top|bottom|left|right)
    "output": "HDMI-A-1", // Waybar output
    "include": "~/.config/waybar/modules/modules.jsonc",
    "spacing": 3, // Gaps between modules (4px)
    "height": 25,
    // MODULES
    "modules-left": ["hyprland/workspaces", "hyprland/window"],
    "modules-center": ["clock"],
    "modules-right": ["mpris", "custom/docker", "custom/weather"],
  },
]
```

Lo primero que debe tener en cuenta es el adaptador de video, en mi caso están con `eDP-1` y` HDMI-A-1`.
Para saber cuál es la salida, vea la [sección](#monitores).
Para eliminar los módulos, simplemente elimine los valores:

- `module-left`:`["hyprland/workspaces"],`Eliminar el módulo` hyprlan/window`
- `module-centeer`:`["clock"],`
- `module-right`:`["mpris", "custom/weather"]`Eliminar el módulo` custom/docker`

#### API KEY módulo clima

Es posible que tenga problemas con la operación del módulo "clima". No funcionará porque necesita una clave API para que funcione correctamente.
La ubicación del script está en: `~/.config/way bar/scripts/weather.py`

```python
API_KEY = ""  # Your API here
UNITS = "Metric"
UNIT_KEY = "C"
LANG = "es"
# UNIT_KEY = "F"
# LANG = "en"
```

Puede cambiar el idioma `LANG =" es "` `LANG =" en "` (español o inglés) o cambiar los grados de temperatura a fahrenheit en `unit_key =" f "`. Para colocar su ciudad en el guión, [aquí] (https://openweathermap.org/city) Busque su ciudad, por ejemplo, Nueva York es `https: // abreweathermap.org/ciudad/5128581` y modifique esta línea:

```python
API_KEY = "qwerty12345" # Your API here
```

#### Configurar módulo bateria

Para configurar los módulos en la siguiente ruta `~/.config/way bar/modules/modules.jsonc`

Ejemplo: editar `modules.jsonc` Búsqueda "Batería" [Módulo](https://github.com/alexays/waybar/wiki/module:-battery).

```jsonc
{
  "battery": {
    "bat": "BAT1", // run command ls /sys/class/power_supply/
    "adapter": "ACAD", // run command ls /sys/class/power_supply/
    "interval": 5,
    "states": {
      "warning": 30,
      "critical": 15,
    },
    "format": " {icon} {capacity}% ",
    "format-icons": {
      "charging": [
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰢜</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂆</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂇</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂈</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰢝</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂉</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰢞</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂊</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂋</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂅</span>",
      ],
      "default": [
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰁺</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰁻</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰁼</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰁽</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰁾</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰁿</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂀</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂁</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂂</span>",
        "<span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰁹</span>",
      ],
    },
    "format-full": " <span font='11' font-family=\"JetBrainsMono Nerd Font Mono\">󰂄 Full</span> ",
  }
```

Para el funcionamiento correcto de "BAT" y "Adaptador", ejecute el siguiente comando en el terminal:

```bash
ls /sys/class/power_supply/
 ACAD   BAT1
```

Este ejemplo es claro para modificar cualquier módulo que desee en el archivo `modules.jsonc`.

#### Configurar módulo personalizado

Como ejemplo, tomaremos el módulo de actualizaciones de paquetes instalados o puede ver [aquí](https://github.com/alexays/waybar/wiki/module:-custom) cómo crear un nuevo módulo donde también haremos un ejemplo.

```jsonc
  // Custom module check updates
  "custom/arch": {
    "format": " {icon} {}",
    "tooltip-format": "Packages to Update\n{icon}: {}",
    "format-icons": [
      "<span color=\"#d79921\" font-family=\"Font Awesome 6 Pro Solid\"></span>",
],
    "restart-interval": 1800, // 30 minutes
    "exec": "bash ~/.config/waybar/scripts/arch-updates.sh",
    "tooltip": false,
  }
```

- `arch-updates.sh`

```bash
#!/bin/sh

# if now working the command, install the package pacman-contrib
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l); then
    updates_arch=0
fi

if [ $updates_arch -gt 0 ]; then
    echo $updates_arch
else
    echo "0"
fi
```

En la documentación para crear módulos [personalizados](https://github.com/alexays/waybar/wiki/module:-custom), tendremos variables a tener en cuenta como: `format` `restart-interval` `exec`.
Estas variables mencionadas anteriormente serán:

- `fomat`: Para formatear la salida (cadena).
- `restart-interval`: El comando se ejecutará cada vez.
- `exec`: La ubicación del script que se ejecutará.

> [! Nota]
> El script se puede escribir en cualquier otro idioma, puede ser Python, por ejemplo.
> Para ver un ejemplo de un módulo personalizable con un script de Python. `MODULES.JSONC`" Custom/Weather ".

#### Crear módulo personalizado
