#!/bin/bash
# ACTION: Configure pacman.conf to display "pacman" progress bar and add multilib repos
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Remove comments to enable options
sed -i '
	s/^#Color/Color/g;
	s/^#CheckSpace/CheckSpace/g;
	/CheckSpace/a ILoveCandy
	/\[multilib\]/I, +1 s/^#//
' /etc/pacman.conf

# Perform repo database upgrade
pacman -Syy
