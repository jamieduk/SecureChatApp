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
echo "Linux Bash Key Generator App (c) J~Net 2021"
echo ""
echo "This Can Go Up To 2256 key Lengh!"
echo "However Some Programs Have Limits"
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
    echo ""
fi
#
if [ "$final_num" -gt "2224" ]; 
then
    echo ""
    echo "2224 Is The Max Lengh So Selecting That"
    echo ""
    final_num="2224"
fi

# check if final_num number higher than 
#
echo "Generate Secure Key"
echo ""

echo "Generating Strong $final_num Character Key" #  $num_lengh
echo ""
#echo "$final_num"|tr -d '\n' | wc -c"$final_num"
echo ""
#   tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo ''
for ((n=0;n<$lines;n++))
do 
    dd if=/dev/urandom count=10 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-1000 > output1.txt
    dd if=/dev/urandom count=10 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output2.txt
    dd if=/dev/urandom count=10 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-"$final_num" > output3.txt
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
    specail=$(tr -dc '#$%&*+-:=?@[\]_~' </dev/urandom | head -c 5  ; echo)
   echo $specail > outputlast.txt # A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~
    #tr -dc A-Za-z0-9 </dev/urandom 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-2 > outputlast.txt
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
    cat outputlast.txt >> final.txt
    echo -n "${chars:RANDOM%${#chars}:1}" >> final.txt
    tac final.txt > order.txt
    cat order.txt > final.txt
    tr --delete '\n' < final.txt
    # Using sed to remove new line cahrs
    tr -d "\n" < final.txt > final2.txt
    clear

# Read in only x amount of chars from a text file into a bash var
echo "Your $final_num Strong Key Is"
echo ""
output=$(head -c $final_num final2.txt) # head
echo "$output"
echo ""
echo "Press Enter To Back To menu"
rm output1.txt output2.txt output3.txt output4.txt output5.txt output6.txt output7.txt output8.txt
rm output9.txt output10.txt output11.txt output12.txt output13.txt output14.txt final.txt outputlast.txt order.txt final2.txt
read Y

done
#
echo ""
bash menu.sh
