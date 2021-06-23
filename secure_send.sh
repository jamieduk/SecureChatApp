#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Enter Key"
read -s key
host_ip=`cat remote_host.txt`
while true;
do
#
myvar="$@"
if [ -z "$*" ]; then 
    echo "Enter Text To Send: "
    read myvar; 
fi
#sudo ballbags
#
echo "$USER: $myvar" > msg.txt
Edata=$(cat msg.txt | openssl enc -e -des3 -base64 -pass pass:$key -pbkdf2)
#echo $Edata > msg.txt
#myvar=`cat msg.txt`
#zip -8 -r -q $myvar uploads/file.zip
#echo "Binary Server AKA SENDER"
echo -en "\e[92mPress Ctrl + C To Stop Sending New Secure Message! $myvar \c"
#sleep 0.2
echo $Edata | nc $host_ip 776 & sleep 1 ; kill $!
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
