#!/bin/sh
# laptop_setup.sh
# an attempt at scripting my freebsd setup, inspiration taken from:
# https://github.com/nicholasbernstein/install-fbsd-desktop/blob/main/installx.sh
# ...and here:
# https://gist.github.com/JeremyMorgan/cb5d6fc5ffd14c9fde5b38646ff67496

update_os() {
    freebsd-update fetch
    freebsd-update install
}

setup_pkg() {
    pkg bootstrap
    mkdir -p /usr/local/etc/pkg/repos
    cp /etc/pkg/FreeBSD.conf /usr/local/etc/pkg/repos/
    sed -i '' 's/quarterly/latest/' /usr/local/etc/pkg/repos/FreeBSD.conf
    pkg update -f
    pkg upgrade
}

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

# there's no point in doing this if you're installing powerdxx
# setup_pwr_mgmt() {
#     sysrc powerd_enable=YES
#     sysrc powerd_flags="-a hiadaptive -b adaptive"
# }

setup_wifi() {
    sysrc wlans_iwn0=wlan0
    sysrc ifconfig_wlan0="WPA DHCP"
    create_args_wlan0="country US regdomain FCC"
}

setup_usb() {
    cat <<EOF >/etc/devfs.rules
[localrules=5]
add path 'da*' mode 0660 group operator
EOF
    sysrc devfs_system_ruleset="localrules"
    echo "vfs.usermount=1" >> /etc/sysctl.conf
    sysrc autofs_enable=YES
    # edit /etc/auto_master
}

setup_misc() {
    sysrc allscreens_kbdflags="-b quiet.off"
    echo "kern.evdev.rcpt_mask=6" >> /etc/sysctl.conf
    sysrc ntpd_enable=YES
}

setup_loader() {
    cat <<EOF >/boot/loader.conf
acpi_ibm_load="YES"
coretemp_load="YES"
EOF
}

install_pkgs() {
    pkg install -y nano \
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
        powerdxx \
        rtv
}

# setup_drm_kmod() {
#     # drm-kmod pkg is currently broken
#     # install graphics/drm-fbsd12 and graphics/drm-kmod from ports
#     # sysrc kld_list="/boot/modules/i915kms.ko"
# }

setup_xorg() {
    pkg install -y xorg \
        firefox \
        vscode \
        google-fonts \
        sddm
    sysrc dbus_enable=YES
    sysrc hald_enable=YES
    sysrc sddm_enable=YES
    echo "DONT FORGET ABOUT /proc IN FSTAB!"
}

# main
update_os
setup_pkg
enable_pf
#setup_pwr_mgmt
#setup_wifi
#setup_usb
setup_misc
setup_loader
install_pkgs

# setup default login class
# in /etc/login.conf
# default:\
# ...
#     :umask=022:\
#     :charset=UTF-8:\
#     :lang=en_US.UTF-8:

# then run: cap_mkdb /etc/login.conf

# EOF
