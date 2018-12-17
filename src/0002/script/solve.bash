#!/usr/bin/env bash
#
# Solve the dbwebb ctf and echo out the flag.
#

# Get the flag from the target
install -d build/solve
cd build/solve || exit

cp "$( find ../../target -mindepth 1 )" file.zip
unzip file.zip
cat flag.txt

# Verify it matches the content of flag.txt
diff flag.txt ../../flag.txt
