#!/usr/bin/env bash
#
# Solve the dbwebb ctf and echo out the flag.
#
targetFile="25bbdcd06c32d477f7fa1c3e4a91b032"

# Create the working directory and download the target file
root="$( pwd )"
workDir="$root/build/solve"
rm -rf "$workDir"
install -d "$workDir"
cd "$workDir" || exit
cp "$root/target/$targetFile" "$targetFile"

# Get the flag from the target
cat "$targetFile"

# Verify it matches the content of flag.txt
diff "$root/flag.txt" "$targetFile"
