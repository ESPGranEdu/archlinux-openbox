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
pacman -Syy --noconfirm vim vlc zip unzip gmtp mtpfs mailutils traceroute acl gnupg yad mlocate evince wget cronie xdg-utils xdg-user-dirs man rsync network-manager-applet tlp

# Enable services
systemctl enable --now cronie
systemctl enable --now tlp

# Update man database and set cronjob to update periodically
echo -e "#!/bin/sh\nmandb" >/etc/cron.daily/mandb_update
chmod +x /etc/cron.daily/mandb_update
