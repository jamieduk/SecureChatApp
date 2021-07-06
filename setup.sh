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
#
sudo touch config/remote_host.txt
sudo touch config/alias.txt
sudo touch config/all_messages.txt
sudo touch config/decrypted.txt
sudo touch config/rmsg.txt
sudo touch config/sound.txt
sudo touch config/decrypted.txt
sudo touch config/msg.txt
sudo chown $USER config/decrypted.txt
sudo chown $USER config/all_messages.txt
sudo chown $USER config/msg.txt
#
defaultip=`cat config/remote_host.txt` # can be changed to localhost if you want that as your default remote ip!
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
sudo chown $USER config/remote_host.txt
echo "$ip" > config/remote_host.txt
echo "New Remote IP Set To "
cat config/remote_host.txt
echo ""
echo "Now lets choose your username / alias"
read -e -p "Enter Alias " -i "$default_alias" uralias
sudo chown $USER config/alias.txt
echo $uralias > config/alias.txt
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

FILE=/usr/bin/dig
if [ -f "$FILE" ]; then
    echo "$FILE Already Installed."
else 
    echo "$FILE Installing, Please Wait..."
    echo "Setting up Dig"
    echo ""
    sudo apt install -y dig
fi

FILE=/usr/bin/aplay
if [ -f "$FILE" ]; then
    echo "$FILE Already Installed."
else 
    echo "$FILE Installing, Please Wait..."
    sudo apt install -y aplay
fi

FILE=/usr/bin/figlet
if [ -f "$FILE" ]; then
    echo "$FILE Already Installed."
else 
    echo "$FILE Installing, Please Wait..."
    sudo apt install -y figlet
fi

FILE=/usr/bin/openssl
if [ -f "$FILE" ]; then
    echo "$FILE Already Installed."
else 
    echo "$FILE Installing, Please Wait..."
    sudo apt install -y openssl
fi
#clear
sudo chown $USER config/sound.txt
echo ""
echo "Choose Wav File For Alert Tone! (Or leave as is)"
default_sound="sounds/notification.wav" # /usr/share/sounds/linuxmint-login.wav
read -p "Enter Sound File [$default_sound]: " sound
if [ -z "$sound" ]
then
      sound=$default_sound
else
      echo "$sound"
fi

echo $sound > config/sound.txt
echo ""
echo "Sound Set To "
cat config/sound.txt

folder=downloads
if [ -d "$folder" ]; then
    echo "$folder exists."
    sudo chown -R $USER $folder
    echo ""
else 
    echo "$folder does not exist."
    sudo mkdir $folder
    sudo chown -R $USER $folder
    echo ""
fi

folder=sounds
if [ -d "$folder" ]; then
    echo "$folder exists."
    sudo chown -R $USER $folder
    echo ""
else 
    echo "$folder does not exist."
    sudo mkdir $folder
    sudo chown -R $USER $folder 
    echo ""
fi


folder=config
if [ -d "$folder" ]; then
    echo "$folder exists."
    sudo chown -R $USER $folder
    echo ""
else 
    echo "$folder does not exist."
    sudo mkdir $folder
    sudo chown -R $USER $folder 
    echo ""
fi
#
# See who owns this!
cUSER=$(stat -c '%U' $folder)
#echo $cUSER

folder=uploads
if [ -d "$folder" ]; then
    echo "$folder exists."
    echo ""
else 
    echo "$folder does not exist."
    sudo mkdir $folder
    sudo chown -R $USER $folder 
    echo ""
fi
#
sudo chown $USER *.*
echo "Setting File Permissions..."
placeholder=`pwd`
#cd config
sudo chown -R $USER: config downloads uploads
sudo chmod +x *.sh*
cd $placeholder
sudo chown $USER config/all_messages.txt
#
# Setting up Admins
echo "Setting Up Your Admin Account Name"
echo "What Alias you want to accept admin commands from remotely?"
echo "* Have an Admin Alias and dont share publicy)!"
default_admin="Admin"
#
read -p "Enter Sound File [$default_admin]: " admin
if [ -z "$admin" ]
then
      admin=$default_admin
else
      echo "Admin Alias : $admin You can always edit manually in config/admins.txt)"
fi

echo "$admin" > config/admins.txt
echo "OK Admin Added to admins file found in config/admins.txt"

echo "Setup Complete, Returning to menu..."
echo "Press Enter To Return To Menu"
read Y
bash menu.sh
