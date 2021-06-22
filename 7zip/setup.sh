#!/bin/bash
echo "Setting up 7-Zip"
sudo add-apt-repository universe
sudo apt update

sudo apt install -y p7zip-full p7zip-rar
