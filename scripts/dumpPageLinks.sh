#!/bin/bash
#
# dumps all links on a single page

printf "%s\n" "Enter the url and press [ENTER] "
read -ep "url: " url

lynxopts=( -dump -listonly -nonumbers -notitle )
lynx "${lynxopts[@]}" "$url" > linklist.txt
