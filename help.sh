#!/bin/bash
# (c) J~Net 2021
#
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
echo "Welcome To The Secure Message App 2021 Help Page"
echo "J~Net"|figlet
echo """
1. Show All Messages        Shows all messages
2. Recieve Message          Set To Recieve A Message
3. Send Message             Send a message to all hosts
4. Calendar                 Calender!
5. Recieve File             Set To Recieve A File (enable the port in your fw and router)
"""
echo """
6. Send File                Sends file to 1 host so use replace host option if required!
7. Setup                    Sets up everything this needs to work!
8. View Downloaded File     View Downloaded File(s)! upload and download directory required for this!
9. Remote Shell             Remote Shell (Previous Method)
10. Update Alias            Update Your Alias
11. Repair Corrupted Message Attempts to recover bad decrypted data with the correct key! (experimental)!
12. Update J~NET Multi Tool 2021 Attempts to update This App if it fails just delete the SecureChatApp Folder
13. Help                    This Page!
14. Generate Strong Key     Generate A Strong Key
15. Connect To Secure Multi-Chat aka J~Net ssh-chat
16. Update Remote Host IP (Add To It) Add a host to remote hosts!
17. Replace Remote Host IP List For sending to just 1 host only!
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
