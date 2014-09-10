#!/bin/bash

#This script was created to remove all the temporary files created when a texfile is compilated.
#To add or delete type of temporary filles modify the variable "files_to_remove".

if [ -z "$1" ]; then
	echo -e "Select the main file name of temporary files to remove includeing the \".\""
	exit 1
else
	files_to_remove=`ls *-eps-converted-to.pdf "$1"aux "$1"fdb_latexmk "$1"log "$1"out "$1"snm "$1"synctex.gz "$1"toc 2>/dev/null`
fi

if [ -z "$files_to_remove" ]; then
	echo -e "No temporary files to remove."
else
	for i in ${files_to_remove[@]}; do
		rm `echo $i`
		echo -e "Deleted file: '$i'"
	done
fi	