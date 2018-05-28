#!/usr/bin/env bash

echo "Starting"

# depends -----------------------------------
echo "Installing depends..."
apt install toilet figlet screenfetch -y
read -p "Would you like to install additional dependencies? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install aptitude #additional depends here
fi
# -------------------------------------------

# terminal setup ----------------------------
clear
screenfetch
sleep 5
clear
color a
# -------------------------------------------

read -p "ULS> "

if [[ $REPLY = help ]]
then
    echo "Commands:"
    echo "help - lists commands"
    echo "update - updates the running linux distro"
    echo "listpackages - lists all installed packages"
fi

if [[ $REPLY = update ]]
then
    sudo aptitude update && sudo aptitude upgrade
fi

if [[ $REPLY = listpackages ]]
then
    dpkg --get-selections
fi

if [[ $REPLY = install ]]
then
    echo "Invalid Usage: install [App]"
    echo "To see a list of apps you wan install, run "install list""
fi
