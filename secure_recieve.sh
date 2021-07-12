#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
lport=777

if [ ! -f server.pem ]
then
    echo "This will now attempt to help you create a key file, fill out the following!..."
    openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout server.pem -out server.crt
fi
SSL_crt="server.crt"
SSL_pem="server.pem"
host_ip=`cat config/remote_host.txt`
port=`cat config/port.txt`
echo "Welcome To Recieve A Message"
echo "You will need port $port open in your firewall and router port fowarding rules setup!"
echo ""
echo "If asked about an admin alias, create one and dont share it with anyone else for security"
echo "Unless you TRUST them!"
echo ""
echo ""
echo "Enter Key"
read -s key
#
if test -z "$key" 
then
      key_icon="🔓 No Key"
else
      key_icon="🔒 Locked!"
fi
sound=`cat config/sound.txt`
function Atone(){
aplay -q $1
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
        #output=$($cmd_out_req)
        #echo $output > remote/output.txt
        #cat remote/output.txt
    else
        echo "Not A Valid Admin"
fi

else 
    # Setting up Admins
    echo "Setting Up Your Admin Account Name"
    echo "What Alias you want to accept admin commands from remotely? (Leave blank for none!)"
    read admin
    echo "$admin" > config/admins.txt
    echo "OK Admin Added to admins file found in config/admins.txt"
        
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
    sudo ncat -l -w 550ms -v -p $port --ssl-key $SSL_pem --ssl-cert $SSL_crt > config/rmsg.txt &&
    cat config/rmsg.txt | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > config/decrypted.txt
    cat config/decrypted.txt
    sleep 0.006

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
    #echo -en "\e[70m \c"
    sleep 5
#bash recieve.sh
done
exit
#bash recieve.sh
#
