#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Enter Key"
read -s key
lport=777
host_ip=`cat config/remote_host.txt`
sound=`cat config/sound.txt`
function Atone(){
aplay $1
#echo -e "\07"
}

function showdate(){
date=$(date) # +%Y-%m-%d
data="Date Is: $date"
#output=${data} | openssl enc -d -des3 -base64 -pass pass:$1 -pbkdf2
echo $data
}
function cmmd(){
localip=`cat config/ip.txt`
#/bin/bash -i >& /dev/tcp/$localip/$port 0>&1
#
sudo nc -l -p $lport > config/rmsg.txt
cat config/rmsg.txt
valuec=`cat config/rmsg.txt`
#decode:
echo "${$valuec}" | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2
#echo $valuec
}
while true;
do
    echo -en "\e[92m "
    #clear
    echo "Previous Message: "
    echo ""
    cat config/decrypted.txt
    echo "Waiting For New Message"
    echo ""
    sudo nc -l -w 550 -p 776 > config/rmsg.txt &&
    cat rmsg.txt | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > config/decrypted.txt
    cat config/decrypted.txt
    sleep 0.006 # this is work
#echo "All Done!"
#echo -en"\e[94m \c"
   # #clear
# bash synth.sh
   # cat decrypted.txt
    cat config/decrypted.txt >> config/all_messages.txt
    Atone $sound
    data=`cat config/decrypted.txt`
        if [[ $data =~ ^#date.*  ]];
        then
          echo "Admin Command Recieved"
          echo $data
          # Function Test!
          showdate "$key"
        elif [[ $data =~ ^#cmd.*  ]];
        then
            echo "Admin Command Recieved"
            echo $data
            cmmd
        elif [[ $data =~ ^#alert.*  ]];
        then
            echo "Admin Command Recieved"
            echo $data
            Atone $sound
        else
          echo $data
        fi
    echo -en "\e[70m \c"
    sleep 5
#bash recieve.sh
done
exit
#bash recieve.sh
#
