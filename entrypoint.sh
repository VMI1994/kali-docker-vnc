#!/bin/bash

clear
echo ""
echo ""
figlet "SUDO PASSWORD"
echo "Enter a SUDO password for user kali, hit enter at the rest of the prompts"
adduser kali
usermod -aG sudo kali
clear
figlet "VNC PASSWORD"
echo "Enter a password to connect to VNC"
echo "Then connect your vnc client to 127.0.0.1:5901"
echo 'vncserver' | su kali 
su kali && bash
