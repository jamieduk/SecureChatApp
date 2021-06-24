#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo -en "\e[92m "
echo ""
echo "Welcome To J~Net Menu"
echo ""
echo "1. Show All Messages"
echo "2. Recieve Message" 
echo "3. Send Message"
echo "4. Calendar"
echo "5. Recieve File"
echo "6. Send File"
echo "7. Setup"
echo "8. View Downloaded File"
echo "9. Remote Shell"
echo "10. Update Remote Host IP"
echo "11. Update Alias"
echo "12. Repair A Corrupted Message"
echo "Enter your choice: (Anything else to exit)" 
read n
case $n in
1)
clear
cat all_messages.txt 
bash menu.sh ;;
2) bash secure_recieve.sh ;;
3) bash secure_send.sh ;;
4) cal 
bash menu.sh;;
5) bash file_rx.sh;;
# send arg here
6)  echo "Enter Filename"
    read myvar
    bash file_tx.sh "$myvar";;
7) bash setup.sh;;
8) bash view_file.sh;;
9) cd remote && bash menu.sh;;
10) bash update_host.sh;;
11) bash update_alias.sh;;
12) bash repair.sh;;
esac

