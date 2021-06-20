#!/bin/bash
# (c) J~Net 2021
#
#
# ./menu.sh
#
#path="/home/$USER/Documents/Scripts/"
#
#
GREEN='\033[0;32m'
printf "${GREEN}\n"
echo "Welcome To Secure Message App Menu 2021 Pick An Option..."
FILE=/usr/bin/figlet
if [ -f "$FILE" ]; then
    figlet Secure Chat
else 
    bash setup.sh
fi

echo "(rx to recieve a secure message or tx to send a secure message)"
echo ""
path="." # .
select fname in $path/*.sh; #.sh
do
    echo you picked $fname \($REPLY\)
    ./$fname
    bash menu.sh
    break;
done
bash menu.sh
