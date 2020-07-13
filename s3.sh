#! /bin/bash
pw=`pwd`

if [[ ! -f "$pw/usrn" ]]
then
	us="$USER"
	echo $USER > "usrn"

	crontab -l > mycron
	echo "* * * * * $pw/s3.sh < $pw/usrn" >> mycron
	crontab mycron
	rm mycron
else
	read us
	rm Desktop/res
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
	else 
		cnt="file"
		echo "$i  $cnt" >> res1
		continue
	fi
	echo "$i  $cnt" >> res2
done

sort res1 >> Desktop/res
sort -nk2 res2 >> Desktop/res
rm res2
rm res1
