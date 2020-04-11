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
	cd /home/build
	trizen -G brave-bin
	cd brave-bin && sudo -u nobody makepkg -sirc --noconfirm
)
