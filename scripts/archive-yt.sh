#!/bin/bash

# from here:
# https://www.archiveteam.org/index.php?title=YouTube

youtube-dl \
  --continue \
  --retries 4 \
  --write-info-json \
  --write-description \
  --write-thumbnail \
  --write-annotations \
  # --all-subs \ # this is for all subtitles
  --ignore-errors \
  -f bestvideo+bestaudio \
  # video, channel, playlist, etc.
  URL
