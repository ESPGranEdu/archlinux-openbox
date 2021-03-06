#!/bin/bash
# ACTION: Install script to rotate everyday Linux solarized wallpapers pack by Andreas Linz
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

base_dir="$(dirname "$(readlink -f "$0")")"

# Install dependences
pacman -Sy --noconfirm cronie

# Copy rotate script in cron.daily dir
f="wallpaper-rotate"
cp -v "${base_dir}/$f" /etc/cron.daily/
chmod a+x "/etc/cron.daily/$f"

# Exec now rotation
"/etc/cron.daily/$f"
