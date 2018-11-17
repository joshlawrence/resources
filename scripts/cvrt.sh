#!/bin/bash

# converts m4a file(s) to ogg

for i in *.m4a; do
    ffmpeg -i "$i" -c:a libvorbis -qscale:a 5 "$i.ogg"
done
