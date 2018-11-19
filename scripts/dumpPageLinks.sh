#!/bin/bash
#
# dumps all links on a single page

# check for lynx
command -v lynx >/dev/null 2>&1 || { echo "This script requires lynx." >&2; }

printf "%s\n" "Enter the url and press [ENTER] "
read -ep "url: " url

printf "%s\n" "Enter the textfile name and press [ENTER] "
read -ep "filename: " f_name

lynxopts=( -dump -listonly -nonumbers -notitle )
lynx "${lynxopts[@]}" "$url" > "$f_name.txt"
