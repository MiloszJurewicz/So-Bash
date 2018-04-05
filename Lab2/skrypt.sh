#!/bin/bash 

DIR1=$1
DIR2=$2

if [[ -d "$DIR1" ]]; then
	echo "Directory exists, OK!"
	cd "$DIR1"
else
	echo "No such directory! FAIL!"
fi

for FILE in `ls`; do
#	cd "$DIR1"
	if [[ -d "$FILE" ]]; then
		echo "$FILE"
		echo "This is a directory!"
	fi
	if [[ -f "$FILE" ]]; then
		echo "$FILE"
		echo "This is a regular file!"
	fi
	if [[ -L "$FILE" ]]; then
		echo "$FILE"
		echo "This is a symbolic link!"
	fi
	
#	cd "$DIR2"
	ln -s "$(cd "$DIR1" && pwd)/"$FILE"" "$(cd "$DIR2" && pwd)/"$FILE"_ln"
#	mv "${FILE}_ln" "$DIR2"
done
