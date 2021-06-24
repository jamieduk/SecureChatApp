#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "This will Attempt To Repair A Corrupted Message Using A Correct Key"
echo ""
echo "Enter Key"
read key
cat decrypted.txt | openssl enc -d -des3 -base64 -pass pass:$key -pbkdf2 > repaired.txt
cat repaired.txt
echo "Enter To Go Back To Menu"
read Y
