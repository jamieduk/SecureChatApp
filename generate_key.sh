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
    final_num="$num"
    echo "You Selected $final_num"
else
    final_num="$input"
    echo "You Selected $final_num"
fi
#
# check if final_num number higher than 
#
echo "Generate Secure Key"
echo ""

echo "Generating Strong $final_num Character Key" #  $num_lengh
echo ""
#echo "$final_num"|tr -d '\n' | wc -c"$final_num"
echo ""
#echo "$multi Test"
for ((n=0;n<$lines;n++))
do 
    dd if=/dev/urandom count=10 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-1000 > output1.txt
    dd if=/dev/urandom count=10 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output2.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output3.txt
    dd if=/dev/urandom count=20 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output4.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output5.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output6.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output7.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output8.txt
    dd if=/dev/urandom count=10 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output9.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output10.txt
    dd if=/dev/urandom count=20 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output11.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output12.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output13.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output14.txt
    dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output15.txt
    cat output1.txt > final.txt
    cat output2.txt >> final.txt
    cat output3.txt >> final.txt
    cat output4.txt >> final.txt
    cat output5.txt >> final.txt
    cat output6.txt >> final.txt
    cat output7.txt >> final.txt
    cat output8.txt >> final.txt
    cat output9.txt >> final.txt
    cat output10.txt >> final.txt
    cat output11.txt >> final.txt
    cat output12.txt >> final.txt
    cat output13.txt >> final.txt
    cat output14.txt >> final.txt
    cat output15.txt >> final.txt
    cat output3.txt >> final.txt
    cat output10.txt >> final.txt
    cat output14.txt >> final.txt
    cat output1.txt >> final.txt
    cat output2.txt >> final.txt
    cat output3.txt >> final.txt
    cat output4.txt >> final.txt
    cat output5.txt >> final.txt
    cat output6.txt >> final.txt
    cat output7.txt >> final.txt
    cat output8.txt >> final.txt
    cat output9.txt >> final.txt
    cat output10.txt >> final.txt
    cat output11.txt >> final.txt
    cat output12.txt >> final.txt
    cat output13.txt >> final.txt
    cat output14.txt >> final.txt
    cat output15.txt >> final.txt
    cat output3.txt >> final.txt
    cat output10.txt >> final.txt
    cat output14.txt >> final.txt
    cat output1.txt >> final.txt
    clear

# Read in only x amount of chars from a text file into a bash var
echo "Your Strong Key Is"
echo ""
output=$(head -c $final_num final.txt)
echo "$output"
echo ""



done
#
echo ""
bash menu.sh
