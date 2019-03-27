#!/bin/bash
#
# mvlu: Move Verbose Lowercase Underscore 
# Rename files to lowercase, replacing spaces with 
# underscores, and deleting quotes and control 
# characters.

for fullpath in "${@}"; do
local path="$(dirname "${fullpath}")"
local file="$(basename "${fullpath}")"
mv --verbose -- \
    "${path}"/"${file}" \
    "${path}"/"$(echo "${file}" \
    | tr '[:upper:]' '[:lower:]' \
    | tr '[:blank:]' '_' \
    | tr -d '[:cntrl:]' \
    | tr -d \'\" \
    | tr -d '()<>'
    )"
done