#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# ./setup.sh
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
defaultip=`cat config/remote_host.txt`
echo "Update Remote Host IP (Appends to the list) Used For Multiple Hosts!"
echo "Currently $defaultip delete $defaultip then put in IP, Press Enter."

if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter Remote IP " -i "$defaultip" ip
else
    ip=$1
fi
#

echo "Happy With $ip?"
read -r -p "[y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "$ip" >> config/remote_host.txt
    echo "Add New Remote Remote IP"
    cat config/remote_host.txt
else
    echo "Ok Then..."
fi

bash menu.sh
