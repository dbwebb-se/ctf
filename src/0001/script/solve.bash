#!/usr/bin/env bash
#
# Solve the dbwebb ctf and echo out the flag.
#

# Get the flag from the target
flag="$( cat $( find target -mindepth 1 ) )"
echo "$flag"

# Verify it matches the content of flag.txt
diff flag.txt <(echo $flag)
