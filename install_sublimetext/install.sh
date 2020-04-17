#!/bin/bash
# ACTION: Install Sublime Text
# DEFAULT: n

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Install repositories and update
(
	sudo -u nobody git clone https://aur.archlinux.org/sublime-text-nightly /tmp/sublime-text-nightly
	cd sublime-text-nightly
	sudo -u nobody makepkg -sirc --noconfirm
)

# Cleanup
rm -rf /tmp/sublime-text-nightly
