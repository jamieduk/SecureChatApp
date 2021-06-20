#!/bin/bash
echo "Welcome To The Secure Message App 2021 Setup"
echo ""
echo "Installing APlay for the Alert Tone Generator..."
sudo apt install -y aplay figlet
sudo chmod +x *.sh
echo ""
echo "This will setup local and remote ip config file"
echo ""
echo "First Enter Network Protocal, noramally eth0 or tun0 or enp0s3"
echo "(If unsure use ifconfig to work that out in another terminal window)!"
read proto
echo "$proto" > proto.txt
echo "Enter Port (Default Port 21112)"
read port
echo "$port" > port.txt

ip addr show $proto | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}' > ip.txt
localip=`cat ip.txt`
echo "Local IP Is $localip"
echo "Enter Remote IP (For testing locally you can use $localip as a remote IP)!"
read remote_ip
echo $remote_ip > remote_ip.txt
# Now alart Tone file setup
echo "Choose Wav File For Alert Tone!"

default_sound="/usr/share/sounds/linuxmint-login.wav"
read -p "Enter Sound File [$default_sound]: " sound
echo $sound > sound.txt

echo "Setup Complete, Returning to menu..."
echo ""
