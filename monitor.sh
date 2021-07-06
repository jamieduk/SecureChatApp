#!/bin/bash
#see https://stackoverflow.com/questions/29728151/how-to-listen-for-multiple-tcp-connection-using-nc
#
#
port=776
# output after you start listening to same port.
watch -n1 "sudo netstat -anp | grep $port" # >> log.txt && cat log.txt

