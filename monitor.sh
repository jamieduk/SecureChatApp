#!/bin/bash
# (c) J~NET 2021
# jnet.sytes.net
#
# https://jnet.forumotion.com/t1729-jnet-multi-tool-2021#2677
# https://jnet.forumotion.com/t1744-secure-chat-bash-app#2702
#
port=776
# output after you start listening to same port.
watch -n1 "sudo netstat -anp | grep $port" # >> log.txt && cat log.txt
bash menu.sh
