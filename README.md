# Rice Hyperland

<p align="left">
    <img src="https://img.shields.io/github/license/OSITO326/Rice_Hyprland?style=for-the-badge">
    <img src="https://img.shields.io/github/stars/OSITO326/Rice_Hyprland?style=for-the-badge">
    <img src="https://img.shields.io/github/issues/OSITO326/Rice_Hyprland?color=violet&style=for-the-badge">
    <img src="https://img.shields.io/github/forks/OSITO326/Rice_Hyprland?color=teal&style=for-the-badge">
</p>

<p align="left">Configuration for <a href="https://github.com/hyprwm/Hyprland">Hyprland</a>.</p>

---

**_Language_**

- [🇪🇸 Español](./README.es.md)
- 🇺🇸 English

# Table of Contents

- [Packages](#packages)
- [Instructions to install](#instructions-to-install)
- [Basic configuration](#basic-configuration)
  - [Wallpaper](#wallpaper)
  - [Monitors](#monitors)
  - [Notifications](#notifications)
  - [Waybar](#waybar)
  - [Rofi](#rofi)
- [Keybinding](#keybindings)

### Packages

This configuration contains the necessary configuration packages for the operation of the following packages:

- Hyprland (WM, Keybinding, Wallpaper, Lockscreen) [hyprland](https://github.com/hyprwm/Hyprland) [hyprpaper](https://github.com/hyprwm/hyprpaper) [hyprlock](https://github.com/hyprwm/hyprlock)
- Mako (Notification center) [mako](https://github.com/emersion/mako)
- Rofi (Launcher) [rofi wayland](https://github.com/lbonn/rofi)
- Sddm (Login manager) [sddm](https://github.com/sddm/sddm)
- Waybar (Bar) [waybar-git](https://github.com/Alexays/Waybar)

### Instructions to install

Clone the repository

```bash
git clone https://github.com/OSITO326/Rice_Hyprland.git
```

# Basic configuration

In this section, we will cover some of the configuration software that is needed for this system setup. However, please note that the changes we are going to make will not be permanent. You can modify them as you wish.

## Wallpaper

First things first, your screen will have wall0.png as its wallpaper if you are using only one monitor, and if you have the 2nd monitor connected it will have wall1.png as its wallpaper, so you may want to have a wallpaper that suits your tastes.
To change the wallpaper go to the location `.config/hypr/` and edit the file `hyprpaper.conf`. This is what the file will contain.

```conf
preload = ~/Pictures/Wallpapers/wall0.png
preload = ~/Pictures/Wallpapers/wall1.png
wallpaper = eDP-1,~/Pictures/Wallpapers/wall0.png
wallpaper = HDMI-A-1,~/Pictures/Wallpapers/wall1.png
```

We will only have to modify the paths with the wallpaper you want, to know which formats hyprpaper supports, check its [documentation](https://github.com/hyprwm/hyprpaper).

PD. See [Monitors](#monitors) to change variable the output video driver. `eDP-1` `HDMI-A-1`.

## Monitors

If you have a multi-monitor system, you surely want to use all your screens. To do this go to `.config/hypr/` and edit the `hyprland.conf` file. Find the monitors section in the file.

```conf
################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
# monitor=name,resolution,position,scale
# hyprctl monitors all
monitor=eDP-1,1920x1080@60,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1 # Monitor 60hz
# monitor=HDMI-A-1,1920x1080@120,1920x0,1 # Monitor 120hz
```

You may be wondering where `eDP-1` or `HDMI-A-1` come from. To do this, run the following command in the terminal: `hyprctl monitors`

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

To modify Hz in your monitor edit this line:

```conf
# monitor=HDMI-A-1,1920x1080@120,1920x0,1 # Monitor 120hz
```

More information to configure monitor see [this](https://wiki.hyprland.org/Configuring/Monitors/).

## Notifications

Notification center with `mako`, to configure the "default" settings go to `.config/mako/` and edit `config` file.
You edit as your like, for example change the font:

```bash
font=JetBrainsMono Nerd Font Mono Ultra-Bold 10
```

You change the font size, whatever you want. To see more variables to configure run this command:

```bash
man 5 mako
```

And you can see all values.

## Waybar

## Rofi

A window switcher, Application launcher and dmenu replacement. You see the [documentation](https://github.com/lbonn/rofi).
To configure rofi To configure rofi, we have 5 launchers to configure as colorschemes 'themes' (Drun, Emoji, FilesBrowser, Clipboard, PowerMenu).

##### **Change colorscheme and fonts on (Drun, Emoji, FilesBrowser, Clipboard)**

The location path to configure are: `~/.config/rofi/theme/launcher/shared/colors.rasi` to colorschemes or `~/.config/rofi/theme/launcher/shared/fonts.rasi` to fonts.

```config
/* Import color-scheme from `colors` directory */

@import "~/.config/rofi/colors/gruvbox.rasi"
```

To change colorschemes available are in this path `~/.config/rofi/colors/`, just change it to the one you like the most.

- List colorschemes available: `adapta catppuccin everforest navy paper arc cyberpunk gruvbox nord solarized black dracula lovelace onedark yousai`.

Example:

```config
@import "~/.config/rofi/colors/onedark.rasi"
```

##### **Change colorscheme and fonts on (PowerMenu)**

The location path to configure are: `~/.config/rofi/theme/powermenu/style/shared/colors.rasi` to colorschemes or `~/.config/rofi/theme/powermenu/style/shared/fonts.rasi` to fonts.

```config
/* Import color-scheme from `colors` directory */

@import "~/.config/rofi/colors/gruvbox.rasi"
```

To change colorschemes available are in this path `~/.config/rofi/colors/`, just change it to the one you like the most.

- List colorschemes available: `adapta catppuccin everforest navy paper arc cyberpunk gruvbox nord solarized black dracula lovelace onedark yousai`.

Example:

```config
@import "~/.config/rofi/colors/onedark.rasi"
```

### Keybindings

Now that you're in Hyprland, you should know some of the default keybindings.

| Key                            | Action                                |
| ------------------------------ | ------------------------------------- |
| **mod + Return**               | launch kitty (terminal)               |
| **mod + E**                    | thunar (file browser)                 |
| **mod + B**                    | brave (browser)                       |
| **mod + M**                    | spotify (music)                       |
| **mod + N**                    | simplenote (notes app)                |
| **mod + Space**                | rofi (launcher)                       |
| **mod + .**                    | rofi (emoji-launcher)                 |
| **mod + Shift+E**              | rofi (launcher-Files)                 |
| **mod + V**                    | rofi (clipboard manager)              |
| **mod + Shift+P**              | rofi (powermenu)                      |
| **mod + X**                    | hyprlock (Lockscreen)                 |
| **mod + Shift + -**            | brightness down                       |
| **mod + Shift + =**            | brightness up                         |
| **mod + Shift + .**            | volume down                           |
| **mod + Shift + ,**            | volume up                             |
| **Print**                      | screenshot                            |
| **mod + W**                    | kill window active                    |
| **mod + S**                    | float window                          |
| **mod + ,**                    | fullscreen window                     |
| **mod + P**                    | window dwindle                        |
| **mod + h**                    | move focus window left                |
| **mod + j**                    | move focus window down                |
| **mod + k**                    | move focus window up                  |
| **mod + l**                    | move focus window right               |
| **mod + Shift + h**            | switch window left                    |
| **mod + Shift + j**            | switch window down                    |
| **mod + Shift + k**            | switch window up                      |
| **mod + Shift + l**            | switch window right                   |
| **mod + [1234567890]**         | go to workspace [1234567890]          |
| **mod + Shift + [1234567890]** | move window to workspace [1234567890] |
| **ALT + Tab**                  | switch tab                            |
| **ALT + Shift + Tab**          | switch tab previous                   |
| **mod + Tab**                  | cycle recent workspace                |
| **mod + Ctrl + Q**             | logout                                |
