#!/bin/bash
# ACTION: Install Google Chrome and set has default browser
# DEFAULT: n

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

# Associate template
xdg_template="[Default Applications]
text/html=google-chrome.desktop
x-scheme-handler/http=google-chrome.desktop
x-scheme-handler/https=google-chrome.desktop
x-scheme-handler/about=google-chrome.desktop
x-scheme-handler/unknown=google-chrome.desktop"

# Install Google Chrome
(
	git clone https://aur.archlinux.org/google-chrome
	cd /home/build/google-chrome
	cd google-chrome && sudo -u nobody makepkg -sirc --noconfirm
)

for d in /etc/skel /home/*/; do
	# Set Chrome as default browser
	d="$d/.config"
	[ ! -d "$d/.config" ] && mkdir -v "$d/.config" && echo "$xdg_template" >"$d/mimeapp.list" && chown -R $(stat "$d" -c %u:%g) "$d"
done
