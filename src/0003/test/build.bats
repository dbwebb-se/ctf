#!/usr/bin/env bats
#
# Tests for creating the ctf and verify towards target/
#
#load test_helper

@test "create and validate the ctf" {
    run install -d build/bats
    run bash script/create.bash build/bats
    (( $status == 0 ))
    [[ "$output" = $( ls build/bats ) ]]
    [[ "$output" = $( ls target ) ]]

    run diff build/bats/${lines[0]} target/${lines[0]}
    (( $status == 0 ))
}
