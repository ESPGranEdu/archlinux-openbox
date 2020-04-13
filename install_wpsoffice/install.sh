#!/bin/bash
# ACTION: Install WPS Office
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Install WPS Office
(
	sudo -u nobody git clone https://aur.archlinux.org/wps-office /tmp/wps-office
	cd /tmp/wps-office
	sudo -u nobody makepkg -sirc --noconfirm
)

echo -e "[\e[93mWarning\e[0m] You should install a proper dictionary for better experience"
