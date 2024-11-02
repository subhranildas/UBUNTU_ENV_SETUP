#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
THIS_PATH=`echo $(realpath $(dirname $0))`

install_list_apt=('curl' 'make' 'gcc' 'lua5.4' 'trash-cli' 'git' 'minicom' 'hwinfo' 'net-tools' 'qbittorrent' 'ncal' 'python3-full' 'xclip' 'vlc');
install_list_snap=('nvim' 'discord' 'code');

command_exists() {
    command -v $1 >/dev/null 2>&1
}
echo "<-> Installing Essentials !!"

for i in ${install_list_apt[@]}
do
    if command_exists ${i}; then
        if [[ (${i} == "trash-cli") || (${i} == "net-tools") ]]; then
            echo ""
        else
            echo "<-> ${i} Already Installed !!"
        fi
    else
        if [[ (${i} == "trash-cli") || (${i} == "net-tools") ]]; then
            echo ""
            sudo apt install ${i}
        else
            echo "<-> Installing ${i} !!"
            sudo apt install ${i}
        fi
    fi
done

for i in ${install_list_snap[@]}
do
    if command_exists ${i}; then
        echo "<-> ${i} Already Installed !!"
    else
        if [[ (${i} == "nvim") || (${i} == "code") ]]; then
            echo "<-> Installing ${i} !!"
            sudo snap install ${i} --classic
        else
            echo "<-> Installing ${i} !!"
            sudo snap install ${i}
        fi
    fi
done

echo "<-> Done !!"

