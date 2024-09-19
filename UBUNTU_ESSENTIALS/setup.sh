#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
THIS_PATH=`echo $(realpath $(dirname $0))`

install_list=('curl' 'make' 'gcc' 'lua5.4' 'trash-cli' 'git' 'minicom' 'hwinfo' 'net-tools' 'qbittorrent' 'ncal' 'python3-full');

command_exists() {
    command -v $1 >/dev/null 2>&1
}
echo "<-> Installing Essentials !!"

for i in ${install_list[@]}
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

echo "<-> Done !!"



