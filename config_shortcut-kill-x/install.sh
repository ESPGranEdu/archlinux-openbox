#!/bin/bash
# ACTION: Config CTRL+ALT+BACKSPACE shortcut for kill X server
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && {
	echo "Must run as root" 1>&2
	exit 1
}

if grep -qi "serverflags" /etc/xorg.conf; then
	sed -i '/ServerFlags/a \\tOption "DontZap" "off"' /etc/X11/xorg.conf
else
	echo -e "Section \"ServerFlags\"
	\tOption \"DontZap\" \"off\"
	EndSection" >>/etc/X11/xorg.conf
fi

if [ -f /etc/X11/xorg.conf.d/00-keyboard.conf ]; then
	sed -i '/InputClass/a \\tOption "XkbOptions" "terminate:ctrl_alt_bksp"' /etc/X11/xorg.conf.d/00-keyboard.conf
else
	echo -e "Section \"InputClass\"
	\tIdentifier \"system-keyboard\"
	\tMatchIsKeyboard \"on\"
	\tOption \"XkbOptions\" \"terminate:ctrl_alt_bksp\"
	EndSection" >/etc/X11/xorg.conf.d/00-keyboard.conf
fi
