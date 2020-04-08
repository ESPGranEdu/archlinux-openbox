# Debian Openbox install script collection
<img align="left"  src="https://user-images.githubusercontent.com/32820131/77852132-2de64c00-71dd-11ea-8a66-e4cd3de916f8.png" width="90"> Openbox is a beautiful and lightweight desktop manager, but tediuos to install and config a full usable environment. This script collection automatize **Openbox** installation and essentials tools and apply my personal configurations, styles and themes. The script should be exec over **Debian 10** installation (better on netinstall without desktop environment installed). Each action can be selected interactively in order to install only desired packages and configs.

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
  * Install Debian 10 netinstall. Do not install `Debian desktop environment`.
  * Clone or download this project: `git clone https://github.com/debian-openbox`
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
[1] Install some basic packages (y)
[2] Install Openbox and tools for full environment (y)
[3] Add contrib and non-free repositories and install some basic packages (y)
[4] Config useful aliases (y)
[5] Copy modified .profile file with new path and color definitions (y)
[6] Config new bash prompt (y)
[7] Config system for show messages during boot (y)
[8] Config GRUB with password for prevent users edit entries (n)
[9] Config GRUB for skip menu (timeout=0) (n)
[10] Config users home directories permissions to 750  (y)
[11] Config CTRL+ALT+BACKSPACE shortcut for kill X server (y)
[12] Config vim with custom configs (y)
[13] Install Atom text editor (n)
[14] Install Brave browser, add to repositories and set has default browser (y)
[15] Install theme Conky with new theme (y)
[16] Install Google Chrome, add to repositories and set has default browser (n)
[17] Install nomacs image viewer and configs (y)
[18] Install script ps_mem.py (y)
[19] Install rofi and config as default launcher (y)
[20] Install Sublime Text, add repositories and set as default editor  (y)
[21] Install sudo and add user 1000 to sudo (y)
[22] Install Termiantor terminal and config theme (y)
[23] Install and config Thunar (show toolbar and double-click for active items) (y)
[24] Install tint2 bar and themes (y)
[25] Install VirtualBox 6.1 and Extension Pack, add to repositories and insert to Openbox menu (y)
[26] Install mixer and volume control (y)
[27] Install WPS Office (y)
[28] Install script poweroff_last for automatize shutdown if no users logged in 20 minutes (n)
[29] Install script autosnap for autosnap windows with double click in titlebar (y)
[30] Install script brightness (y)
[31] Install exit menu script based on rofi (y)
[32] Config text mode login using tty instead of lightdm display manager (y)
[33] Install script update-notification (y)
[34] Install theme Arc GTK and set as default (y)
[35] Install pack of popular fonts (y)
[36] Install clear xfce4-notify theme (y)
[37] Install icon theme Numix-Paper and set as default (y)
[38] Install nitrogen and copy wallpapers pack and set Aptenodytes wallpaper as default (y)

```
  
&nbsp; 
## Customize
The script can be easily customized. Each action script `.sh` placed in a subdirectory are automatillacy recognized by `install`.
  * For remove action simply delete the action directory.
  * For add action simply add new folder and place the install script `.sh` and dependences. The script must have this header:
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
My name is Leonardo Marco. I'm sysadmin teacher in [CIFP Carlos III](https://cifpcarlos3.es/), Cartagena, Murcia (Spain).

You can email me for suggestions, contributions, labadmin help or share your feelings: labadmin@leonardomarco.com
