#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# ./setup.sh
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Update Alias"
echo "Default is $USER."
default_alias="$USER"
if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter A New Alias " -i "$default_alias" uralias
else
    uralias=$1
fi
#
dig @resolver4.opendns.com myip.opendns.com +short > config/ip.txt
local_ip=`cat config/ip.txt`
echo "$uralias" > config/alias.txt
echo "New Alias Set To "
cat config/alias.txt
echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh
