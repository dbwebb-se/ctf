#!/usr/bin/env bash
#
# Solve the dbwebb ctf and echo out the flag.
#
targetFile="7cd86ecb09aa48c6e620b340f6a74592"
endpoint="target/movies/Action/Die Hard/Die Hard 3/its-getting-warmer/flag.txt"

# Create the working directory and download the target file
root="$( pwd )"
workDir="$root/build/solve"
rm -rf "$workDir"
install -d "$workDir"
cd "$workDir" || exit
cp "$root/target/$targetFile" "$targetFile"

# Get the flag from the target
mv "$targetFile" file.zip
unzip -oq file.zip

# Verify the flag matches the content of flag.txt
diff "$root/flag.txt" "$endpoint"

# Echo out the flag
cat "$endpoint"
