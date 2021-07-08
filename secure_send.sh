#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
RED="\e[31m"
GREEN="\e[92m"
YELLOW="\e[33m"
echo "Enter Key"
read -s key
#host_ip=`cat config/remote_host.txt`
readarray -t host_ip < config/remote_host.txt
dig @resolver4.opendns.com myip.opendns.com +short > config/ip.txt
local_ip=`cat config/ip.txt`
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
    echo -e "${GREEN}Enter Text To Send: Or type #quit"
    read input; 
fi
#
while ! [ "$input" ];
do
    echo -e "${RED}Warning!"
    echo -e "${YELLOW}PLEASE NO EMPTY MESSAGES!"
    echo ""
    echo "Enter Text To Send: Or type #quit"
    read input; 
done

#
echo -en "\e[92m"
if [[ $input = *#quit* ]];
then 
    exit ;
fi
#
echo "$alias@$local_ip: $input" > config/msg.txt
Edata=$(cat config/msg.txt | openssl enc -e -des3 -base64 -pass pass:$key -pbkdf2)
echo -en "\e[92mPress Ctrl + C To Stop Sending New Secure Message! $input \c"
#sleep 0.2
for i in "${host_ip[@]}"
do
   echo $Edata | nc $i 776 & sleep 1 ; kill $!
   # or do whatever with individual element of the ipaddray
done

# echo $Edata | nc $host_ip 776 & sleep 1 ; kill $!
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

trap "sh secure_send.sh; exit;" SIGINT SIGTERM;
sh send.sh

