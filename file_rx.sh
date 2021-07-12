#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
port=777
clear
echo "J~Net File Reciever Port $port"
#echo "Enter Secure Password"
#read password
echo -en "\e[92mPlease Wait \c"
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
bash view_file.sh
bash menu.sh
