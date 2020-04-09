#!/bin/bash
# ACTION: Install tint2 bar and themes
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

base_dir="$(dirname "$(readlink -f "$0")")"

# INSTALL TINT
find /var/cache/apt/pkgcache.bin -mtime 0 &>/dev/null ||  apt-get update
apt-get install -y tint2


# Check if laptop:
[ -f /sys/module/battery/initstate ] || [ -d /proc/acpi/battery/BAT0 ] && laptop="true"
# Check if virtualmachine:
cat /proc/cpuinfo | grep -i hypervisor &>/dev/null && virtualmachine="true"

for d in /etc/skel/  /home/*/; do
    # Skip dirs in /home that not are user home
    [ "$(dirname "$d")" = "/home" ] && ! id "$(basename "$d")" &>/dev/null && continue
	
	# Create config folders if no exists
	d="$d/.config/"; [ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$(dirname "$d")" -c %u:%g) "$d"
	d="$d/tint2/";  [ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$(dirname "$d")" -c %u:%g) "$d"
	
	# Copy all tint2 configs
	cp -v "$base_dir/"*.tint "$d" && chown $(stat "$(dirname "$d")" -c %u:%g) "$d"/*.tint
	
	[ "$laptop" ] && [ ! "$virtualmachine" ] && tint_version="_laptop"
	
	# Include taskbar.tint in session file
	echo "$d/taskbar${tint_version}.tint" | tr -s "/" > "$d/tint2-sessionfile"
	echo "$d/menu.tint" | tr -s "/" >> "$d/tint2-sessionfile"
	chown $(stat "$(dirname "$d")" -c %u:%g) "$d/tint2-sessionfile"; 
done

# Copy tint2-session
f="tint2-session"
cp -v "$base_dir/$f" /usr/bin
chmod a+x "/usr/bin/$f"
