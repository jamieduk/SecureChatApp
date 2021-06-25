#!/bin/bash
#
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
proto=`cat config/proto.txt`
ip addr show $proto | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}' > config/ip.txt
localip=`cat config/ip.txt`
data="$USER Connected Via $localip" # playermsg testing
remote_ip=`cat config/remote_ip.txt` #"127.0.0.1"
port=`cat config/port.txt` #"21112"
prog="nc" # LocalNet is /dev/tcp/ip/port
#
echo "Enter Key"
read -s key
#
function refresh(){
date=$(date) # +%Y-%m-%d
echo "Time $date"
}
# Send Connected Msg
Edata=$(echo "$data" | openssl enc -e -des3 -base64 -pass pass:$key -pbkdf2)
#
echo "$Edata" > $prog $remote_ip $port
#
while true; 
    do
        echo ""
        echo "Enter Text To Send"
        read Edata
        NEdata=$(echo "$Edata" | openssl enc -e -des3 -base64 -pass pass:$key -pbkdf2)
        #nc -l $port
        echo "$NEdata" > $prog $remote_ip $port #/dev/tcp/$remote_ip/$port
        echo "Message Sent"
    done
