#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
THIS_PATH=`echo $(realpath $(dirname $0))`

OLD_BASHRC="${USER_HOME}/.bashrc"
NEW_BASHRC="${THIS_PATH}/.bashrc"

OLD_BASHRC_MIKO="${USER_HOME}/.bashrc.miko"
NEW_BASHRC_MIKO="${THIS_PATH}/.bashrc.miko"

BASHRC_REPLACEMENT_FLAG=0

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

if grep -wq "source ~/.bashrc.miko" .bashrc; then
    if cmp -s "OLD_BASHRC_MIKO" "NEW_BASHRC_MIKO"; then
        echo "<-> .bashrc.miko file up to date, Replacement not requried !!"
    else
        echo "<-> Replacing .bashrc.miko file !!"
        rm -rf $OLD_BASHRC_MIKO
        cp $NEW_BASHRC_MIKO $USER_HOME/
        BASHRC_REPLACEMENT_FLAG=1
    fi
else
    if ! mv ${OLD_BASHRC} ${USER_HOME}/.bashrc.bak; then
        echo "<-> Can't move old bashrc file !!"
        exit 1
    else
        echo "<-> Replacing .bashrc file !!"
        cp $NEW_BASHRC ${USER_HOME}/
        echo "<-> .bashrc file Replaced !!"
        BASHRC_REPLACEMENT_FLAG=1
    fi

    cp $NEW_BASHRC_MIKO $USER_HOME/
fi

echo "<-> Done !!!"
echo "<-> Run install_bashrc_support to install necessary support files if not already installed  !!"

# Execute bash to apply changes
if [ $BASHRC_REPLACEMENT_FLAG == 1 ]
then
    read -p "<-> Execute bash to apply changes ? [Y/N]" yn

    case $yn in
        [yY] ) exec bash;;
        [nN] ) echo "<-> Source bashrc to apply changes !!";;
        * ) echo "<-> Da Fak !!";;
    esac
fi

