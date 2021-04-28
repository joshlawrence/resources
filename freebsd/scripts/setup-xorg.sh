#!/bin/sh
# setup-xorg.sh
#
# installs xorg for a new freebsd 13 system

# install xorg and other useful packages
install_xorg() {
    pkg install -y xorg \
        firefox \
        google-fonts \
        terminus-font \
        dbus
}

# install kde
install_kde() {
    # add proc to /etc/fstab
    sysrc dbus_enable="YES"
    service dbus start
    pkg install -y kde5
}

# main
cat << EOF
setup-xorg.sh

this script will do the following on a fresh freebsd 13 install:

    - install xorg and other useful packages
    - enable and start the dbus service
    - install kde5

NOTE! you must add the proc filesystem to /etc/fstab before you can continue!

suggested entry:
    proc /proc procfs rw 0 0

then issue `mount -a`.

EOF

# give the user a chance to bail out
read -p "have you mounted the proc filesystem and wish to continue? (y/n): " MY_REPLY
if [ "$MY_REPLY" != "y" ]; then
    echo "exiting..."
    exit 1
fi

echo "installing xorg..."
install_xorg
echo "installing kde5..."
install_kde

# complete setup
cat << EOF

setup is complete.

to run kde from startx, add this to ~/.xinitrc:

    exec ck-launch-session startplasma-x11

good luck!
EOF
