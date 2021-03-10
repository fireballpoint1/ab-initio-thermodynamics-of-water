START=1
END=1590
EXT=".in"
OUTEXT=".out"
DIR="input_training_correct_cell/"
OUTDIR="output_training_correct_cell/"
FILE="input"
OUTFILE="output"
for i in $(seq $START 4 $END)
do
	INPUT=$DIR$FILE$i$EXT
	OUTPUT=$OUTDIR$OUTFILE$i$OUTEXT
        echo "INPUT and OUTPUT File $INPUT $OUTPUT"
	if test -f $INPUT;then
		echo "Using $INPUT $OUTPUT"
		~/cp2k-7.1-Linux-x86_64.ssmp -i $INPUT -o $OUTPUT
	else
		echo "$INPUT doesn't exists"
	fi
done
