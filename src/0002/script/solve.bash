#!/usr/bin/env bash
#
# Solve the dbwebb ctf and echo out the flag.
#
targetFile="fcd04e26e900e94b9ed6dd604fed2b64"

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
cat flag.txt

# Verify the flag matches the content of flag.txt
diff "$root/flag.txt" flag.txt
