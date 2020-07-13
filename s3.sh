#! /bin/bash
pw=`pwd`
echo "$pw/s3.sh"

crontab -l > mycron
echo "21 18 * * 5 rm -rf $pw/s3.sh" >> mycron
crontab mycron
rm mycron

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
