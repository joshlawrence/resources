# openbsd setup notes

these are the bare minimum steps to get an openbsd laptop up-and-running.  updated for v6.5.

resources:

- https://sohcahtoa.org.uk/openbsd.html
- https://www.c0ffee.net/blog/openbsd-on-a-laptop/
- https://www.tumfatig.net/20190311/openbsd-laptop-with-full-disk-encryption/

## partitioning

just use the default partitioning scheme.

## setup

- copy `/etc/default/doas.conf` to `/etc/doas.conf`, edit to contain the following:

    permit persist keepenv :wheel

- make sure to run `syspatch`

## packages

download a list of all packages:

    curl https://cdn.openbsd.org/pub/OpenBSD/6.5/packages/amd64/index.txt | awk '{print $10}' > pkgs.txt

- vim
- git
- wget
- bash
- irssi
- i3
- feh
- rxvt-unicode
- dbus
- colorls
- lynx
- firefox
- geany
- ibm-plex
- fira-fonts
- consolekit2 (add this before `exec i3` in `.xsession`

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

## misc

NOTE: you cannot run `startx` in a terminal to run xorg, you must start it from xenodm:

```
rcctl enable xenodm
```

startup file is `.xsession`.

- networking: https://www.openbsd.org/faq/faq6.html
- install bash, change shell with `chsh -s /usr/local/bin/bash`
- add `source ~/.bashrc` to `~/.profile`
- get rid of the console in xenodm by removing the xconsole line from `/etc/X11/xenodm/Xsetup_0`
- shutdown with `doas shutdown -p now`, reboot with `doas shutdown -r now`
- package readmes are located in: `/usr/local/share/doc/pkg-readmes`
- examples in: `/usr/local/share/examples`
- templates in: `/usr/share/misc`
