#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Enter Key"
read -s key
host_ip=`cat config/remote_host.txt`
alias=`cat config/alias.txt`
if test -z "$key" 
then
      key_icon="🔓 No Key"
else
      key_icon="🔒 Locked!"
fi
echo "Remote Host IP $host_ip Or type #quit"
while true;
do
#
echo "$key_icon"
echo ""
input="$@"
if [ -z "$*" ];
then 
    echo "Enter Text To Send: Or type #quit"
    read input; 
fi
#
if [[ -z "$input" ]];
then
    echo "PLEASE NO EMPTY MESSAGES!"
    echo "Enter Text To Send: Or type #quit"
    read input; 
fi
#
if [[ -z "$input" ]];
then
    echo "NO EMPTY MESSAGES!"
    echo "Will Now Auto #quit"
    exit
fi
#
if [[ $input = *#quit* ]];
then 
    exit ;
fi
#
echo "$alias: $input" > config/msg.txt
Edata=$(cat config/msg.txt | openssl enc -e -des3 -base64 -pass pass:$key -pbkdf2)
echo -en "\e[92mPress Ctrl + C To Stop Sending New Secure Message! $input \c"
#sleep 0.2
echo $Edata | nc $host_ip 776 & sleep 1 ; kill $!
clear
count=0
total=34
pstr="[=======================================================================]"

while [ $count -lt $total ]; 
do
  sleep 0.006
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done
echo "Message Sent!, Please Wait 5 Seconds..."
#
sleep 5
clear
echo "Last Message Sent"
cat config/msg.txt
done

trap "sh send.sh; exit;" SIGINT SIGTERM;
sh send.sh

