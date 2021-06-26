#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# ./setup.sh
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
account="jamieduk"
product="SecureChatApp"
pwd=`pwd`
echo "Update J~NET Multi Tool 2021"
sudo mkdir update
sudo chown -R $USER update
cd update
git clone https://github.com/$account/$product.git
cd SecureChatApp
sudo mv --force config old
sudo mv --force old 2>/dev/null
sudo mv --force -u * $pwd
cd $pwd
sudo mv --force update 2>/dev/null
sudo rm -rf update
echo "Update Complete!"
echo ""
echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh
