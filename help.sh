#!/bin/bash
# (c) J~Net 2021
#
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Welcome To The Secure Message App 2021 Help Page"
echo "J~Net"|figlet
echo """
1. Show All Messages
2. Recieve Message
3. Send Message
4. Calendar
5. Recieve File
6. Send File
7. Setup
8. View Downloaded File
9. Remote Shell
10. Update Alias
11. Repair A Corrupted Message
12. Update J~NET Multi Tool 2021
13. Help
14. Generate Strong Key
15. Connect To Secure Multi-Chat
16. Update Remote Host IP (Add To It)
17. Replace Remote Host IP List
Enter your choice: (Anything else to exit)
"""
echo "Press Enter For More"
read Y
echo "Tip: For Security, The KEY is NEVER stored on the hard drive and will be"
echo "Requested for Recieving & Sending Secure Messages!"
echo ""
echo "The text files are used to store config and connection settings and can be"
echo "Edited manually if required!"
echo ""
echo "output.txt is the last command recieved file!"
echo ""
echo "Added Admin Features and Update Options."
echo ""
read -p "Press Enter To Go Back To The Menu..."
bash menu.sh
