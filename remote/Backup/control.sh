#!/bin/bash
#
# Usage Example:  ./control.sh
echo "Starting Up Remote Shell Client, You Will Need Permission...."
port="1234"
sudo nc -nvlp $port
