#! /bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
OLD_BASHRC="${USER_HOME}/.bashrc"
NEW_BASHRC="$PWD/.bashrc"

command_exists() {
    command -v $1 >/dev/null 2>&1
}

# Check if batcat is installed or not
if command_exists batcat; then
    echo "<-> BATCAT Already installed !!"
else
    echo "<-> Installing BATCAT"
    if ! sudo apt install bat; then
        echo "<-> Something went Wrong During BATCAT installation !!"
        exit 1
    else
        echo "<-> BATCAT installed successfully !!"
    fi
fi


if cmp -s "$NEW_BASHRC" "$OLD_BASHRC"; then
    echo "<-> Same bashrc !! Replacement not Required !!"
else
    if ! mv ${OLD_BASHRC} ${USER_HOME}/.bashrc.bak; then
        echo "<-> Can't move old bashrc file !!"
        exit 1
    else
        echo "<-> Replacing BASHRC file ..."
        cp $NEW_BASHRC ${USER_HOME}/
        echo "<-> .bashrc file Replaced !!"
    fi
fi

source ~/.bashrc
echo "<-> Done !!!"

