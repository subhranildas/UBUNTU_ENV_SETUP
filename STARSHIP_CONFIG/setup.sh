#!/bin/bash

command_exists() {
    command -v $1 >/dev/null 2>&1
}

installStarship() {

    if command_exists starship; then
        echo "<-> Starship already installed !!"
        return
    else
        echo "<-> Installing Starship !!"
    fi

    if ! curl -sS https://starship.rs/install.sh | sh; then
        echo -e "<-> ${RED}Something went wrong during Installation !!${RC}"
        exit 1
    else
        echo "<-> Starship Installed Successfully !!"
        echo "<-> Downloading JetBrainsMono from nerd-fonts !!"
        curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
        unzip JetBrainsMono.zip -d ./JetBrainsMono
        # Check if fonts folder exists or not. If not, create folder.
        echo "<-> Adding JetBrainsMono Font to System !!"
        if ! [ -d ~/.local/share/fonts ]
        then
            mkdir ~/.local/share/fonts
        fi
        # Copy Font files to fonts folder
        cp JetBrainsMono/* ~/.local/share/fonts/
        # Update font information Cache
        fc-cache -f
        # Ask user to Change the Font to JetBrainsMono
        echo "<-> Please change the font to JetBrainsMono from Terminal Preferences Profile !!"
    fi

    if ! [ -f ~/.config/starship.toml ]; then
        echo "<-> Adding Starship configuration file !!"
        cp starship.toml ~/.config/
    else
        echo "<-> Starship configuration file already present !!"
    fi

    echo "<-> Done !!"
}

installStarship
