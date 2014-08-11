#!/bin/bash

#This script was created to remove all the temporary files created when a texfile is compilated.
#To add or delete type of temporary filles modify the variable "files_to_remove".

files_to_remove=`ls *.aux *.fdb_latexmk *.log *-eps-converted-to.pdf *.out *.synctex.gz  2>/dev/null`

if [ -z "$files_to_remove" ]; then
	echo -e "No temporary files to remove."
else
	for i in ${files_to_remove[@]}; do
		echo -e "Deleted file: $i"
		rm `echo $i`
	done
fi	