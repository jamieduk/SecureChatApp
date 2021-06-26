#!/bin/bash

pwd=`pwd`
echo "$pwd"
#
path=$pwd
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

echo ""
yes | sudo cp -r $path/SecureChatApp/* $path
sudo rm -rf $path/SecureChatApp

