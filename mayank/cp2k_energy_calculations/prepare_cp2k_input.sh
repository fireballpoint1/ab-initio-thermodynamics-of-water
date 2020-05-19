#!/bin/bash

NUM=1
INPFILE="../out7.1.xyz"
COORDS="cat $INPFILE"
echo $COORDS

if [ $# -lt 2 ];then
        echo "INFO: Not enough arguments: coordinates file name, serial number for output file needed."
else
        INPFILE=$1
        NUM=$2
        echo "INFO: Input file: $INPFILE, Output serial number: $NUM"
fi

echo "removing the first 2 lines of the file"
tail -n +3 $INPFILE > tmp.in 

EXTF=.in
FILE="input$NUM$EXTF"
BCKF=mbck.$FILE
if test -f "$FILE";then
        echo "INFO: $FILE already exists, backing up as $BCKF"
        mv $FILE $BCKF
fi
awk '/{coordinates}/{system("cat tmp.in");next}1' input_wireframe.in > $FILE
if test -f "$FILE";then
        echo "INFO: Created CP2K input file $FILE" 
fi
if test -f "tmp.in";then
        rm tmp.in
        echo "INFO: Removed tmp.in" 
fi

