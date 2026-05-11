#!/bin/bash

clear
echo "First we build the docker image"
echo "This step takes 2-14 min to download and build the image(7.7 GB), based on your machine and internet speed"
sleep 2
sudo docker build -t kali .
clear
echo "Now we run the container image"
sleep 2
bash start.sh
exit

