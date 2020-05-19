#!/bin/bash
NUM=1 
for filename in ../coordinates-out7/*.xyz; do
    sh automate_cp2k_calculation.sh $filename $NUM
    # echo "$filename $NUM"
    NUM=$((NUM+1))
done