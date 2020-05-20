START=1
END=201
EXT=".in"
OUTEXT=".out"
DIR="./"
OUTDIR="output/"
FILE="input"
OUTFILE="output"
for i in $(seq $START 1 $END)
do
	INPUT = $DIR$FILE$i$EXT
	OUTPUT = $OUTDIR$OUTFILE$i$OUTEXT
	if test -f $INPUT;then
		echo "Using $INPUT"
		~/cp2k-7.1-Linux-x86_64.ssmp -i $INPUT -o $OUTPUT
	else
		echo "$INPUT doesn't exists"
	fi
done
