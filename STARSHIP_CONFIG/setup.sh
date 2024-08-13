#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
THIS_PATH=`echo $(realpath $(dirname $0))`

command_exists() {
    command -v $1 >/dev/null 2>&1
}

installStarship() {

    if command_exists starship; then
        echo "<-> Starship already installed !!"
    else
        echo "<-> Installing Starship !!"

        if ! curl -sS https://starship.rs/install.sh | sh; then
            echo -e "<-> Something went wrong during Installation !!"
            exit 1
        else
            echo "<-> Starship Installed Successfully !!"
            echo "<-> Adding Init Script "
            echo "<-> Downloading JetBrainsMono from nerd-fonts !!"
            curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
            unzip JetBrainsMono.zip -d ./JetBrainsMono
            # Check if fonts folder exists or not. If not, create folder.
            echo "<-> Adding JetBrainsMono Font to System !!"
            if ! [ -d ${USER_HOME}/.local/share/fonts ]
            then
                mkdir ${USER_HOME}/.local/share/fonts
            fi
            # Copy Font files to fonts folder
            cp JetBrainsMono/* ${USER_HOME}/.local/share/fonts/
            # Update font information Cache
            fc-cache -f
            # Ask user to Change the Font to JetBrainsMono
            echo "<-> Please change the font to JetBrainsMono from Terminal Preferences Profile !!"
        fi
    fi

    if command_exists starship; then
        if ! [ -f ${USER_HOME}/.config/starship.toml ]; then
            echo "<-> Adding Starship configuration file !!"
            cp starship.toml ${USER_HOME}/.config/
            return
        else
            echo "<-> Starship configuration file already present !!"
            echo "<-> Comparing File !!"

            if cmp -s "${USER_HOME}/.config/starship.toml" "${THIS_PATH}/starship.toml"; then
                echo "<-> Same starship.toml !! Replacement not Required !!"
                echo "<-> Done !!"
                return
            else
                echo "<-> Removing Existing configuration !!"
                rm -rf ${USER_HOME}/.config/starship.toml
                echo "<-> Adding new Starship configuration file !!"
                cp starship.toml ${USER_HOME}/.config/
                echo "<-> starship.toml file Replaced !!"
            fi
        fi

        if ! grep -wq "starship init bash" ${USER_HOME}/.bashrc; then
            echo "<-> Adding init script to .bashrc !!"
            echo 'eval "$(starship init bash)"' >> ${USER_HOME}/.bashrc
        fi
    fi

    echo "<-> Done !!"
}

installStarship
