#!/usr/bin/env bash
#
# Solve the dbwebb ctf and echo out the flag.
#
targetFile="95b09698fda1f64af16708ffb859eab9"

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

tesseract flag.png out >& /dev/null

flag=$( cat out.txt | caesar 15 | grep dbwebb-CTF )

# Verify the flag matches the content of flag.txt
diff "$root/flag.txt" <( echo $flag )

# Echo out the flag
echo $flag
