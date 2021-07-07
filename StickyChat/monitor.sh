#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
#see https://stackoverflow.com/questions/29728151/how-to-listen-for-multiple-tcp-connection-using-nc
#
#
defaultport=1337

if [ -z "$1" ];
then
# read -p "Enter Port To Monitor [$default_port]: " port
    port=$defaultport
    echo ""
else 
    port=$1
fi
echo -en "\e[92mWelcome To J~Net Port Monitor"

# output after you start listening to same port.
watch -n1 "sudo netstat -anp | grep $port" # >> log.txt && cat log.txt
bash menu.sh
