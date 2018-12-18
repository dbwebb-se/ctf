#!/usr/bin/env bats
#
# Tests for building the ctf and verify towards target/
#
#load test_helper

@test "build and validate the ctf" {
    run install -d build/bats
    run bash script/build.bash build/bats
    (( $status == 0 ))
    [[ "$output" = $( ls build/bats ) ]]
    [[ "$output" = $( ls target ) ]]

    # Binary zip files differ
    #run diff build/bats/${lines[0]} target/${lines[0]}
    #(( $status == 0 ))
}
