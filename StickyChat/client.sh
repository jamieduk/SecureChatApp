#!/bin/bash
#
#
defaulthost="95.145.45.166" # localhost
port=1337
username="" # test@
#
default_admin="Admin"
#
read -p "Enter Remote Host IP / Name [$defaulthost]: " host
if [ -z "$host" ]
then
      host=$defaulthost
else
      echo "Selected Host : $host"
fi

echo "Connected!"
ncat --ssl $username$host $port
