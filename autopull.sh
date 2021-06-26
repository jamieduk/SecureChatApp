#!/bin/bash

pwd=`pwd`
echo "$pwd"
#
path=$pwd
cd $path
account="jamieduk"
product="SecureChatApp"
sudo chown -R $USER $path

if cd ../$product; 
then
    #cd ..
    git init .
    git remote add -t \* -f origin https://github.com/$account/$product.git
    git checkout master
    git pull;
else 
    #git clone https://github.com/$account/$product.git $product;
    git clone https://github.com/$account/$product.git $product;
    #cd $product && sudo rm -rf config && cd ..
fi

echo ""
yes | sudo cp -r $path/$product/* $path
sudo rm -rf $path/$product
sudo chown $USER $path/*
sudo chown $USER $path/config/*
sudo chmod +x $path/*.sh
bash $path/setup.sh
