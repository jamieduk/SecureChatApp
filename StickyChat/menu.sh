#!/bin/bash
# (c) J~Net 2020
# jnet.forumotion.com/t1699-lanbackup-2020-by-jnet#2624
#
# ./menu.sh
#
#path="/home/$USER/Documents/Scripts/LanBackup_Full"
#
#
echo -en "\e[92mWelcome To J~Net Sticky Chat 2021 Pick An Option..."
echo ""
echo ""
path="." # .
select fname in $path/*.sh; #.sh
do
    echo you picked $fname \($REPLY\)
    bash $fname
    #cd $fname
    bash menu.sh
    break;
done
bash menu.sh
