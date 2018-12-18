#!/usr/bin/env bash
#
# Create the ctf and store in directory target/. Echo out the filename of the
# ctf. Do not output anything else.
#

# Argument 1 can contain the target path, used by bats
target=${1:-target}

# Create the filename
filename="$( echo -n $( basename "$PWD" ) | md5sum | cut -d' ' -f 1 )"

# Create the target
zip -o -q -T "$target/$filename" flag.txt
mv -f "$target/$filename.zip" "$target/$filename"

# Echo out the target filename
echo $filename
