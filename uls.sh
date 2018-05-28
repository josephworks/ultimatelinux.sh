#!/usr/bin/env bash

echo "Starting"

# depends -----------------------------------
echo "Installing depends..."
apt install toilet figlet -y
read -p "Would you like to install additional dependencies? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install aptitude #additional depends here
fi
# -------------------------------------------
read -p "ULS> "

if [[ $REPLY = help ]]
then
    echo "Commands:"
    echo "help - lists commands"
    echo "update - updates the running linux distro"
fi

if [[ $REPLY = update ]]
then
    sudo aptitude update && sudo aptitude upgrade
fi
