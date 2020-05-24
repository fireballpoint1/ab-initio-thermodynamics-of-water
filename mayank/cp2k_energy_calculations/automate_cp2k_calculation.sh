START=1
END=201
EXT=".in"
OUTEXT=".out"
DIR="input_training/"
OUTDIR="output_training/"
FILE="input"
OUTFILE="output"
for i in $(seq $START 1 $END)
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
