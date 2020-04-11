#!/bin/bash
# ACTION: Install sudo and add user 1000 to sudo
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
    echo "Must run as root" 1>&2
    exit 1
}

# Install sudo
pacman -Sy --noconfirm sudo

# Add user 1000 to sudo group
user=$(cat /etc/passwd | cut -f 1,3 -d: | grep :1000$ | cut -f1 -d:)

# Uncomment sudo group in sudoers
sed -i '/\%sudo/ s/^#//' /etc/sudoers

! { getent group | grep -q sudo; } && groupadd sudo
[ "$user" ] && gpasswd -a "$user" sudo
