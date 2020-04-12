#!/bin/bash
# ACTION: Install Brave browser, add to repositories and set has default browser
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Install Brave
(
	git clone https://aur.archlinux.org/brave-bin /home/build/brave-bin
	cd /home/build/brave-bin
	sudo -u nobody makepkg -sirc --noconfirm
)
