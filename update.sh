#!/bin/bash
path="/home/$USER/Documents/Scripts/Crypto/nc/Messaging/Secure_Message/Test/"
cd $path
sudo chown -R $USER $path

if cd ../SecureChatApp; 
then
    #cd ..
    git init .
    git remote add -t \* -f origin https://github.com/jamieduk/SecureChatApp.git
    git checkout master
    git pull;
else 
    #git clone https://github.com/jamieduk/SecureChatApp.git SecureChatApp;
    git clone https://github.com/jamieduk/SecureChatApp.git SecureChatApp;
fi

pwd=`pwd`
echo "$pwd"
echo ""
yes | sudo cp -r /home/jay/Documents/Scripts/Crypto/nc/Messaging/Secure_Message/Test/SecureChatApp/* $path

