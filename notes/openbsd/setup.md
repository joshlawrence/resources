# openbsd setup notes

- download the 6.1 installer:
  https://ftp5.usa.openbsd.org/pub/OpenBSD/6.1/amd64/

this can later be used for `/etc/installurl`.

## setup

- check `/etc/installurl` to make sure the path for packages is correct.
- run `syspatch` to update the system
- copy `/etc/examples/doas.conf` to `/etc`.  `groups $user` to make sure your user is in the wheel group (user created at setup is put in wheel group by default).

- package readmes are located in: `/usr/local/share/doc/pkg-readmes`

package index:

https://ftp5.usa.openbsd.org/pub/OpenBSD/6.1/packages/amd64/index.txt

(must install wget to download the file)

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

remember: D-Bus is called messagebus in openbsd. so:

```
pkg_add dbus
rcctl enable messagebus
rcctl start messagebus
```

## misc

- shutdown with `doas shutdown -p now`
