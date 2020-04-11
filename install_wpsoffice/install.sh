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
	cd /home/build
	trizen -G wps-Office
	cd wps-office && sudo -u nobody makepkg -sirc --noconfirm
)

echo -e "[\e[93mWarning\e[0m] You should install a proper dictionary for better experience"
