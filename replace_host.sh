#!/bin/bash
filename="config/remote_host.txt"
defaultip=`cat config/remote_host.txt` # can be changed to localhost if you want that as your default remote
if [ -s "$filename" ] 
then
	echo "Curently It Is $defaultip"
        # do something as file has data
else
	echo ""
    defaultip="localhost"
fi

echo "Replace Remote Host IP List"
echo "Delete $defaultip then put in Desired Remote IP, Then Press Enter."
if [ "$#" -eq  "0" ]
  then
        read -e -p "Enter Remote IP " -i "$defaultip" ip
else
    ip=$1
fi

echo "Happy With $ip?"
read -r -p "[y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "$ip" > config/remote_host.txt
else
    echo "Ok then..."
fi

bash menu.sh
