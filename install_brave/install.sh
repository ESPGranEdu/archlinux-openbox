#!/bin/bash
# ACTION: Install Brave browser and set has default browser
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Association template
xdg_template="[Default Applications]
text/html=brave-browser.desktop
x-scheme-handler/http=brave-browser.desktop
x-scheme-handler/https=brave-browser.desktop
x-scheme-handler/about=brave-browser.desktop
x-scheme-handler/unknown=brave-browser.desktop"

# Install Brave
(
	git clone https://aur.archlinux.org/brave-bin /home/build/brave-bin
	cd /home/build/brave-bin
	sudo -u nobody makepkg -sirc --noconfirm
)

for d in /etc/skel /home/*/; do
	# Set Brave as default browser
	d="$d/.config"
	[ ! -d "$d/.config" ] && mkdir -v "$d/.config" && echo "$xdg_template" >"$d/mimeapp.list" && chown -R $(stat "$d" -c %u:%g) "$d"
done
