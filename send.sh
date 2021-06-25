#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
host_ip=`cat config/remote_host.txt`
while true;
do
#
myvar="$@"
if [ -z "$*" ]; then 
    echo "Enter Text To Send: "
    read myvar; 
fi
#
sudo ballbags
#
echo $myvar > config/msg.txt
#zip -8 -r -q $myvar uploads/file.zip
clear
echo "Binary Server AKA SENDER"
clear
echo -en "\e[92mPress Ctrl + C To Confirm Sending New Secure Message! $myvar \c"
sleep 0.2
cat config/msg.txt | nc $host_ip 776
count=0
total=34
pstr="[=======================================================================]"

while [ $count -lt $total ]; do
  sleep 0.006 # this is work
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done
echo "Message Sent!, Please Wait 5 Seconds..."

sleep 5
#exit
# sh send.sh
done
trap "sh send.sh; exit;" SIGINT SIGTERM;
sh send.sh
