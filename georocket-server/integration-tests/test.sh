#!/bin/bash

set -e

# all possible options of test-one.sh
declare -a array_test_commands
array_test_commands[0]=standalone
array_test_commands[1]=h2
array_test_commands[2]=mongo
array_test_commands[3]=s3
array_test_commands[4]=hdfs

# pids of lunched backgroundprocess
declare -a pids

# pids index 
index=0

# run processes and store pids in array
for i in $array_test_commands; do
    ./test-one.sh [${i}] &
    pids[${i}]=$!
    let "a += 1"
done

# wait for all pids
for pid in ${pids[*]}; do
    wait $pid
done
