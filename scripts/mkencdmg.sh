#!/usr/bin/env bash
# mkprivdmg.sh
# makes an encrypted, password-protected dmg file from a folder.
# create a random folder:
# mkdir "$HOME/projects/$(openssl rand -hex 8)"

printf "%s\n" "Type the name of the directory to convert and press [ENTER] "
read -rp "dirname: " p_dir

hdiutil create "$p_dir.dmg" \
    -volname "$p_dir" \
    -srcfolder "$p_dir" \
    -encryption AES-256 \
    -stdinpass \
    -fs APFS

cat << EOF
all done!
your encrypted image file is "$p_dir.dmg".
EOF
