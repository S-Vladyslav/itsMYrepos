#! /bin/bash
pw=`pwd`
echo "$pw/s3.sh"
#59 23 * * 5 $pw/s3.sh

crontab -l > foocron
echo "59 23 * * 5 rm -rf $pw/s3.sh" >> foocron
crontab foocron
rm foocron

cnt=0
for i in `ls /home/$USER`
do
	cnt=0
	if [[ ! -f $i ]]
	then
		for j in `ls /home/$USER/$i`
		do
			cnt=$(($cnt + 1))
		done
	else cnt=""
	fi
	echo "$i  $cnt" >> res
done

sort -k2 res > res1
rm res
