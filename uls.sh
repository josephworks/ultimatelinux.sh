#!/usr/bin/env bash

echo "Starting"

# depends -----------------------------------
echo "Installing depends..."
apt install toilet figlet -y
read -p "Would you like to install additional dependencies? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install #additional depends here
fi
# -------------------------------------------
