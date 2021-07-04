#!/bin/bash
# (c) J~NET 2021
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Welcome To Open Secure File"
#echo "Enter Secure Password"
#read password
cd downloads
#unzip file.zip #-e $password
file="file.7z"
if [[ -f $file ]]
then
    7za e $file && rm file.7z #-P$password #  -e
    #echo "<file> exists on your filesystem."
else
    echo "No New Downloads To Decrypt Yet"
fi
# Remove file.7z after extraction!
echo ""
echo "All Files Downloaded Will Be Listed: "
echo ""
ls
echo "Press Enter To Continue"
read Y

cd ..
bash menu.sh
