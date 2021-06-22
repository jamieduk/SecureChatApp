#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
#
echo "Enter Key"
read -s key
host_ip=`cat server.txt`
while true;
do
#
    echo -en "\e[92m "
    clear
    echo "Previous Message: "
    echo ""
    cat decrypted.txt
#decode:
    echo ""
    echo "Waiting For New Message"
    sudo nc -l -w 1 -p 776 > rmsg.txt &&
    #decode:
    cat rmsg.txt | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > decrypted.txt
    cat decrypted.txt
    sleep 0.006 # this is work
#echo "All Done!"
#echo -en"\e[94m \c"
    clear
# bash synth.sh
    cat decrypted.txt
    cat decrypted.txt >> all_messages.txt
    echo -en "\e[70m \c"
#echo "Continue [ENTER]:"
#read input123
# notify-more -t 10000 -i /usr/share/icons/gnome/32x32/actions/insert-object.png "Process Finished" "$message"
#mplayer sound.wav -b
    sleep 5
#bash recieve.sh
done
exit
#bash recieve.sh
#
