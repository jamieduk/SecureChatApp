#!/bin/bash
# Linux Bash File & Messenger App (c) J~Net 2021
# jnet.sytes.net
#
# ./setup.sh
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Linux Bash File & Messenger App (c) J~Net 2021"
echo ""
echo "Setting File Permissions..."
sudo chown $USER *.*
#
defaultip=`cat remote_host.txt` # can be changed to localhost if you want that as your default remote ip!
#
echo "Update Remote Host IP"
echo "Default is localhost delete localhost then put in IP, press enter."
if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter Remote IP " -i "$defaultip" ip
else
    ip=$1
fi
#
echo "$ip" > remote_host.txt
echo "New Remote IP Set To "
cat remote_host.txt

echo "Setting up 7-Zip"
sudo add-apt-repository universe
sudo apt update -y

sudo apt install -y p7zip-full p7zip-rar aplay figlet openssl

echo "Choose Wav File For Alert Tone!"
#
default_sound="notification.wav" # /usr/share/sounds/linuxmint-login.wav
read -p "Enter Sound File [$default_sound]: " sound
echo $sound > sound.txt
echo "Setup Complete, Returning to menu..."


bash menu.sh
