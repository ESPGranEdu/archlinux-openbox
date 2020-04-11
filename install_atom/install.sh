#!/bin/bash
# ACTION: Install Atom text editor
# DEFAULT: n

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

pacman -Sy --noconfirm atom
