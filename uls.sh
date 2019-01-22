#!/usr/bin/env bash

echo "Starting"

# depends -----------------------------------
echo "Installing depends..."
read -p "Would you like to install additional dependencies? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    apt update
    sudo apt install aptitude git wget toilet figlet screenfetch #additional depends here
fi
# -------------------------------------------

# terminal setup ----------------------------
clear
screenfetch
sleep 5
clear
figlet ULS
# -------------------------------------------

echo "type "help" for help"
read -p "ULS> "

if [[ $REPLY = help ]]
then
    echo "Commands:"
    echo "help - lists commands"
    echo "quit - exits uls"
    echo "clear - clears the console or terminal"
    echo "update - updates the running linux distro"
    echo "ulsupdate - updates ULS"
    echo "ulsrestart - restarts uls"
    echo "listpackages - lists all installed packages"
    echo "install list - used to install applications (apt for beginners)"
    echo "minecraft - installs and runs minecraft"
    echo "glowstone - installs and compiles glowstone minecraft server"
    echo "getjosephworks - installs all of josephworks's repositories"
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
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    sudo apt install default-jre default-jdk -y
    wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
    rm Minecraft.jar.*
    java -jar Minecraft.jar
fi

if [[ $REPLY = glowstone ]]
then
    echo "Make sure maven and java are installed."
    echo "To install maven, run "install maven" followed buy "install java" in ULS."
    sleep 3
    git clone https://github.com/GlowstoneMC/Glowstone.git
    cd Glowstone
    ./scripts/build.sh
    sleep 3
    mkdir mcserver
    mv target/glowstone.jar ../mcserver/glowstone.jar
    cd ..
    cd mcserver
    java -Xms1G -Xmx1G -XX:+UseG1GC -jar glowstone.jar
    cd ..
fi

if [[ $REPLY = getjosephworks ]]
then
    echo "creating directory josephworks"
    mkdir josephworks
    cd josephworks
    echo "Cloning all modules (Repositories)"
    git clone https://github.com/josephworks/ultimatelinux.sh.git
    git clone https://github.com/josephworks/josephworks.git
    git clone https://github.com/josephworks/Gideon.git
    git clone https://github.com/josephworks/thunderstorm.git
    git clone https://github.com/josephworks/Windows-subsystem-for-Linux.git
    git clone https://github.com/josephworks/serverbuilder.git
    git clone https://github.com/josephworks/Jenkins-re-start-script.git
    git clone https://github.com/josephworks/josephworks.github.io.git
    git clone https://github.com/josephworks/Google-Chrome-Linux-root-fix.git
    git clone https://github.com/josephworks/Table-Viewer.git
    git clone https://github.com/josephworks/ThermosServer.git
    git clone https://github.com/josephworks/katoolin.git
    git clone https://github.com/josephworks/Gwen-Remade.git
    git clone https://github.com/josephworks/Glowstone.git
    git clone https://github.com/josephworks/Paperclip.git
    git clone https://github.com/josephworks/SpigotCraft.git
    git clone https://github.com/josephworks/MinecraftMultiversion.git
    git clone https://github.com/josephworks/Paper.git
    git clone https://github.com/josephworks/PaperCraft.git
    git clone https://github.com/josephworks/Registry-Edits.git
    git clone https://github.com/josephworks/PaperTestServer.git
    git clone https://github.com/josephworks/Powershell-policy-fix.git
    cd ..
    echo finished
fi

if [[ $REPLY = update ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    sudo aptitude update && sudo aptitude upgrade
fi

if [[ $REPLY = ulsupdate ]]
then
    cd ..
    rm -rf ultimatelinux.sh
    git clone https://github.com/josephworks/ultimatelinux.sh
    cd ultimatelinux.sh
    echo "please restart ULS"
fi

if [[ $REPLY = ulsrestart ]]
then
    uls.sh
fi

if [[ $REPLY = listpackages ]]
then
    dpkg -l
fi

if [[ $REPLY = install ]]
then
    echo "Invalid Usage: install [App]"
    echo "To see a list of apps you can install, run "install list""
fi

if [[ $REPLY = "install list" ]]
then
    echo "Installable Apps:"
    echo "java"
    echo "maven"
    echo "npm"
    echo "nodejs"
    echo "docker"
    echo "webmin"
fi

if [[ $REPLY = "install java" ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    sudo apt install default-jre default-jdk -y
fi

if [[ $REPLY = "install maven" ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    apt install maven -y
fi

if [[ $REPLY = "install npm" ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    sudo apt install npm -y
fi

if [[ $REPLY = "install nodejs" ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    sudo apt install npm -y
fi

if [[ $REPLY = "install docker" ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    sudo apt install docker.io -y
fi

if [[ $REPLY = "install webmin" ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    sudo aptitude install webmin
fi

sudo bash ulsrepeat.sh
