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
#
if test -z "$key" 
then
      key_icon="🔓 No Key"
else
      key_icon="🔒 Locked!"
fi
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
local_ip="config/ip.txt"
if [ ! -f "$local_ip" ];
then
    echo "Please Confirm Local IP"
    read local_ip
    echo "$local_ip" > config/ip.txt
fi

localip=`cat config/ip.txt`
#/bin/bash -i >& /dev/tcp/$localip/$port 0>&1
#
#sudo nc -l -p $lport > config/rmsg.txt #&& cat config/rmsg.txt
#while ! echo exit | sudo nc -l -p $port > config/rmsg.txt 13; do sleep 10; done
valuec=`cat config/rmsg.txt`
#decode:
echo "$valuec" | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > cmd.txt
cat cmd.txt
IN=`cat cmd.txt`
delim=":"
arrIN=(${IN//$delim/ })
cmd_out=${arrIN[0]}
cmd_out_req=${arrIN[2]}
#cmd_out_req=${arrIN[2]}
echo "Reqesting Admin $cmd_out"
echo "Requested Command $cmd_out_req"
admin_file="config/admins.txt"
if test -f "$admin_file";
then
    echo "$admin_file exists."
    
    if grep -q $cmd_out "$admin_file"; # Where cmd_out is admin alias name!
    then
        #  Some Actions # $string was found
        echo "Admin Authenticated"
        # Running Command Code Goes Here!
        output=$($cmd_out_req)
        echo $output > remote/output.txt
        cat remote/output.txt
    else
        echo "Not A Valid Admin"
fi

else 
    touch config/admins.txt
        
fi



}
while true;
do
    echo -en "\e[92m "
    echo "$key_icon"
    echo ""
    echo "Previous Message: "
    echo ""
    cat config/decrypted.txt
    echo "Waiting For New Message"
    echo ""
    sudo nc -l -w 550 -p 776 > config/rmsg.txt &&
    cat config/rmsg.txt | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > config/decrypted.txt
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
        if [[ $data = *#Date* ]];
        then
          echo "Admin Command Recieved"
          echo $data
          # Function Test!
          showdate "$key"
        elif [[ $data = *#Cmd* ]];
        then
            echo "Admin Command Recieved"
            echo $data
            cmmd
        elif [[ $data = *#Alert* ]];
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
