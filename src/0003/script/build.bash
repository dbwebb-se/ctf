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
cd src || exit
install -d "movies/"
install -d "movies/Action"
install -d "movies/Action/Die Hard"
install -d "movies/Action/Die Hard/Die Hard 1"
install -d "movies/Action/Die Hard/Die Hard 2"
install -d "movies/Action/Die Hard/Die Hard 3"
install -d "movies/Action/Die Hard/Die Hard 4"
install -d "movies/Action/Kung Fury"
install -d "movies/Drama/A Star is born"
install -d "movies/Drama/Bohemian Rhapsody"
install -d "movies/Disney/Cinderella"
install -d "movies/Disney/Robin Hood"
install -d "movies/Disney/Pinoccio"
install -d "movies/Action/Die Hard/Die Hard 3/its-getting-warmer"

touch "movies/Action/Die Hard/i-am-a-file"
touch "movies/Action/Kung Fury/i-am-not-the-file.txt"
touch "movies/Drama/Bohemian Rhapsody/another-one-bites-the-dust"
touch "movies/Disney/Cinderella/hihi-wrong-file.txt"
touch "movies/Disney/Pinoccio/its-a-lie"
touch "movies/Disney/Robin Hood/hahaha-treasures-wonderful-treasures"

finaltarget="movies/Action/Die Hard/Die Hard 3/its-getting-warmer"
cp "../flag.txt" "$finaltarget/"
zip -r -q -T "../$target/$filename" "movies";
cd ..

mv "$target/$filename.zip" "$target/$filename"
# rm -r "$target/movies";

# Echo out the target filename
echo $filename
