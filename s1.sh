#! /bin/bash

echo "enter a single file name"
read file

if [[ -n "$file" && "$file" != *" "* ]]
then
	if [[ -f "$file" ]]
	then
		`chmod +x $file`
	else
		echo `less $file`
	fi
else
	echo "the name should be simple!"
fi

