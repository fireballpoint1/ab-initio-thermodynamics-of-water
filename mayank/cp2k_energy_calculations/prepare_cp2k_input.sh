#!/bin/bash

NUM=1
DYNAMICCELLSIZE=0
INPFILE="../out7.1.xyz"
COORDS="cat $INPFILE"

while [[ $# -gt 0 ]];do
	case $1 in
	-i|--input) INPFILE="$2"; shift ;;
	-n|--number) NUM="$2"; echo "caught num" ; shift ;;
	-d|--dynamic-cell) DYNAMICCELLSIZE=1 ;;
	*) echo "using static box size for all configs on $INPFILE starting with $NUM";exit 1;;
esac
shift
done

echo "removing the first 2 lines of the file"
#tail -n +3 $INPFILE > tmp.in
CELL=$(head -2 $INPFILE | tail -1 | awk -F "=" '{print $6}' | sed 's/\"//g' | sed 's/\Properties//g')
CELLA=$(echo $CELL | awk '{print $1,$2,$3}')
CELLB=$(echo $CELL | awk '{print $4,$5,$6}')
CELLC=$(echo $CELL | awk '{print $7,$8,$9}')
tail -n +3 $INPFILE | awk '{print $1, $2,$3,$4}' > tmp.in
EXTF=.in
FILE="input_training_correct_cell/input$NUM$EXTF"
BCKF=mbck.$FILE
if test -f "$FILE";then
        echo "INFO: $FILE already exists, backing up as $BCKF"
        mv $FILE $BCKF
fi
if [[ $DYNAMICCELLSIZE -eq 0 ]];then
	awk '/{coordinates}/{system("cat tmp.in");next}1' input_wireframe.in > $FILE
else
	awk '/{coordinates}/{system("cat tmp.in");next}1' input_wireframe_dynamic_cell.in | sed "s/{cella}/${CELLA}/g" | sed "s/{cellb}/${CELLB}/g" | sed "s/{cellc}/${CELLC}/g"  > $FILE
fi

if test -f "$FILE";then
        echo "INFO: Created CP2K input file $FILE" 
fi
if test -f "tmp.in";then
        rm tmp.in
        echo "INFO: Removed tmp.in" 
fi

