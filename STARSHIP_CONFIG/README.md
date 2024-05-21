Starship installation and Configuration guide:

*** Some Important Links:
	https://starship.rs/
	https://github.com/starship/starship

1. Downlaod And Attach NerdFont.
	https://www.nerdfonts.com/font-downloads

	Recommended Font to download:
		https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip	
		** Once downloaded copy the content to ~/.local/share/fonts/ . once done the fonts
		will come as options in the Terminal settings.

2. Install Starship.
    curl -sS https://starship.rs/install.sh | sh

3. Add the following to the end of ~/.bashrc
    eval "$(starship init bash)"

4. Copy Config file to location.
    ~/.config/
    ** Or create a symbolic link at that location with name starship.toml.

