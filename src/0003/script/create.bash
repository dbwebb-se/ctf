#!/usr/bin/env bash
#
# Create the ctf and store in directory target/. Echo out the filename of the
# ctf.
#
target=${1:-target}

filename="$( echo -n $( basename "$PWD" ) | md5sum | cut -d' ' -f 1 )"

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

finaltarget="$target/movies/Action/Die Hard/Die Hard 3"

cp flag.txt "$finaltarget/"

zip -r "$target/$filename" "$target/movies/";
rm -r "$target/movies";

echo $filename
