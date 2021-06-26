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
#update_check=`cat $test`
pwd=`pwd`
current_version=`cat config/version.txt`
wget $test
# wget https://github.com/jamieduk/SecureChatApp/blob/main/config/version.txt -o check.txt
cat version.txt|grep "Version"|sed 's/[^0-9]*//g' > version.txt
latest_version=`cat version.txt`
echo $latest_version

#if[$latest_version]
echo "Latest Version $latest_version"
echo "Current Version $current_version"
if [ $latest_version > $current_version ]
then
    echo "Update Required!"
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
    sudo tar -xvzpf --overwrite update.tar.gz $dest
    sudo rm -f update.tar.gz
    cd $pwd
    echo "Current Folder Is "
    pwd
    sudo rm -rf update
    sudo rm -rf old
    sudo chmod +x *.sh
    sudo chown -R $USER config/*
    sudo rm -f $pwd/version.txt
    #clear
    echo "Update Complete!"
    echo ""
else
    echo "No Update Required, You have the latest and greatest version already!"
fi

echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh   

    pwd
    sudo rm -rf update
    sudo rm -rf old
    sudo chmod +x *.sh
    sudo chown -R $USER config/*
    sudo rm -f $pwd/version.txt
    #clear
    echo "Update Complete!"
    echo ""
else
    echo "No Update Required, You have the latest and greatest version already!"
fi

echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh   

    pwd
    sudo rm -rf update
    sudo rm -rf old
    sudo chmod +x *.sh
    sudo chown -R $USER config/*
    sudo rm -f $pwd/version.txt
    #clear
    echo "Update Complete!"
    echo ""
else
    echo "No Update Required, You have the latest and greatest version already!"
fi

echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh   

    sudo rm -rf update
    sudo rm -rf old
    sudo chmod +x *.sh
    sudo chown -R $USER config/*
    sudo rm -f $pwd/version.txt
    #clear
    echo "Update Complete!"
    echo ""
else
    echo "No Update Required, You have the latest and greatest version already!"
fi

echo "Press Enter To Go Back To Menu"
read Y
bash menu.sh   

