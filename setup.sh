#!/bin/bash

clear
echo "First we build the docker image"
echo "This step takes 9-10 min to download and build the image(only the first time!)"
sleep 2
sudo docker build -t kali .
clear
echo "Now we run the container image"
sleep 2
./start.sh
exit

