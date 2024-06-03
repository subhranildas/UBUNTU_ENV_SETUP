# UBUNTU_ENV_SETUP #
All configuration related stuff used for setting up UBUNTU system for Better Experience.

## Starship ##

- https://starship.rs/
- https://github.com/starship/starship

    - Prerequisites:
	    - NerdFont:
			- https://www.nerdfonts.com/font-downloads

		- Recommended Font to download:
			- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
			    - Once downloaded copy the content to ~/.local/share/fonts/ . once done the fonts
			    will come as options in the Terminal settings.

    - Integration:
        - Starship along with the optional Nerd font can be manually incorporated,
            Please go through the README file in STARSHIP_CONFIG folder.
            Or user can run the setup.sh from within the STARSHIP_CONFIG folder to
            get starship incorporated in the system.


## VIM Configuration ##

- There is a VIM configuration file available in the VIM_CONFIG folder.
- This configuraion file is modified to change some basic vim behaviours.
    This does not include any kind of plugins, therefore it only gives a better UI for existing VIM.
    This file can be manually incorporated in the system or you can run the setup.sh from within the
    VIM_CONFIG Folder.
