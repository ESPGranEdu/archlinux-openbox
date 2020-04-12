#!/bin/bash
# ACTION: Install VSCodium
# INFO: Just the same as Visual Code without MS telemetry and other stuff
# DEFAULT: y

# Check root
[ $(id -u) != 0 ] && {
    echo "Must be root"
    exit 1
}

# Install VSCodium
(
    cd /home/build
    git clone https://aur.archlinux.org/vscodium-bin /home/build/vscodium-bin
    cd vscodium-bin && sudo -u nobody makepkg -sirc --noconfirm
)
