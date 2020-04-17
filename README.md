# Openbox script collection for ArchLinux
<img align="left"  src="https://user-images.githubusercontent.com/32820131/77852132-2de64c00-71dd-11ea-8a66-e4cd3de916f8.png" width="90"> Openbox is a beautiful and lightweight window manager, but tediuos to install and config a full usable environment. This script collection automatize **Openbox** installation and essentials tools and apply configurations, styles and themes. Althoughs is a collection of my particular configs may be interesting for someone. You can install all scripts from bare ArchLinux installation to config full environment or exec only some scripts you are interested. Each folder has a particular action script for install pacakges, add scripts, apply configs or install some themes or styles.

The main script `install` can exec all scripts or only a select list:
  * `install`: exec all scripts interactively.
  * `install -l`: list all scripts.
  * `install -d`: install all scripts with default option Y.
  * `install -a 5,8-12`: exec selected scripts.
  * `install -a grub`: exec all actions with `grub` in description.

&nbsp; 
## Main features
  * Install Openbox and dependences.
  * Install and config essential Openbox tools: Tint2, Rofi, Terminator, Thunar, volume control, gsimplecal, etc.
  * Config a basic themes and styles for Openbox, Gtk, fonts, icon pack, wallpapers, exit menu.
  * Install some user tools: Brave/Chrome browser, SublimeText, Atom, VirtualBox and Extensión Pack, sudo,nomacs image viewer, WPS Office and others.
  * Config prompt,  path, aliases and home directories permissions.
  * Config Grub for skip menu or protect by password and show messages during boot.
  * Install [**`Numix-Paper icon theme`**](https://github.com/leomarcov/debian-openbox/tree/master/10_openbox_numix-paper-icons), a theme based on Numix and Paper icon packs.
  * Install [**`autosnap Windows for Openbox`**](https://github.com/leomarcov/debian-openbox/tree/master/10_openbox_autosnap), a script for autosnap active windows (half-maximice). 
  * Install [**`tty login neofetch`**](https://github.com/leomarcov/debian-openbox/tree/master/script_login-neofetch), a tty login based on neofetch info and config tty lock screen with physlock.
  * Install [**`update-notification script`**](https://github.com/leomarcov/debian-openbox/tree/master/10_openbox_update-notification) for check and manage repositories updates.
  * Install [**`brightness control script`**](https://github.com/leomarcov/debian-openbox/tree/master/script_brightness-control) for increase/decrease birghtness screen.
  * Install [**`exit menu`**](https://github.com/leomarcov/debian-openbox/tree/master/10_openbox_exit-menu) based on rofi to show power and exit options.

<img align="center" width="450" src="https://user-images.githubusercontent.com/32820131/79147593-764c5f00-7dc4-11ea-9ca2-f2569260928f.png"> <img align="center" width="450" src="https://user-images.githubusercontent.com/32820131/79147594-76e4f580-7dc4-11ea-9f2c-56376bd9e6fa.png">

<img align="center" width="450" src="https://user-images.githubusercontent.com/32820131/79147600-777d8c00-7dc4-11ea-9e01-f3d072fa8961.png"> <img align="center" width="450" src="https://user-images.githubusercontent.com/32820131/79166592-cbe53380-7de5-11ea-8a62-e88f10d6b2a0.png">

&nbsp; 
## Install
  * Install ArchLinux (any Arch based distro should work, as long as it is a bare minimun installation (tty)).
  * Clone or download this project: `git clone https://github.com/ESPGranEdu/archlinux-openbox`
  * Exec `install` script and select scripts you want to install.
  
```
$ ./install -h
Exec a set of scripts
Usage: install [-l] [-a <actions>] [-y] [-d] [-h]
   -l		Only list actions 
   -a <actions>	Filter selected actions by number range or text pattern (comma separated)
   -y		Auto-answer yes to all actions
   -d		Auto-answer default to all actions
   -h		Show this help


# Exec all actions interactively:
$ ./install

# Exec all actions and answer yes to all (no ask):
$ ./install -y

# Exec all actions and answer default to all (no ask and only exec actions with default Y):
$ ./install -d

# Exec only actions 5,7,10,11,12,13,14 and 15:
$ ./install -a 5,7,10-15

# Exec only actions with grub text in description:
$ ./install -a grub

# List all actions:
$ ./install -l
 [1] Install an AUR wrapper (y)
 [2] Install some basic packages (y)
 [3] Install Openbox and tools for full environment (y)
 [4] Install Atom text editor (n)
 [5] Install Brave browser and set as default browser (y)
 [6] Install Conky and add basic sysinfo-shortcuts panel (y)
 [7] Install CUPS printer system and add user 1000 to lpadmin group (n)
 [8] Install Google Chrome and set as default browser (n)
 [9] Install nomacs image viewer and configs (y)
 [10] Install rofi and config as default launcher (y)
 [11] Install Sublime Text (n)
 [12] Install sudo and add user 1000 to sudo (y)
 [13] Install Terminator terminal and config theme (y)
 [14] Install and config Thunar (show toolbar and double-click for active items) (y)
 [15] Install tint2 bar and themes (y)
 [16] Install VirtualBox 6.1 and Extension Pack (y)
 [17] Install VSCodium (y)
 [18] Install mixer and volume control (y)
 [19] Install WPS Office (y)
 [20] Config pacman mirrorlist (y)
 [21] Config CTRL+ALT+BACKSPACE shortcut for kill X server (y)
 [22] Configure keyboard according to your country (y)
 [23] Config useful aliases (y)
 [24] Config modified .bash_profile file with new path and color definitions (y)
 [25] Config new bash prompt (y)
 [26] Config system for show messages during boot (y)
 [27] Config to disable some unnecessary services (no start in boot time) (y)
 [28] Config GRUB with password for prevent users edit entries (n)
 [29] Config GRUB for skip menu (timeout=0) (n)
 [30] Configure pacman.conf to display "pacman" progress bar and add multilib repos (y)
 [31] Config vim with custom configs (y)
 [32] Install script poweroff_last for automatize shutdown if no users logged in 20 minutes (n)
 [33] Install script autosnap for autosnap windows with double click in titlebar (y)
 [34] Install script brightness (y)
 [35] Install script obexit with exit-power menu based on rofi (y)
 [36] Config text mode login using tty instead of lightdm display manager (y)
 [37] Install script update-notification (y)
 [38] Install script to rotate everyday Linux solarized wallpapers pack by Andreas Linz (y)
 [39] Install theme Arc GTK and set as default (y)
 [40] Copy some  popular fonts (y)
 [41] Install clear xfce4-notify theme (y)
 [42] Install icon theme Numix-Paper and set as default (y)
 [43] Install nitrogen tool, copy wallpapers pack and set default wallpaper to all users (y)

```
&nbsp; 
## Customize
The script can be easily customized. Each `install.sh` script placed in a subdirectory are automatillacy recognized by `install`.
  * For remove action simply delete the action directory.
  * For add action simply add new folder and place inside `install.sh` script and dependences. `install.sh` script must have this header:
  ```
  #!/bin/bash
  # ACTION: Description of the action
  # INFO: Optional additional info
  # DEFAULT: y
  
  scripts commands
  
  ```

&nbsp;  
## Lincense
[GPLv3](LICENSE)

## Contact
My name is Eduardo Navarro Morales, I'm sysadmin and student in [CIFP Carlos III](https://cifpcarlos3.es/), Cartagena, Murcia (Spain).

You can email me for suggestions at raplhwigum@gmail.com