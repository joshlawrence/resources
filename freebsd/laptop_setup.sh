#!/bin/sh
# laptop_setup.sh
# an attempt at scripting my freebsd setup, inspiration taken from:
# https://github.com/nicholasbernstein/install-fbsd-desktop/blob/main/installx.sh

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
block in all
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

setup_pwr_mgmt() {
    sysrc powerd_enable=YES
    sysrc powerd_flags="-a hiadaptive -b adaptive"
    sysrc kld_list+="coretemp"
}

setup_wifi() {
    sysrc wlans_iwn0=wlan0
    sysrc ifconfig_wlan0="WPA SYNCDHCP"
    create_args_wlan0="country US regdomain FCC"
}

setup_misc() {
    sysrc kld_list+="acpi_ibm"
    sysrc kld_list+="mmc"
    sysrc kld_list+="mmcsd"
    sysrc kld_list+="sdhci"
    sysrc allscreens_kbdflags="-b quiet.off"
}

# setup_drm_kmod() {
#     # drm-kmod pkg is currently broken
#     # install drm-fbsd12 and drm-kmod from ports
#     # sysrc kld_list+="i915kms"
# }

# setup_xorg() {
#     pkg install -y xorg xfce firefox
#     sysrc dbus_enable=YES
# }

# main
grep -q "kern.vty" /boot/loader.conf || echo "kern.vty=vt" >> /boot/loader.conf

update_os
setup_pkg

# install packages
pkg install -y nano \
    bash bash-completion \
    tmux \
    irssi \
    lynx \
    wget \
    curl \
    vim-console \
    sudo \
    rsync \
    git \
    python3

enable_pf
setup_pwr_mgmt
setup_wifi
setup_misc

# setup default login class
cat <<EOF >/etc/login.conf
default:\
	:passwd_format=sha512:\
	:copyright=/etc/COPYRIGHT:\
	:welcome=/etc/motd:\
	:setenv=MAIL=/var/mail/$,BLOCKSIZE=K:\
	:path=/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin ~/bin:\
	:nologin=/var/run/nologin:\
	:cputime=unlimited:\
	:datasize=unlimited:\
	:stacksize=unlimited:\
	:memorylocked=64K:\
	:memoryuse=unlimited:\
	:filesize=unlimited:\
	:coredumpsize=unlimited:\
	:openfiles=unlimited:\
	:maxproc=unlimited:\
	:sbsize=unlimited:\
	:vmemoryuse=unlimited:\
	:swapuse=unlimited:\
	:pseudoterminals=unlimited:\
	:priority=0:\
	:ignoretime@:\
	:umask=022:\
	:charset=UTF-8:\
	:lang=en_US.UTF-8:

standard:\
	:tc=default:
xuser:\
	:tc=default:
staff:\
	:tc=default:
daemon:\
	:memorylocked=128M:\
	:tc=default:
news:\
	:tc=default:
dialer:\
	:tc=default:

root:\
	:ignorenologin:\
	:memorylocked=unlimited:\
	:tc=default:

EOF
cap_mkdb /etc/login.conf

# EOF
