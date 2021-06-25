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
7za e file.7z #-P$password #  -e
echo "Files Downloaded: "
echo ""
ls
cd ..
bash menu.sh
