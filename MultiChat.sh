#!/bin/bash
host="localhost" # jnet.sytes.net
echo "Enter Your Alias To Connect To J~Net Multi-Chat"
read username
ssh $username@$host -p 2022
