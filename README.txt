		README

This repository contains the bash configuration files and also some useful scripts to work using the command line.

BASH FILES FOLDER
	BASHRC FILE
		The "bashrc" file contains useful aliases and the customization of the prompt output.
		There is needed ot add <source /whatever/this_file> into the "~/.bashrc"  original file to have it working.
		Using this bashrc you will have, with the "check_branch" finction, the option to check if youre in a git repo. If you are in it then will be displayed the branch name and the statuss: up to date (only the name of the branch), dirty (branch name + "*"), need to commit (branch name + <-- comm), and need to push to origin (branch name + --> Or).
	
	PLOTEX SCRIPT
		The plotex script is used to work with gnuplot with a LaTeX output. It uses the pdflatex package to compile all the *-gp.tex files found in the working directory obtained as the output of a gnuplot script/terminal work. Also the plotex script deletes all the temporary files (includeing the *-gp.tex files). This script is included in the bashrf file to run it directly in the commandline.
	
	RMTEX SCRIPT
		The rmtex script is used to delete all the temporary files created when a *.tex file is compiled. This script is included in the bashrf file to run it directly in the commandline.


GNOME TERMINAL COLORS SOLARIZED FOLDER
	INSTALL.SH SCRIPT
		Contains the scripts needed to set up the solarized color scheme in the gnome terminal. To install use the "install.sh" script. There is needed to have at least one profile to overwrite. I made some modiffications in the color palettes to have them working in the right way. A back up of the old palettes was made in the files  ".palette_backup" and ".palette-new_backup".
	SET DARL AMD LIGHT SCRIPTS
		The "set_dark.sh" and "set_light.sh" scripts sets up the dark an light solarized color schemes. 
	DELETE COLOR SCHEMES SCRIPT
		I made the "delete_color_schemes.sh" script. WARNING: it deletes ALL the color schemes in the gnome terminal and only sets up the default one.  

SUBLIME TEXT FOLDER
	Default (Linux).sublime-keymap
		Contains my Sublime Text preferences.