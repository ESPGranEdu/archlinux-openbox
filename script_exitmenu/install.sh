#!/bin/bash
# ACTION: Install script obexit with exit-power menu based on rofi
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

base_dir="$(dirname "$(readlink -f "$0")")"

# Install fonts-noto for utf-8 symbols
pacman -Sy --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

f="obexit"
cp -v "$base_dir/$f" /usr/bin
chmod +x "/usr/bin/$f"

for d in /etc/skel/ /home/*/; do
	# Skip dirs in /home that not are user home
	[ "$(dirname "$d")" = "/home" ] && ! id "$(basename "$d")" &>/dev/null && continue

	# Create config folders if no exists
	d="$d/.config/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"
	d="$d/rofi/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"

	# Copy theme
	f="openbox-menu.rasi"
	cp -v "$base_dir/$f" "$d/" && chown -R $(stat "$d" -c %u:%g) "$d/$f"
done
