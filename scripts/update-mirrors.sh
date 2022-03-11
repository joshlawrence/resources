#!/usr/bin/env bash

#G_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
G_DIR="/srv/git"

for f in "$G_DIR"/*; do
	if [[ -d "$f" ]]; then
		cd "$f" || { echo "could not descend into repo directory!" >&2; exit 1; }
		git remote update --prune
	fi
done

