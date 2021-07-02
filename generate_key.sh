#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# ./setup.sh
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
num="64" # Key Lengh!
lines="1"
final_num=""
echo "Linux Bash File & Messenger App (c) J~Net 2021"
echo ""
echo ""
read -p "Enter Desired Lengh [$num]: " input
#
if [ -z "$input" ]
then
    final_num=$num
    echo "You Selected $final_num"
else
    final_num=$input
    echo "You Selected $final_num"
fi

#
echo "Generate Secure Key"
echo ""
echo "Generating Strong final_num Character Key"
echo ""
for ((n=0;n<$lines;n++))
do 
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-$final_num
done
#
echo ""
bash menu.sh
