#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
THIS_PATH=`echo $(realpath $(dirname $0))`

NVIM_CONFIG_PATH="${USER_HOME}/.config"
THIS_NVIM_CONFIG="${THIS_PATH}/nvim/"

command_exists() {
    command -v $1 >/dev/null 2>&1
}

# Check Whether nvim is already installed.
if command_exists 'nvim'; then
    echo "<-> NVIM Installed in System !!"
else
    echo "<-> Installing NVIM !!"
    sudo snap install ${i} --classic
fi

if [ -d ${NVIM_CONFIG_PATH}/nvim ]; then
    read -p "<-> Existing nvim folder found. Replace ? [Y/N]" yn
    case $yn in
        [yY] )
            rm -rf ${NVIM_CONFIG_PATH}/nvim;
            # git clone git@github.com:subhranildas/nvim_SD.git ${NVIM_CONFIG_PATH}/nvim
            git clone https://github.com/subhranildas/nvim_SD.git ${NVIM_CONFIG_PATH}/nvim
            echo "<-> Configuration folder Replaced !!";;
        [nN] ) echo "<-> Configuration folder not Replaced !!";;
        * ) echo "<-> Configuration folder not Replaced !!";;
    esac
else
    echo "<-> Copying NVIM conifuration files !!"
    # git clone git@github.com:subhranildas/nvim_SD.git ${NVIM_CONFIG_PATH}/nvim
    git clone https://github.com/subhranildas/nvim_SD.git ${NVIM_CONFIG_PATH}/nvim
fi

echo "<-> Done !!"

