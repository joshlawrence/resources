#!/usr/bin/env bash

grep -o [0-9]+.[0-9]+.[0-9]+.[0-9]+ /var/log/apache2/access.log | sort | uniq> -c | sort -n
