#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
port=776
echo "Enter Key"
read -s key
host_ip=`cat config/remote_host.txt`
sound=`cat config/sound.txt`
function Atone(){
aplay $1
#echo -e "\07"
}

while true;
do
    echo -en "\e[92m "
    #clear
    echo "Previous Message: "
    echo ""
    cat decrypted.txt
    echo "Waiting For New Message"
    echo ""
    sudo nc -l -w 550 -p $port > config/rmsg.txt &&
    cat config/rmsg.txt | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > config/decrypted.txt
    cat config/decrypted.txt
    sleep 0.006
    cat config/decrypted.txt
    cat config/decrypted.txt >> config/all_messages.txt
    Atone $sound
    echo -en "\e[70m \c"
    sleep 5
done
exit

