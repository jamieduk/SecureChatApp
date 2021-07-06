#!/bin/bash
defaultip=`cat config/remote_host.txt` # can be changed to localhost if you want that as your default remote
echo "Replace Remote Host IP List"
echo "Default is $defaultip delete $defaultip then put in Desired Remote IP, Then Press Enter."
if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter Remote IP " -i "$defaultip" ip
else
    ip=$1
fi
echo "$ip" > config/remote_host.txt
