#!/bin/bash
echo "Enter Your Alias To Connect To J~Net Multi-Chat"
read username
ssh $username@jnet.sytes.net -p 2022
