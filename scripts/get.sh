#!/usr/bin/env bash
#
# a script to download audio from youtube using yt-dlp
# https://github.com/yt-dlp/yt-dlp

# check for yt-dlp
command -v yt-dlp >/dev/null 2>&1 || { echo "This script requires yt-dlp." >&2; exit 1; }

# prompt the user for the url
printf "%s\n" "Enter the url and press [ENTER] "
read -ep "url: " url

# prompt the user for the output file
printf "%s\n" "Enter a title for your audio file and press [ENTER] "
read -ep "title: " title

yt-dlp -f 'ba' -x --audio-format mp3 "$url" -o "$title.%(ext)s"
