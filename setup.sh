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
sudo chown $USER *.txt
sudo chmod +x *.sh
#
defaultip=`cat remote_host.txt` # can be changed to localhost if you want that as your default remote ip!
#
default_alias="$USER"
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
echo ""
echo "Now lets choose your username / alias"
read -e -p "Enter Alias " -i "$default_alias" uralias
echo $uralias > alias.txt
echo ""


FILE=/usr/bin/7z
if [ -f "$FILE" ]; then
    echo "$FILE Already Installed."
else 
    echo "$FILE Installing, Please Wait..."
    echo "Setting up 7-Zip"
    sudo add-apt-repository universe
    sudo apt update -y
    echo ""
    sudo apt install -y p7zip-full
    sudo apt install -y p7zip-rar
fi

sudo apt install -y aplay
sudo apt install -y figlet openssl
#clear
echo "Choose Wav File For Alert Tone! (Or leave as is)"
default_sound="notification.wav" # /usr/share/sounds/linuxmint-login.wav
read -p "Enter Sound File [$default_sound]: " sound
echo $sound > sound.txt
echo ""
sudo mkdir downloads
sudo mkdir uploads
sudo chown $USER *.*
echo "Setup Complete, Returning to menu..."
echo "Press Enter To Return To Menu"
read Y
bash menu.sh
