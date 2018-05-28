#!/usr/bin/env bash

echo "Starting"

# depends -----------------------------------
echo "Installing depends..."
apt install toilet figlet screenfetch wget -y
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
# -------------------------------------------

read -p "ULS> "

if [[ $REPLY = help ]]
then
    echo "Commands:"
    echo "help - lists commands"
    echo "quit - exits uls"
    echo "clear - clears the console or terminal"
    echo "update - updates the running linux distro"
    echo "listpackages - lists all installed packages"
    echo "install list - used to install applications (apt for beginners)"
    echo "minecraft - installs and runs minecraft"
fi

if [[ $REPLY = quit ]]
then
    exit
fi

if [[ $REPLY = clear ]]
then
    clear
fi

if [[ $REPLY = minecraft ]]
then
    sudo apt install default-jre default-jdk -y
    wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
    rm Minecraft.jar.*
    java -jar Minecraft.jar
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

if [[ $REPLY = "install list" ]]
then
    echo "Installable Apps:"
    echo "java"
    echo "maven"
    echo "npm"
    echo "nodejs"
fi

if [[ $REPLY = "install java" ]]
then
    sudo apt install default-jre default-jdk -y
fi

if [[ $REPLY = "install maven" ]]
then
    apt install maven -y
fi

if [[ $REPLY = "install npm" ]]
then
    sudo apt install npm -y
fi

if [[ $REPLY = "install nodejs" ]]
then
    sudo apt install npm -y
fi

sudo bash ulsrepeat.sh
