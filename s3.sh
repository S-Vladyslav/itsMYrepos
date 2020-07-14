#! /bin/bash
pw=`pwd`

if [[ ! -f "$pw/usrn" ]]		#adding a cron plan
then
	us="$USER"			#first run the program
	echo $USER > "usrn"

	crontab -l > mycron
	echo "* * * * * $pw/s3.sh < $pw/usrn" >> mycron
	crontab mycron
	rm mycron
else
	read us
fi

cnt=0

for i in `ls /home/$us`
do
	cnt=0
	if [[ ! -f $i ]]			#check directory or file
	then
		for j in `ls /home/$us/$i`	#directory
		do
			cnt=$(($cnt + 1))
		done
	else 
		cnt="file"			#file
		echo "$i  $cnt" >> res1
		continue
	fi
	echo "$i  $cnt" >> res2
done

sort res1 > res		#data sorting
sort -nk2 res2 >> res
rm res2
rm res1
