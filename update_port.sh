#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#

if [ -s config/port.txt ];
then
    default_port=`cat config/port.txt`
else
    default_port="776"
fi
#

echo "Update Port"
echo ""
echo "Currently $default_port delete $default_port then put in Port, Press Enter."

if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter Port " -i "$default_port" port
else
    ip=$1
fi
#
echo "Happy With $port?"
read -r -p "[y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "$port" > config/port.txt
    cat config/port.txt
else
    echo "Ok Then..."
fi

bash menu.sh
