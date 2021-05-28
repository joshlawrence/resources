#!/usr/bin/env bash
#
# deb-laptop-setup.sh
# setup script for debian 10

setup_apt() {
    cat <<EOF >/etc/apt/sources.list
deb http://mirrors.linode.com/debian buster main contrib non-free
deb http://security.debian.org/debian-security buster/updates main contrib non-free
deb http://mirrors.linode.com/debian buster-updates main contrib non-free
#deb http://mirrors.linode.com/debian buster-backports main
EOF
    apt-get update
    apt-get -y install \
        firmware-linux \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        exfat-fuse \
        exfat-utils \
        git \
        irssi \
        lsb-release \
        moreutils \
        ncdu \
        pigz \
        pwgen \
        python3 \
        rsync \
        software-properties-common \
        sudo \
        tmux \
        tree \
        ufw \
        vim \
        virtualenv \
        zip 
}

setup_kernel() {
    wget -qO - https://liquorix.net/liquorix-keyring.gpg | apt-key add -
    cat <<EOF >/etc/apt/sources.list.d/liquorix.list
deb http://liquorix.net/debian buster main
deb-src http://liquorix.net/debian buster main
EOF
    apt-get update
    apt-get -y install \
        linux-image-liquorix-amd64 \
        linux-headers-liquorix-amd64
}

setup_xorg() {
    apt-get update
    apt-get -y install \
        xorg \
        kde-standard \
        kde-config-sddm \
        fonts-ibm-plex \
        xfonts-terminus \
        chromium
}

setup_misc() {
    ufw logging off
    ufw enable
}

setup_audio() {
    apt-get update
    apt-get -y install \
        jackd \
        qjackctl \
        audacity \
        ffmpeg
}

# main
cat << EOF
deb-laptop-setup.sh

this script will setup a laptop with a fresh install of debian 10.

EOF

# give the user a chance to bail out
read -p "do you wish to continue? (y/n): " MY_REPLY
if [ "$MY_REPLY" != "y" ]; then
    echo "exiting..."
    exit 1
fi

setup_apt
setup_kernel
setup_xorg
setup_misc
setup_audio
