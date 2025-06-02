#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
THIS_PATH=`echo $(realpath $(dirname $0))`

install_list_apt=('tree' 'curl' 'make' 'gcc' 'lua5.4' 'trash-cli' 'git' 'minicom' 'hwinfo' 'net-tools' 'qbittorrent' 'ncal' 'python3-full' 'python3-pip' 'xclip' 'vlc' 'libreoffice' 'texlive-full' 'texmaker');
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

echo "<-> Installing ripgrep !!"
sudo apt-get install ripgrep

echo "<-> Installing python3-dev !!"
echo "<-> Installing python3-venv !!"
echo "<-> Installing build-essential !!"
# Install python3-dev and vertual environment
sudo apt install python3-dev python3-venv build-essential
# Resolve permission issues
sudo chown -R $USER:$USER ~/.local

# Installing Some python Packages
echo "<-> Installing python3-dev !!"
sudo apt install python3-tk

echo "<-> Installing Node !!"
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 22
# Verify the Node.js version:
node -v # Should print "v22.14.0".
nvm current # Should print "v22.14.0".
# Verify npm version:
npm -v # Should print "10.9.2".


echo "<-> Removing Unnecessary Stuff !!"
sudo apt autoremove

echo "<-> Done !!"
