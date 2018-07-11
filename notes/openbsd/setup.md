# openbsd setup notes

## partitioning

read about partitioning here:

* <http://www.openbsd.org/faq/faq4.html#Partitioning>
* <https://man.openbsd.org/disklabel#AUTOMATIC_DISK_ALLOCATION>

the one-big-partition approach:

* <https://azcrumpty.weebly.com/journal/easy-openbsd-partition-scheme>

swap should be 2x the amount of RAM.  `/usr/local` should have it's own partition.  `/var` and `/tmp` should probably be broken out but can be all under root until it's known how much will actually be used.

notes from the mailinglist:

> Make sure you have ~ 5GB for /usr/src/ and /usr/obj

> I have had to increase the size of /usr to 6G and /usr/local to 20G to build all the packages

also:

https://marc.info/?l=openbsd-misc&m=149890809430366&w=2

## setup

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
permit setenv { -ENV PS1=$DOAS_PS1 SSH_AUTH_SOCK } :wheel
permit nopass :wheel as root cmd /usr/bin/pkill args dhclient
permit nopass :wheel as root cmd /sbin/ifconfig
permit nopass :wheel as root cmd /sbin/dhclient
```

copy `wiconn.sh` to `~/bin` and make it executable.

## packages

_install wget to fetch the list_

https://fastly.cdn.openbsd.org/pub/OpenBSD/6.3/packages/amd64/index.txt

list can be trimmed with:

`awk '{print $10}' index.txt > pkgs.txt`

other packages to install:

* colorls
* vim
* git
* lynx
* i3
* feh
* rxvt-unicode

## misc

- in i3, change your terminal to sakura with the `-l` option
- install bash, change shell with `chsh -s /usr/local/bin/bash`
- shutdown with `doas shutdown -p now`
- package readmes are located in: `/usr/local/share/doc/pkg-readmes`
- examples in: `/usr/local/share/examples`
- templates in: `/usr/share/misc`

# resources

- <http://sohcahtoa.org.uk/openbsd.html>
- information on `W^X`: <https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html>
