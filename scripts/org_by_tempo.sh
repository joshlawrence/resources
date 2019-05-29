#!/usr/bin/env bash
#
# given a group of wav files in a directory, search for a specific string in each filename.
# create a directory named with that string, then move the files into that directory.

# ask for the string
printf "%s\n" "Enter a tempo and press [ENTER] "
read -ep "tempo: " my_tempo

# create a directory for the files matching that tempo
my_dir="${my_tempo}bpm"
mkdir "$my_dir" || { echo "Directory $my_dir already exists, aborting." >&2; exit 1; }

# move the matching files into the directory
find . -type f -name "*${my_tempo}.wav" ! -path "./${my_dir}/*" -exec mv {} "${my_dir}/" \;