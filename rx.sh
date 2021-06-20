#!/bin/bash
# Netcat Bash Loop Line Code
port=`cat port.txt` #21112
sound=`cat sound.txt`

echo "Enter Key"
read -s key

echo "Listening For Data..."
echo ""

function Atone(){
aplay $1
echo -e "\07"
}

function showdate(){
date=$(date) # +%Y-%m-%d
data="Date Is: $date"
output=${data} | openssl enc -d -des3 -base64 -pass pass:$1 -pbkdf2
echo $output
}
function cmmd(){
localip=`cat ip.txt`
#/bin/bash -i >& /dev/tcp/$localip/$port 0>&1
#
sudo nc -l -p $port > rmsg.txt
cat rmsg.txt
valuec=`cat rmsg.txt`
#decode:
echo "${$valuec}" | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2
#echo $valuec
}
#sh
while true; 
    do 
        #nc -l $port
        echo ""
        data=$(nc -l -v -q 2 -p $port);
echo "${data}" | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > output.txt
data=`cat output.txt`

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
# < /[host/sender_file_path]/[filename.extention];
        echo ""
    done
