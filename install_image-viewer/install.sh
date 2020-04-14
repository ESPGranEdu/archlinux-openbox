#!/bin/bash
# ACTION: Install nomacs image viewer and configs
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

base_dir="$(dirname "$(readlink -f "$0")")"

# Install nomacs
pacman -Sy --noconfirm nomacs

# Install config
for d in /etc/skel/ /home/*/; do
	# Create config folders if no exists
	d="$d/.config/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"
	d="$d/nomacs/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"

	f="Image Lounge.conf"
	cp -v "$base_dir/$f" "$d/" && chown -R $(stat "$d" -c %u:%g) "$d/$f"
done
