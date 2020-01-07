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
    sudo apt install aptitude git wget toilet figlet neofetch #additional depends here
fi
# -------------------------------------------

# terminal setup ----------------------------
clear
neofetch
sleep 5
clear
figlet UltimateLinux v1.0
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
    java -Xms128M -Xmx1G -XX:+UseG1GC -jar glowstone.jar
    cd ..
fi

if [[ $REPLY = getjosephworks ]]
then
    mkdir josephworks
    cd josephworks
    echo "Cloning all Repositories to ./josephworks"
    git clone https://github.com/josephworks/AtomMC
    git clone https://github.com/josephworks/HelpDesk
    git clone https://github.com/josephworks/BungeeSpigot
    git clone https://github.com/josephworks/Scripts
    git clone https://github.com/josephworks/startxcli.sh
    git clone https://github.com/josephworks/files
    git clone https://github.com/josephworks/McEmeraldtnt
    git clone https://github.com/josephworks/McAdventure
    git clone https://github.com/josephworks/ultimatelinux.sh
    git clone https://github.com/josephworks/josephworks
    git clone https://github.com/josephworks/josephworks.github.io
    git clone https://github.com/josephworks/MinecraftMultiversion
    git clone https://github.com/josephworks/McCompile
    git clone https://github.com/josephworks/Gwen-Remade
    git clone https://github.com/josephworks/CMDWorkspaceTools
    git clone https://github.com/josephworks/serverbuilder
    git clone https://github.com/josephworks/WebIDE
    git clone https://github.com/josephworks/JenkinsServer
    git clone https://github.com/josephworks/Registry-Edits
    git clone https://github.com/josephworks/PaperCraft
    git clone https://github.com/josephworks/pythonws
    git clone https://github.com/josephworks/SpigotCraft
    git clone https://github.com/josephworks/ThermosServer
    git clone https://github.com/josephworks/Gideon
    git clone https://github.com/josephworks/Windows-subsystem-for-Linux
    git clone https://github.com/josephworks/Google-Chrome-Linux-root-fix
    git clone https://github.com/josephworks/Powershell-policy-fix
    echo "Finished the cloning process"
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
    clear
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
    echo "jenkins"
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
    wget http://prdownloads.sourceforge.net/webadmin/webmin_1.900_all.deb
    sudo apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
    sudo dpkg -i webmin_1.900_all.deb
fi

if [[ $REPLY = "install jenkins" ]]
then
    if [ "$EUID" -ne 0 ]
      then 
      echo ""
      echo "Please run as root"
      exit
    fi
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sudo echo "# Jenkins install - by UltimateLinux" > /etc/apt/sources.list
    sudo echo "deb https://pkg.jenkins.io/debian binary/" > /etc/apt/sources.list
    sudo apt-get update && sudo apt-get install jenkins
    echo "DO NOT RUN THIS COMMAND AGAIN!!!"
    echo "It will add another duplicate entry to your sources.list"
    echo "that might break APT or DPKG"
fi

if [ "$EUID" -ne 0 ]
      bash ulsrepeat.sh
    else
    sudo bash ulsrepeat.sh
fi
