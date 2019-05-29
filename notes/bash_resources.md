# -- bash resources -- #

## opendirs

    wget -e robots=off -r -nc -nH --cut-dirs=3 -np "URL"

## encoding/converting/misc

replace all spaces with underscores:

    find . -type f -name "*.wav" -exec rename 's/ /_/g' {} \;

replace all instances of "_-_" with a single dash:

    find . -type f -name "*.wav" -exec rename 's/_-_/_/g' {} \;

upper to lower:

    for i in *.wav; do mv "$i" "$(echo "$i" | tr '[A-Z]' '[a-z]')"; done

```bash
#!/bin/bash
for file in *.flv; do
	i=$(basename "$file" .flv)
	ffmpeg -i "$file" -c:a libvorbis -q:a 6 "$i.ogg"
done

#!/bin/bash
for i in *.ogg; do 
    mv "$i" "$(echo ${i%.ogg} | tr [:lower:] [:upper:]).ogg"; 
done

#!/bin/bash
for i in *.m4a; do
    ffmpeg -i "$i" -c:a libvorbis -qscale:a 5 "$i.ogg"
done
```

## creating temp directories and files

    MY_TMPFILE=$(mktemp "${TMPDIR:-/tmp/}$(basename $0).XXXXXXXXXX")
    trap 'rm -f $MY_TMPFILE' EXIT
    # or
    MY_TMPDIR=$(mktemp -d "${TMPDIR:-/tmp/}$(basename $0).XXXXXXXXXX")
    trap 'rm -rf $MY_TMPDIR' EXIT

## youtube-dl options (+mpv)

youtube-dl already selects the BEST format, pass -F to see other formats.

youtube-dl [-a FILE] --restrict-filenames [--prefer-free-formats] URL

	...where FILE is a list of urls.

to extract audio only:

    youtube-dl -x --audio-format mp3|vorbis|wav URL

handy stuff here: https://wiki.archlinux.org/index.php/mpv

    function yta() {
        mpv --ytdl-format=bestaudio ytdl://ytsearch:"$@"
    }

## renaming

see the [greycat wiki page](https://mywiki.wooledge.org/BashFAQ/073) on parameter expansion.

for all markdown files, change the extension to txt:

```bash
for i in *.md; do
  mv "$i" "${i%.md}.txt
done
```

find and rename files recursively:

```bash
find . -type f -name '*.foo' -print0 | while IFS= read -r -d '' f; do
  mv -- "$f" "${f%.foo}.bar"
done
```

for all zip files, create a directory based on file name, extract the contents to the directory:

```bash
for i in *.zip; do
  dir=${i%%.*} # create a dir based on the filename with no dot or extension
  mkdir "$dir"
  unzip "$i" -d "$dir"
done
```

find all zip files, create a directory based on file name, extract the contents to the directory:

```bash
for i in *.zip; do
    dir=${i%%.*}
    mkdir "$dir"
    unzip "$i" -d "$dir"
done
```

using perl rename:

    rename 's/\.txt$/\.md/' *.txt

## fun with find

```bash
find . -type f \( -name '03*' -a ! -name '*MED*' -a ! -name '*SOFT*' \) ! -path './kit1/*' -exec cp {} kit1 \;

find . -type f \( ! -name '*MED*' -a ! -name '*SOFT*' \) ! -path './kit1/*' -exec cp {} kit1 \;

find . -type f -name '*ROOM*' -print0 | while IFS= read -r -d '' i; do afplay "$i"; done
```

`-a` means and and `-o` means or.

## logging

```bash
my_script > log 2>&1

my_script 2>&1 | tee log.txt

my_script 2>&1 | tee -a log.txt
```