#!/bin/bash
# ACTION: Install some basic packages
# INFO: Packages: vim vlc zip unzip gmtp mtp-tools mailutils traceroute acl gnupg2 synaptic galternatives yad mlocate evince
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
    echo "Must run as root" 1>&2
    exit 1
}

# Install free packages
pacman -Syy --noconfirm vim vlc zip unzip gmtp mtpfs mailutils traceroute acl gnupg yad mlocate evince wget cronie

# Enable cronie
systemctl enable --now cronie
