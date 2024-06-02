#!/usr/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
OLD_BASHRC="${USER_HOME}/.bashrc"

command_exists() {
    command -v $1 >/dev/null 2>&1
}

# Check if batcat is installed or not
if command_exists batcat; then
    echo "BATCAT Already installed !! Good Job !!"
else
    echo "Installing BATCAT"
    if ! sudo apt install bat; then
        echo "Something went Wrong During BATCAT installation !"
        exit 1
    else
        echo "BATCAT installed successfully !!"
    fi
fi

echo "Replacing BASHRC file ..."
        
if ! mv ${OLD_BASHRC} ${USER_HOME}/.bashrc.bak; then
    echo "Can't move old bashrc file !!"
    exit 1
else
    cp $PWD/.bashrc ${USER_HOME}/
    source ~/.bashrc
fi
        
