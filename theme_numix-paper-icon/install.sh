#!/bin/bash
# ACTION: Install icon theme Numix-Paper and set as default
# INFO: Numix-Paper is a icon theme based on Numix and Paper icon themes.
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

base_dir="$(dirname "$(readlink -f "$0")")"
icon_default="Numix-Paper"

# INSTALL NUMIX & PAPER ICON PACAKGES
(
	sudo -u nobody git clone https://aur.archlinux.org/numix-icon-theme-git /tmp/numix-icon-theme-git
	cd /tmp/numix-icon-theme-git
	sudo -u nobody makepkg -sirc --noconfirm
)

# Install paper icon theme
(
	sudo -u nobody git clone https//aur.archlinux.org/paper-icon-theme /tmp/paper-icon-theme
	cd /tmp/paper-icon-theme
	sudo -u nobody makepkg -sirc --noconfirm
)

# Install bunsen paper icon theme
tar -xzvf "$base_dir"/paper-bunsen-icon-theme.tgz -C /usr/share/icons/

if [ ! -d /usr/share/icons/Numix/ ]; then
	echo "$(basename $0) ERROR: Numix theme is not installed"
	exit 1
fi

tar -xzvf "$base_dir"/numix-paper-icon-theme.tgz -C /usr/share/icons/

for d in /etc/skel/ /home/*/; do
	# Skip dirs in /home that not are user home
	[ "$(dirname "$d")" = "/home" ] && ! id "$(basename "$d")" &>/dev/null && continue

	f="$d/.gtkrc-2.0"
	[ ! -f "$f" ] && cp -v "$base_dir/gtkrc-2.0" "$d/.gtkrc-2.0" && chown -R $(stat "$d" -c %u:%g) "$f"
	sed -i 's/^gtk-icon-theme-name *= *.*/gtk-icon-theme-name="'"$icon_default"'"/' "$f"

	# Create config folders if no exists
	d="$d/.config/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"
	d="$d/gtk-3.0/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"

	f="$d/settings.ini"
	[ ! -f "$f" ] && cp -v "$base_dir/settings.ini" "$d" && chown -R $(stat "$d" -c %u:%g) "$f"
	sed -i 's/^gtk-icon-theme-name *= *.*/gtk-icon-theme-name='"$icon_default"'/' "$f"
done

# Generate numix paper icon theme
bash "$base_dir"/generate-numix-paper-icon-theme.sh -I
