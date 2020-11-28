#!/usr/bin/env bash

sysrc pf_enable=YES
sysrc pf_flags=""
sysrc pf_rules="/etc/pf.conf"
sysrc pflog_enable=YES
sysrc pflog_logfile="/var/log/pf.log"
sysrc pflog_flags=""
