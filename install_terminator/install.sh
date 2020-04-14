#!/bin/bash
# ACTION: Install Terminator terminal and config theme
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

base_dir="$(dirname "$(readlink -f "$0")")"

# Install terminator
pacman -Sy --noconfirm terminator

# Install config
for d in /etc/skel/ /home/*/; do
	# Create config folders if no exists
	d="$d/.config/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"
	d="$d/terminator/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"

	f="config"
	cp -v "$base_dir/$f" "$d/" && chown -R $(stat "$d" -c %u:%g) "$d/$f"
done
