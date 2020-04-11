#!/bin/bash
# ACTION: Install Sublime Text, add repositories and set as default editor
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Install repositories and update
(
	cd /home/build
	trizen -G sublime-text-nightly
	cd sublime-text-nightly && sudo -u nobody makepkg -sirc --noconfirm
)
