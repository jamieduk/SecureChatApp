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
if test -z "$key" 
then
      key_icon="🔓 No Key"
else
      key_icon="🔒 Locked!"
fi
host_ip=`cat config/remote_host.txt`
sound=`cat config/sound.txt`
function Atone(){
aplay -q $1
#echo -e "\07"
}
sudo touch config/rmsg.txt
sudo chown $USER config/rmsg.txt
while true;
do
    echo -en "\e[92m "
    echo "$key_icon"
    #clear
    echo "Previous Message: "
    echo ""
    cat config/decrypted.txt
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

