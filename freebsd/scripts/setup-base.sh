#!/bin/sh
# setup-base.sh
#
# runs basic setup tasks for a new freebsd 13 system

# update the os
update_os() {
    freebsd-update fetch
    freebsd-update install
}

# setup package management
setup_pkg() {
    pkg bootstrap
    mkdir -p /usr/local/etc/pkg/repos
    cp /etc/pkg/FreeBSD.conf /usr/local/etc/pkg/repos/
    sed -i '' 's/quarterly/latest/' /usr/local/etc/pkg/repos/FreeBSD.conf
    pkg update -f
    pkg upgrade
}

# enable the firewall
enable_pf() {
    cat <<EOF >/etc/pf.conf
set skip on lo0
block in all
pass in proto tcp to port { 22 }
pass out all keep state
EOF
    touch /var/log/pf.log
    sysrc pf_enable=YES
    sysrc pf_flags=""
    sysrc pf_rules="/etc/pf.conf"
    sysrc pflog_enable=YES
    sysrc pflog_flags=""
    sysrc pflog_logfile="/var/log/pf.log"
}

# install useful packages
install_base() {
    pkg install nano \
        bash \
        bash-completion \
        tmux \
        irssi \
        lynx \
        wget \
        curl \
        vim-console \
        sudo \
        rsync \
        git \
        python3 \
        en-freebsd-doc \
        devcpu-data \
        ripgrep \
        powerdxx
}

# update intel cpu microcode
setup_microcode() {
    cat <<EOF >>/boot/loader.conf
cpu_microcode_load="YES"
cpu_microcode_name="/boot/firmware/intel-ucode.bin"
EOF
}

# setup power management
setup_power_mgmt() {
    sysrc powerdxx_enable="YES"
    sysrc powerdxx_flags="-n adaptive -a hiadaptive -b adaptive -m 800 -M 1600"
}

# allow users in the operator group to mount usb drives
# setup automounting
setup_user_mount() {
    cat <<EOF >>/etc/devfs.rules
[localrules=5]
add path 'da*' mode 0660 group operator
EOF
    sysrc devfs_system_ruleset="localrules"
    sysrc vfs.usermount=1
    sed -i '' -e  "/media/s/^#//g" /etc/auto_master
    # NOTE: no edits to /etc/devd.conf are required in fbsd13
    sysrc autofs_enable="YES"
}

# disable the console bell and increase the font
setup_console_misc() {
    sysrc allscreens_kbdflags="-b quiet.off"
    allscreens_flags="-f terminus-b32"
    cat <<EOF >>/boot/loader.conf
acpi_ibm_load="YES"
coretemp_load="YES"
kern.vt.fb.default_mode="1280x800"
EOF
}

# main
cat << EOF
setup-base.sh

this script will do the following on a fresh freebsd 13 install:

    - update the operating system
    - setup package management
    - enable the pf firewall
    - install useful packages
    - update intel CPU microcode
    - setup power managment
    - allow operators to automatically mount usb devices

EOF

read -p "do you wish to continue? (y/n): " REPLY
if [ "$REPLY" != "y" ]; then
    echo "exiting..."
    exit 1
fi

echo "updating the operating system..."
update_os
echo "setting up pkg..."
setup_pkg
echo "enabling the pf firewall..."
enable_pf
echo "installing base packages..."
install_base
echo "updating intel CPU microcode..."
setup_microcode
echo "setting up powerdxx..."
setup_power_mgmt
echo "setting up user automount..."
setup_user_mount
echo "setting up console..."
setup_console_misc

# complete setup
echo "setup is complete, reboot your system to activate the changes."
