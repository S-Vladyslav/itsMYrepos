#!/bin/bash

cd ~

if [[ ! -f "backup" ]]
then
	tar -cf backup .config
else
	tar -cf b1 .config

	sb=`tar -tf backup`
	sb1=`tar -tf b1`

	if [ "$sb" != "$sb1" ]
	then
		rm -R .config
		mkdir .config

		tar -xf backup
	fi

	rm b1
fi
