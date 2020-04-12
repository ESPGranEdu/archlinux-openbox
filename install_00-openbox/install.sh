#!/bin/bash
# ACTION: Install Openbox and tools for full environment
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

base_dir="$(dirname "$(readlink -f "$0")")"

# Install Openbox and dependences
pacman -Sy --noconfirm openbox obconf xorg-server xorg-xinit lxappearance picom xfce4-screenshooter xfce4-clipman-plugin xfce4-power-manager arandr exo gsimplecal xcape gparted file-roller xautomation networkmanager

systemctl mask NetworkManager-wait-online.service

# COPY OPENBOX THEME
tar -xzvf "$base_dir"/openbox_theme.tgz -C /usr/share/themes/
cp -rv "$base_dir/openbox-menu" /usr/share/icons/

# COPY obamenu
cp -v "$base_dir/obamenu" /usr/bin

# COPY OPENBOX CONFIG FILES
for d in /etc/skel /home/*/; do
	# Skip dirs in /home that not are user home
	[ "$(dirname "$d")" = "/home" ] && ! id "$(basename "$d")" &>/dev/null && continue

	# Add custom xinitrc to launch openbox
	f=".xinitrc"
	{ [ ! -f "$d/$f" ] && sed 's/exec\s*/exec openbox-session/' "$d/$f"; } || echo -e "#!/bin/bash\nexec openbox-session" >"$d/$f"

	# Create config folder if no exists
	d="$d/.config/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"

	# Copy compton file
	f="compton.conf"
	cp -v "$base_dir/$f" "$d" && chown -R $(stat "$d" -c %u:%g) "$d/$f"

	# Create config folders if no exists
	d2="$d"
	d="$d/openbox/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"

	# Copy openbox config file
	f="rc.xml"
	cp -v "$base_dir/$f" "$d" && chown -R $(stat "$d" -c %u:%g) "$d/$f"
	# Copy openbox autostart file
	f="autostart"
	cp -v "$base_dir/$f" "$d" && chown -R $(stat "$d" -c %u:%g) "$d/$f"
	# Copy openbox menu file
	f="menu.xml"
	cp -v "$base_dir/$f" "$d" && chown -R $(stat "$d" -c %u:%g) "$d/$f"

	# Copy fonts.conf
	d="$d2/fontconfig/"
	[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"
	f="fonts.conf"
	cp -v "$base_dir/$f" "$d" && chown -R $(stat "$d" -c %u:%g) "$d/$f"

done

# INSTALL HELP DOCS
d="help"
cp -rv "$base_dir/$d" "/usr/share/doc/openbox/"

# INSTALL SYSTEM INFO DEPENDENCES
wget "https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py" -O /usr/bin/ps_mem && chmod +x /usr/bin/ps_mem
pacman -Sy --noconfirm s-tui dfc htop
