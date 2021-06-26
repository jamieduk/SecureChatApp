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
test="https://github.com/$account/$product/raw/main/config/version.txt"
# Get Directory Name
pwd=`pwd`
# Load Current Version
current_version=`cat $pwd/config/version.txt`
# Get New Version
wget $test
# wget https://github.com/jamieduk/SecureChatApp/blob/main/config/version.txt
# Debug
echo "Current Version Installed: $current_version"
echo "Latest Version Available: $latest_version"
#cat version.txt|sed 's/[^0-9]*//g' > version.txt
# Actual!
#cat version.txt|grep "Version"|sed 's/[^0-9]*//g' > version.txt
latest_version=`cat version.txt|grep "Version"|sed 's/[^0-9]*//g'`
Current_ver_test=`cat config/version.txt|grep "Version"|sed 's/[^0-9]*//g'`
#
echo ""
#latest_version=`cat version.txt|grep "<strong>"|sed 's/[^0-9]*//g' `
#if[$latest_version]
#echo $latest_version
if [ "$latest_version" > $Current_ver_test ]
then
    echo "Update Required!"
    echo "Update J~NET Multi Tool 2021"
    sudo mkdir update
    sudo chown -R $USER update
    cd $pwd/update
    echo "Current Folder Is "
    pwd
    git clone https://github.com/"$account"/"$product".git && sleep 10
    cd $product/
    echo "Update Folder Is "
    pwd
    #sudo mv --force config old
    #sudo mv --force old 2>/dev/null
    #sudo mv --force -u ./* $pwd
    src="$pwd/update/$product/*" #/
    dest="$pwd"
    for f in *
do
 echo "Tryin to remove old file $pwd/$f"
 set -o noclobber
{ > $pwd/$f ; } &> /dev/null
 sudo rm -f "$pwd/$f"
 sudo mv --force "$f" "$pwd/$f"
 # do something on $f
done
    #sudo tar -cvzpf update.tar.gz $src
   # tar -zcvf update.tar.gz *
    
    #sudo tar -xvzpf update.tar.gz $dest
    #
    if [ "$latest_version" -eq $current_version ]
        then
            sudo rm -f update.tar.gz
            sudo rm -rf update
            sudo rm -rf old
            sudo rm -rf version.txt 1 version.txt.1
            sudo chmod +x *.sh
            sudo chown -R $USER config/*
            sudo rm -f $pwd/version.txt
        else
            echo "Failed To Extract Update"
            sudo rm -rf  $pwd/1
    fi
    #
    cd $pwd
    echo "Current Folder Is "
    pwd  
    #clear
    echo "Update Complete!"
    echo ""
else
    echo "No Update Required, You have the latest and greatest version already!"
    echo "Attempting Cleanup For Accurate Results Enter Password"
    sudo rm -rf version.txt 1 version.txt.1
fi
sudo chown -R $USER *.sh *.txt
sudo chmod +x *.sh
echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh
