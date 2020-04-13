# Openbox install script collection for Arch Linux
<img align="left"  src="https://user-images.githubusercontent.com/32820131/77852132-2de64c00-71dd-11ea-8a66-e4cd3de916f8.png" width="90"> Openbox is a beautiful and lightweight window manager, but tediuos to install and config a full usable environment. This script collection automatize **Openbox** installation and essentials tools and apply my personal configurations, styles and themes. Althoughs is a collection of my particular configs may be interesting for someone.
 
Each action script and dependences are in a directory. There are 4 scripts categories:
  * **install scripts**: install packages or download some installer and install those
  * **config scripts**: apply some configurations in system.
  * **theme scripts**: copy themes, icons, or apply some graphical configs
  * **script scripts**: install some script. 

The main script `install` can exec all scripts or only a select list:
  * `install -l`: list all scripts.
  * `install`: exec all scripts interactively asking for each one if install or not.
  * `install -d`: install all default scripts.
  * `install -a 5,8-12`: install selected scripts.

&nbsp; 
## Main features
  * Install Openbox and dependences.
  * Install and config essential Openbox tools: Tint2, Rofi, Terminator, Thunar, volume control, gsimplecal, etc.
  * Config a basic themes and styles for Openbox, Gtk, fonts, icon pack, wallpapers, exit menu.
  * Install some user tools: Brave/Chrome browser, SublimeText, Atom, VirtualBox and Extensión Pack, sudo,nomacs image viewer, WPS Office and others.
  * Config prompt,  path, aliases and home directories permissions.
  * Config Grub for skip menu or protect by password and show messages during boot.
  * Install [**`Numix-Paper icon theme`**](https://github.com/leomarcov/debian-openbox/tree/master/theme_numix-paper-icon), a theme based on Numix and Paper icon packs.
  * Install [**`autosnap Windows for Openbox`**](https://github.com/leomarcov/debian-openbox/tree/master/script_autosnap-openbox), a script for autosnap active windows (half-maximice). 
  * Install [**`tty login neofetch`**](https://github.com/leomarcov/debian-openbox/tree/master/script_tty-login-neofetch), a tty login based on neofetch info and config tty lock screen with physlock.
  * Install [**`update-notification script`**](https://github.com/leomarcov/debian-openbox/tree/master/script_update-notification-tint) for check and manage repositories updates.
  * Install [**`brightness control script`**](https://github.com/leomarcov/debian-openbox/tree/master/script_brightness-control) for increase/decrease birghtness screen.
  * Install [**`exit menu`**](https://github.com/leomarcov/debian-openbox/tree/master/script_exitmenu) based on rofi to show power and exit options.

<img src="https://user-images.githubusercontent.com/32820131/78614586-37bc1f00-786f-11ea-8c28-1509b8bb2c11.png">


&nbsp; 
## Install
  * Install [Arch Linux](https://www.archlinux.org/) or you could install other Arch based distro such as [EndeavourOS](https://endeavouros.com/) or [RebornOS](https://rebornos.org/) (succesor of Antergos), even Manjaro could work, but I'm not sure
  * Clone or download this project: `git clone https://github.com/ESPGranEdu/archlinux-openbox`
  * Exec `install` script and select scripts you want to install.
  
```
$ ./install -h
Exec scripts actions
Usage: install [-l] [-a <actions>] [-y] [-d] [-h]
   -l		Only list actions 
   -a <actions>	Only do selected actions (e.g: -a 5,6,10-15)
   -y		Auto-answer yes to all actions
   -d		Auto-answer default to all actions
   -h		Show this help


# Exec all actions interactively:
$ sudo ./install

# Exec all actions and answer yes to all:
$ sudo ./install -y

# Exec all actions and answer default to all:
$ sudo ./install -d

# Exec only actions 5,7,10,11,12,13,14 and 15:
$ sudo ./install -a 5,7,10-15


# List all actions:
$ ./install -l
[1] Install an AUR wrapper (y)
[2] Install some basic packages (y)
[3] Install Openbox and tools for full environment (y)
[4] Install Atom text editor (n)
[5] Install Brave browser and set as default browser (y)
[6] Install theme Conky with new theme (y)
[7] Install Google Chrome and set as default browser (n)
[8] Install nomacs image viewer and configs (y)
[9] Install rofi and config as default launcher (y)
[10] Install Sublime Text (y)
[11] Install sudo and add user 1000 to sudo (y)
[12] Install Termiantor terminal and config theme (y)
[13] Install and config Thunar (show toolbar and double-click for active items) (y)
[14] Install tint2 bar and themes (y)
[15] Install VirtualBox 6.1 and Extension Pack, add to repositories and insert to Openbox menu (y)
[16] Install VSCodium (y)
[17] Install mixer and volume control (y)
[18] Install WPS Office (y)
[19] Config pacman mirrorlist (y)
[20] Config useful aliases (y)
[21] Config modified .bash_profile file with new path and color definitions (y)
[22] Config new bash prompt (y)
[23] Config system for show messages during boot (y)
[24] Config to disable some unnecessary services (no start in boot time) (y)
[25] Config GRUB with password for prevent users edit entries (n)
[26] Config GRUB for skip menu (timeout=0) (n)
[27] Config users home directories permissions to 750 (y)
[28] Configure pacman.conf to display "pacman" progress bar and add multilib repos (y)
[29] Config CTRL+ALT+BACKSPACE shortcut for kill X server (y)
[30] Config vim with custom configs (y)
[31] Install script poweroff_last for automatize shutdown if no users logged in 20 minutes (n)
[32] Install script autosnap for autosnap windows with double click in titlebar (y)
[33] Install script brightness (y)
[34] Install script obexit with exit-power menu based on rofi (y)
[35] Config text mode login using tty instead of lightdm display manager (y)
[36] Install script update-notification (y)
[37] Install script to rotate everyday Linux solarized wallpapers pack by Andreas Linz (y)
[38] Install theme Arc GTK and set as default (y)
[39] Copy some  popular fonts (y)
[40] Install clear xfce4-notify theme (y)
[41] Install icon theme Numix-Paper and set as default (y)
[42] Install nitrogen,  copy wallpapers pack and set default wallpaper to all users (y)

```
  
&nbsp; 
## Customize
The script can be easily customized. Each `install.sh` script placed in a subdirectory are automatillacy recognized by `install`.
  * For remove action simply delete the action directory.
  * For add action simply add new folder and place the install script `install.sh` and dependences. The script must have this header:
  ```
  #!/bin/bash
  # ACTION: Description of the action
  # INFO: Optional aditional info
  # DEFAULT: y
  
  scripts commands
  
  ```

&nbsp;  
## Lincense
[GPLv3](LICENSE)

## Contact
My name's Eduardo Navarro Morales, I'm sysadmin and currently studying at [CIFP Carlos III](https://cifpcarlos3.es/)

You can email me at raplhwigum@gmail.com
