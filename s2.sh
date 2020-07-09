#! /bin/bash

read str

for i in $str
do
	if [[ -f "$i" ]]
	then
		echo `ls -l $i`
	else 
		continue
	fi
done
