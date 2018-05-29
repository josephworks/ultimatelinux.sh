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
    sudo apt install default-jre default-jdk -y
    wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
    rm Minecraft.jar.*
    java -jar Minecraft.jar
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
    sudo dpkg -l
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
    echo "docker"
    echo "webmin"
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

if [[ $REPLY = "install docker" ]]
then
    sudo apt install docker.io -y
fi

if [[ $REPLY = "install webmin" ]]
then
    wget https://prdownloads.sourceforge.net/webadmin/webmin_1.881_all.deb
    dpkg -i webmin-current.deb
fi

sudo bash ulsrepeat.sh
