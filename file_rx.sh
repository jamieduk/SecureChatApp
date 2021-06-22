#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
#
port="777"
clear
echo "Binary Client Reciever"
#echo "Enter Secure Password"
#read password
echo -en "\e[92mPlease Wait \c"
#sudo nc -l -w 1 -p 777 | gzip -dfc|tar -xvf -
#sudo nc -vv -w 1 -l 777 > downloads/file.gz
#sudo nc -l -p 777 > downloads/file.zip
#sudo nc -v -w 2 $host_ip -l -p $port > downloads/file.gz
sudo nc -v -w 2 $host_ip -l -p $port > downloads/file.7z
count=0
total=34
pstr="[=======================================================================]"

while [ $count -lt $total ]; do
  sleep 0.06 # this is work
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done

echo "All Done!"
#file output
#cat output
bash view_file.sh
bash menu.sh
