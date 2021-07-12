#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
host_ip=`cat config/remote_host.txt`
port=`cat config/port.txt`
while true;
do
#
    echo -en "\e[92m "
    clear
    echo "Previous Message: "
    echo ""
    cat config/rmsg.txt
    echo ""
    echo "Waiting For New Message"
    sudo nc -l -w 1 -p $port > config/rmsg.txt
#echo "All Done!"
#echo -en"\e[94m \c"
    clear
# bash synth.sh
    cat config/rmsg.txt
    cat config/rmsg.txt >> config/all_messages.txt
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
