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
pacman -Syy --noconfirm vim vlc zip unzip gmtp mtpfs mailutils traceroute acl gnupg yad mlocate evince wget cronie xdg-utils man rsync

# Enable cronie
systemctl enable --now cronie

# Update man database and set cronjob to update periodically
echo -e "#!/bin/sh\nmandb" >/etc/cron.daily/mandb_update
chmod +x /etc/cron.daily/mandb_update
