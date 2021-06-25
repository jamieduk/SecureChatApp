#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# ./setup.sh
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Update Remote Host IP"
echo "Default is localhost delete localhost then put in IP, press enter."
defaultip=`cat config/remote_host.txt`
if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter Remote IP " -i "$defaultip" ip
else
    ip=$1
fi
#
echo "$ip" > config/remote_host.txt
echo "New Remote IP Set To "
cat config/remote_host.txt
echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh
