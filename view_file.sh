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
# 7z a secure.7z * -p"pa$$word @|"
# 7z a archive_name target -pPUT_PASSWORD_HERE
#gunzip -k file.gz
# 7za a pw.7z *.txt -pSECRET
echo "Files Downloaded: "
echo ""
ls
#echo "Type ./menu.sh For Menu"
# https://stackoverflow.com/questions/28160254/7-zip-command-to-create-and-extract-a-password-protected-zip-file-on-windows
cd ..
bash menu.sh
# https://stackoverflow.com/questions/21620406/how-do-i-pause-my-shell-script-for-a-second-before-continuing
#
# https://www.dotnetperls.com/7-zip-examples
