#!/bin/bash
# ACTION: Install Sublime Text
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Install repositories and update
(
	git clone https://aur.archlinux.org/sublime-text-nightly /home/build/sublime-text-nightly
	cd sublime-text-nightly
	sudo -u nobody makepkg -sirc --noconfirm
)
