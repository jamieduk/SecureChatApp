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
cd $pwd/update
echo "Current Folder Is "
pwd
git clone https://github.com/$account/$product.git
cd $pwd/update/$product/
echo "Current Folder Is "
pwd
sudo mv --force config old
sudo mv --force old 2>/dev/null
sudo mv --force -u * $pwd
src="$pwd/update/$product/*"
dest="$pwd"
sudo tar -cvzpf update.tar.gz $src
sudo tar -xvzpf update.tar.gz $dest
sudo rm -f update.tar.gz
cd $pwd
echo "Current Folder Is "
pwd
sudo rm -rf update
sudo rm -rf old
sudo chmod +x *.sh
sudo chown -r $USER config/*
echo "Update Complete!"
echo ""
echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh
