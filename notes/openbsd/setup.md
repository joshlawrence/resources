# openbsd setup notes

- download the 6.1 installer:
  https://fastly.cdn.openbsd.org/pub/OpenBSD/6.1/amd64/
  _Note: to use this URL as `/etc/installurl`, use http only_

## setup
- installer: if the installer hangs, use ctrl-c to cancel. `install` is a shell script and can be restarted from the shell.
- check `/etc/installurl` to make sure the path for packages is correct.
- run `syspatch` to update the system
- copy `/etc/examples/doas.conf` to `/etc`.  `groups $user` to make sure your user is in the wheel group (user created at setup is put in wheel group by default).

- package readmes are located in: `/usr/local/share/doc/pkg-readmes`

package index:

https://ftp.openbsd.org/pub/OpenBSD/6.1/packages/amd64/index.txt

(must install wget to download the file)

## apmd

enable apmd:

```
rcctl enable apmd
rcctl set apmd flags -A
rcctl start apmd
```

see the openbsd [FAQ on System Administration](https://www.openbsd.org/faq/faq10.html) for more info.

## pkg notes

python:

```
If you want to use this package as your default system python, as root
create symbolic links like so (overwriting any previous default):
 ln -sf /usr/local/bin/python2.7 /usr/local/bin/python
 ln -sf /usr/local/bin/python2.7-2to3 /usr/local/bin/2to3
 ln -sf /usr/local/bin/python2.7-config /usr/local/bin/python-config
 ln -sf /usr/local/bin/pydoc2.7  /usr/local/bin/pydoc
```

_TODO: setting up virtualenv_

remember: D-Bus is called messagebus in openbsd. so:

```
pkg_add dbus
rcctl enable messagebus
rcctl start messagebus
```

## misc

- shutdown with `doas shutdown -p now`

# resources

http://sohcahtoa.org.uk/openbsd.html
