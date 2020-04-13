#!/bin/bash
# ACTION: Install an AUR wrapper
# INFO: There's sometimes that you can not find packages in the official repos of arch, and that's where the Arch User Repository comes into place
# DEFAULT: y

# Check root
[ "$(id -u)" != 0 ] && {
    echo "Must be root" 1>&2
    exit 1
}

sudo
# Clone trizen repos
sudo -u nobody git clone https://aur.archlinux.org/trizen /tmp/trizen

# Make and install
(
    cd /tmp/trizen
    sudo -u nobody makepkg -sirc --noconfirm
)
