#!/bin/bash
# ACTION: Install Google Chrome, add to repositories and set has default browser
# DEFAULT: n

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Install Google Chrome
(
	git clone https://aur.archlinux.org/google-chrome
	cd /home/build/google-chrome
	cd google-chrome && sudo -u nobody makepkg -sirc --noconfirm
)
