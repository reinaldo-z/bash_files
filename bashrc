#Add to ~/.bashrc: source path_of_tis_file/bashrc

#PROMPT PERSONALIZATION
function check_branch {
gs=$(git status 2> /dev/null)
if [[ -z "$gs" ]]; then
	BRANCH=""

elif [[ `echo "$gs" | grep -w 'reset HEAD' | wc -l` == 1 ]]; then
	BRANCH="["`git branch | grep \* | cut -c 3-`" <-- comm] "

elif [[ `echo "$gs" | grep -w 'push\|nothing'| wc -l` == 2 ]]; then
	BRANCH="["`git branch | grep \* | cut -c 3-`" --> Or] "

elif [[ `echo "$gs" | grep nothing | wc -l` == 1 ]]; then
	BRANCH="["`git branch | grep \* | cut -c 3-`"] "

 else
	BRANCH="["`git branch | grep \* | cut -c 3-`"*] "
fi
echo "$BRANCH"
}


PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h: \[\033[00;31m\]$(check_branch)\[\033[01;34m\]\W \$\[\033[00m\] '
