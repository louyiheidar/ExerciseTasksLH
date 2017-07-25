#!/bin/bash
read -p "Username: " username
useradd -g sudo -m $username
passwd $usename
usermod -aG sudo $username

echo "Thankyou + $username + we now have your login details."


