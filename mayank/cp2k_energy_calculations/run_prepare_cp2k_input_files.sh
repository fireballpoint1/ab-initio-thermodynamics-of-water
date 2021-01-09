#!/bin/bash
NUM=1 
for filename in ../data/coordinates_training/*.xyz; do
    #sh prepare_cp2k_input.sh $filename $NUM
    bash prepare_cp2k_input.sh -i $filename -n $NUM -d
    # echo "$filename $NUM"
    NUM=$((NUM+1))
done
