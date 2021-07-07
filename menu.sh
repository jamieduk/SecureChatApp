#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo -en "\e[92mWelcome To J~Net Menu"
echo ""
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
echo "10. Update Alias"
echo "11. Repair A Corrupted Message"
echo "12. Update J~NET Multi Tool 2021"
echo "13. Help"
echo "14. Generate Strong Key"
echo "15. Connect To Secure Multi-Chat"
echo "16. Update Remote Host IP (Add To It)"
echo "17. Replace Remote Host IP List"
echo "18. Monitor Port 776 For Connections"
echo "19. Sticky Chat 2 way Private Chat Menu"
echo "Enter your choice: (Anything else to exit)" 
read n
case $n in
1)
clear
cat config/all_messages.txt | less && bash menu.sh

bash menu.sh ;;
2) bash secure_recieve_admin.sh ;; # Change to secure_recive.sh to prevent admin commands!
3) bash secure_send.sh ;;
4) cal 
bash menu.sh;;
5) bash file_rx.sh;;
# send arg here
6) echo "Enter Filename"
   read input
   bash file_tx.sh "$input";;
7) bash setup.sh;;
8) bash view_file.sh;;
9) cd remote && bash menu.sh;;
10) bash update_alias.sh;;
11) bash repair.sh;;
12) bash update.sh;;
13) bash help.sh;;
14) bash generate_key.sh;;
15) bash MultiChat.sh;;
16) bash update_host.sh;;
17) bash replace_host.sh;;
18) bash monitor.sh;;
19) cd StickyChat && bash menu.sh;;
esac

