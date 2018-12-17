#!/usr/bin/env bash
#
# Create the ctf and store in directory target/. Echo out the filename of the
# ctf.
#
target=${1:-target}

filename="$( echo -n $( basename "$PWD" ) | md5sum | cut -d' ' -f 1 )"

zip "$target/$filename" "flag.png";
mv "$target/$filename.zip" "$target/$filename"

echo $filename
