#!/bin/bash

#Reinaldo Arturo Zapata Peña
#reinaldo.zapata.p@gmail.com
#https://github.com/reinaldo-z

# To have this script workign you'll need to make it executable:
#		chmod -x plotex.sh
# and add an alias in the .bashrc file:
# 		alias plotex='route/to/this/file/plotex.sh

#This script was made to make a fast compilation of one or more tex files, generated by gnuplot, in the $PWD with only one command.
#It will compile all the *-gp.tex files found in the working directory. It also will delete the temporary files including the output tex files.
#Thinking about there could be another *.tex file in the working directory there is needed to have *-gp.tex file(s).
#All the *.tex files will be excluded. 

declare -a possible_options=(''  'q'  '--h')

if [ "$1" == "--h" ]; then
####Help info
	echo -e "\n\t\t GNUPLOT-LATEX, PDFLATEX & PLOTEX SCRIPT\n"
	echo -e "Usage directions: plotex [option]"
	echo -e "Argument options:\n <null>\t\tRun plotex in regular way.\n  \"-h\" \t\tOpen the plotex help menu.\n  \"-q\" \t\tRun plotex forceing pdflatex to compile quiet mode.\n\n"
	echo -e "  The plotex script works over all *-gp.tex files in actual directory:\n \t$PWD\n\n  Thinking about there could be other *.tex file(s) in this folder is the reason\nwhy only *-gp.tex files are used.\n\n  To have some you can modify the output filename in your gnuplot session/script\nor move the *.tex file(s) you want to plot to *-gp.tex file(s) and run the \nplotex command again.\n\n  The themporary files, including the *-gp.tex wll be deleted and only the\ncompiled *.pdf files will be keept.\n\n  Thanks for using my plotex script\n\t\t\t\t\tReinaldo Arturo Zapata Peña\n\t\t\t\t\treinaldo.zapata.p@gmail.com\n\t\t\t\t\thttps://github.com/reychino"
  	exit 0

####Compile in regular way
elif [ -z "$1" ]; then
	gp_tex_files=`ls *-gp.tex 2>/dev/null`
	if [ -z "$gp_tex_files" ]; then
			echo -e "  No *-gp.tex file(s) in PWD:\n\t$PWD"
			echo -e "  Create one or more. For more info type \"plotex -h\"."
			exit 0
	else
		for i in ${gp_tex_files[@]}; do
			pdflatex $i
		done
		rm *.aux *.log *-gp-inc-eps-converted-to.pdf *-gp.tex *-gp-inc.eps
		exit 0
	fi

####Try to compile in quiet way
elif [ "$1" == -q ]; then
	gp_tex_files=`ls *-gp.tex 2>/dev/null`
	if [ -z "$gp_tex_files" ]; then
			echo -e "  No *-gp.tex file(s) in PWD:\n\t$PWD"
			echo -e "  Create one or more. For more info type \"plotex -h\"."
			exit 0
	else
		for i in ${gp_tex_files[@]}; do
			echo -e "Compiling: $i"
			pdflatex $i >/dev/null
		done
		rm *.aux *.log *-gp-inc-eps-converted-to.pdf *-gp.tex *-gp-inc.eps
		exit 0
	fi

####Check invalid options
else
	echo -e "Invalid option. For more info type: plotex -h for help."
fi	
