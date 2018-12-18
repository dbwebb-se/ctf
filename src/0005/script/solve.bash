#!/usr/bin/env bash
#
# Solve the dbwebb ctf and echo out the flag.
#
targetFile="d39934ce111a864abf40391f3da9cdf5"

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

flag=$( cat flag.txt | rot13 )

# Verify the flag matches the content of flag.txt
diff "$root/flag.txt" <( echo $flag )

# Echo out the flag
echo $flag
