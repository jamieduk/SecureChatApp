#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
#
myvar="$@"
host_ip=`cat server.txt`
#
clear
echo "Binary Server AKA SENDER"
# sudo nc localhost 777
clear
echo "Enter Secure Password"
read password
echo -en "\e[92mPlease Wait \c"
#sudo cat uploads/file.zip | nc -w 1 $host_ip 777
#sudo cp $myvar uploads/
# gzip -8 -c $myvar > uploads/file.gz
#sudo zip -8 file.zip $myvar -P $password # -p $password
# https://sevenzip.osdn.jp/chm/cmdline/switches/method.htm
7za a file.7z "$myvar" -p"$password" #x=7 # a 
sudo mv file.7z uploads/file.7z
#sudo mv file.zip uploads/file.zip
#$myvar
sudo dd if=uploads/file.7z bs=32M |nc $host_ip 777
#sudo nc -v -w 2 777 < uploads/file.gz
count=0
total=34
pstr="[=======================================================================]"
while [ $count -lt $total ]; do
  sleep 0.06 # this is work
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done
#sleep 1
#echo $myvar | nc -w 1 $host_ip 777
echo "File Sent!"
bash menu.sh
