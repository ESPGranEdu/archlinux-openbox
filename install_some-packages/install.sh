#!/bin/bash
# ACTION: Install some useful packages
# INFO: Useful packages: vim vlc ttf-mscorefonts-installer fonts-freefont-ttf fonts-droid-fallback rar gmtp mtp-tools mailutils traceroute acl netcat
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

find /var/cache/apt/pkgcache.bin -mtime 0 &>/dev/null ||  apt-get update  

# Install free packages
apt-get install -y vim vlc fonts-freefont-ttf fonts-droid-fallback zip unzip gmtp mtp-tools mailutils traceroute acl gnupg2

# Install non-free packages
apt-get install ttf-mscorefonts-installer rar
  
