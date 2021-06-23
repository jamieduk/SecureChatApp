#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
#
# Usage Example:  ./control.sh
echo "Starting Up Remote Shell Client, You Will Need Permission...."
port="1234"
sudo nc -nvlp $port
