#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# ./setup.sh
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
pwd=`pwd`
echo "Update J~NET Multi Tool 2021"
sudo mkdir update
sudo chown -R $USER update
cd update
git clone https://github.com/jamieduk/SecureChatApp.git
sudo mv -f ./*. $pwd
