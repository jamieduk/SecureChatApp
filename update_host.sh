#!/bin/bash
echo "Update Remote Host IP"
echo "Default is localhost delete localhost then put in IP, press enter."
defaultip="localhost"
if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter Remote IP " -i "$defaultip" ip
else
    ip=$1
fi
#
echo "$ip" > remote_host.txt
echo "New Remote IP Set To "
cat remote_host.txt
