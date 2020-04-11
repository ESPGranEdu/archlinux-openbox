#!/bin/bash
# ACTION: Install VirtualBox 6.1 and Extension Pack, add to repositories and insert to Openbox menu
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

ep_url="https://download.virtualbox.org/virtualbox/6.1.4/Oracle_VM_VirtualBox_Extension_Pack-6.1.4.vbox-extpack"

# Install VirtualBox
pacman -Sy --noconfirm virtualbox virtualbox-guest-iso virtualbox-host-modules-arch

# Add VirtualBox in OpenBox menu:
# for d in /etc/skel/  /home/*/ ; do
#    # Skip dirs in /home that not are user home
#    [ "$(dirname "$d")" = "/home" ] && ! id "$(basename "$d")" &>/dev/null && continue#
#
#	f="$d/.config/openbox/menu.xml"
#	[ ! -f "$f" ] && continue
#	! grep -q '<command>virtualbox<\/command>' "$f" && sed -i '0,/<separator\/>/s//<item label="VirtualBox"><action name="Execute"><command>virtualbox<\/command><\/action><\/item> <separator\/>/' "$f"
# done

# Install extension pack
t=$(mktemp -d)
wget -P "$t" "$ep_url"
[ $? -eq 0 ] && yes | vboxmanage extpack install --replace "$t"/*extpack
rm -rf "$t"

# Fix Virtualbox not load gtk theme
pacman -Sy qt5-styleplugins
echo "export QT_QPA_PLATFORMTHEME=gtk2" >>/etc/environment
