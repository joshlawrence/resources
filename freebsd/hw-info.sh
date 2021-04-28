#!/usr/bin/env bash

dmesg > x201/dmesg.out.txt
pciconf -lv > x201/pciconf.out.txt
devinfo -v > x201/devinfo.out.txt
acpidump -dt > x201/acpidump.out.txt
