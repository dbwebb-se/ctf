#!/usr/bin/env bats
#
# Tests for creating the ctf and verify towards target/
#
load test_helper

@test "solve the ctf" {
    run bash script/solve.bash
    (( $status == 0 ))
    [[ "$output" =~ dbwebb-CTF ]]
    [[ "$output" =~ ^dbwebb-CTF\{.+\}$ ]]
    [[ "$output" = $( cat flag.txt ) ]]
}
