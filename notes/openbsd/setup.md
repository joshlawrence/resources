# openbsd setup notes

`Updated: 2017-10-25 for OpenBSD 6.2`

## partitioning

read about partitioning here:

* <http://www.openbsd.org/faq/faq4.html#Partitioning>
* <https://man.openbsd.org/disklabel#AUTOMATIC_DISK_ALLOCATION>

swap should be 2x the amount of RAM.  `/usr/local` should have it's own partition.  `/var` and `/tmp` should probably be broken out but can be all under root until it's known how much will actually be used.

- copy `/etc/default/doas.conf` to `/etc/doas.conf`
- choose <https://fastly.cdn.openbsd.org/pub/OpenBSD/>) for your mirror, it will be automatically added to `/etc/installurl`.
- make sure to run `syspatch`

## services

apmd:

```
rcctl enable apmd
rcctl set apmd flags -A
rcctl start apmd
```

dbus:

```
pkg_add dbus
rcctl enable messagebus
rcctl start messagebus
```

manage wifi with wiconn:

<https://github.com/n0xa/wiconn>

_note: make the following changes to `doas.conf`:_

```
permit nopass :wheel as root cmd /usr/bin/pkill args dhclient
permit nopass :wheel as root cmd /sbin/ifconfig
permit nopass :wheel as root cmd /sbin/dhclient
```

copy `wiconn.sh` to `~/bin` and make it executable.

## packages

_install wget to fetch the list_

<https://fastly.cdn.openbsd.org/pub/OpenBSD/6.2/packages/amd64/index.txt>

list can be trimmed with:

`awk '{print $10}' index.txt > pkgs.txt`

_TODO: setting up virtualenv_

other packages to install:

* colorls
* htop
* emacs
* vim
* git
* lynx
* i3
* feh
* sakura
* qutebrowser

## misc

- in i3, change your terminal to sakura with the `-l` option
- in `~/.profile`:
    
    alias ls="colorls -1G"
    PS1="\h \w \$ "

- add `PS1` to the list of exported variables
- shutdown with `doas shutdown -p now`
- package readmes are located in: `/usr/local/share/doc/pkg-readmes`

# resources

- <http://sohcahtoa.org.uk/openbsd.html>
- information on `W^X`: <https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html>

