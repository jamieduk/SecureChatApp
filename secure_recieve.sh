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
sound=`cat sound.txt`
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
    sudo nc -l -w 550 -p 776 > rmsg.txt &&
    cat rmsg.txt | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > decrypted.txt
    cat decrypted.txt
    sleep 0.006 # this is work
#echo "All Done!"
#echo -en"\e[94m \c"
   # #clear
# bash synth.sh
    cat decrypted.txt
    cat decrypted.txt >> all_messages.txt
    Atone $sound
    echo -en "\e[70m \c"
    sleep 5
#bash recieve.sh
done
exit
#bash recieve.sh
#
