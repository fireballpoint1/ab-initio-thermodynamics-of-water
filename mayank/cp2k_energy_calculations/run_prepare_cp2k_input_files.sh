#!/bin/bash
NUM=1 
for filename in ../coordinates-out7/*.xyz; do
    sh prepare_cp2k_input.sh $filename $NUM
    # echo "$filename $NUM"
    NUM=$((NUM+1))
done