#!/usr/bin/env bash
#
# Create the ctf and store in directory target/. Echo out the filename of the
# ctf.
#

# Argument 1 can contain the target path, used by bats
target=${1:-target}

# Create the filename
filename="$( echo -n $( basename "$PWD" ) | md5sum | cut -d' ' -f 1 )"

# Create the target

install -d "$target/movies/"
install -d "$target/movies/Action"
install -d "$target/movies/Action/Die Hard"
install -d "$target/movies/Action/Die Hard/Die Hard 1"
install -d "$target/movies/Action/Die Hard/Die Hard 2"
install -d "$target/movies/Action/Die Hard/Die Hard 3"
install -d "$target/movies/Action/Die Hard/Die Hard 4"
install -d "$target/movies/Action/Kung Fury"
install -d "$target/movies/Drama/A Star is born"
install -d "$target/movies/Drama/Bohemian Rhapsody"
install -d "$target/movies/Disney/Cinderella"
install -d "$target/movies/Disney/Robin Hood"
install -d "$target/movies/Disney/Pinoccio"
install -d "$target/movies/Action/Die Hard/Die Hard 3/its-getting-warmer"

touch "$target/movies/Action/Die Hard/i-am-a-file"
touch "$target/movies/Action/Kung Fury/i-am-not-the-file.txt"
touch "$target/movies/Drama/Bohemian Rhapsody/another-one-bites-the-dust"
touch "$target/movies/Disney/Cinderella/hihi-wrong-file.txt"
touch "$target/movies/Disney/Pinoccio/its-a-lie"
touch "$target/movies/Disney/Robin Hood/hahaha-treasures-wonderful-treasures"

finaltarget="$target/movies/Action/Die Hard/Die Hard 3/its-getting-warmer"

cp flag.txt "$finaltarget/"

zip -r -q -T "$target/$filename" "$target/movies/";
mv "$target/$filename.zip" "$target/$filename"
rm -r "$target/movies";

# Echo out the target filename
echo $filename
