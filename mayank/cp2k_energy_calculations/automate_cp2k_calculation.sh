START=1
END=201
EXT=".in"
DIR="."
FILE="input"
for i in $(seq $START 1 $END)
do
	INPUT = $DIR$FILE$i$EXT
	if test -f $INPUT;then
		echo "Using $INPUT"
		~/cp2k-7.1-Linux-x86_64.ssmp $INPUT
	else
		echo "$INPUT doesn't exists"
	fi
done
