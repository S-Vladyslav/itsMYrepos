#! /bin/bash
pw=`pwd`

if [[ ! -f "$pw/usrn" ]]
then
	us="$USER"
	echo $USER > "usrn"

	crontab -l > mycron
	echo "* * * * * /home/toor/Desktop/s3.sh < /home/toor/Desktop/usrn
" >> mycron
	crontab mycron
	rm mycron
else
	read us
fi

cnt=0
for i in `ls /home/$us`
do
	cnt=0
	if [[ ! -f $i ]]
	then
		for j in `ls /home/$us/$i`
		do
			cnt=$(($cnt + 1))
		done
	else cnt=""
	fi
	echo "$i  $cnt" >> res
done

sort -nk2 res > Desktop/res1
rm res
