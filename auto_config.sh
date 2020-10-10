#!/bin/bash

###############################################################################
#
#       Filename:  auto_config.sh
#
#    Description:  Automatic Linux Setup
#                  - Upgrade
#                  - Dist-Upgrade
#                  - Keyboard
#                  - Terminator
#                  - Git
#                  - Bash
#                  - Vim
#
#        Version:  1.0
#        Created:  10/10/2020 11:24:45 AM
#       Revision:  1
#
#         Author:  Gustavo P de O Celani
#
################################################################################

_title_() {
	echo -e "\n#################################################################"
	figlet $1
	echo -e "#################################################################\n"
}

_validate_path_() {
	if [[ "$(pwd)" != *linux_custom_configuration_files ]]
	then
		echo -e "Please, call this script from linux_custom_configuration_files directory..."
		echo -e "                              --------------------------------\n"
		exit 1
	fi
}

_initial_setup_() {

	sudo apt-get update
	sudo apt-get install -y dialog figlet
}

_Upgrade_() {

	_title_ "Upgrade"
	sudo apt-get -y upgrade
}

_Dist_Upgrade_() {

	_title_ "Dist-Upgrade"
	sudo apt-get -y dist-upgrade
}

_Keyboard_() {

	_title_ "Keyboard"

	echo -e "Current Keyboard Layout\n"
	setxkbmap -v -query

	echo -e "\nAttempt to set Keyboard Layout\n"
	setxkbmap -v -layout br

	echo -e "\nCurrent Keyboard Layout\n"
	setxkbmap -v -query
}

_Terminator_() {

	_title_ "Terminator"

	echo -e "Attempt to install Terminator"
	sudo apt-get install -y terminator

	echo -e "\nBackuping current terminator config"
	cp -v ~/.config/terminator/config ~/.config/terminator/config.bkp

	echo -e "\nAttempt to replace terminator config"
	cp -v ./terminator/config ~/.config/terminator/config
}

_Git_() {

	_title_ "Git"

	echo -e "Attempt to install Git"
	sudo apt-get install -y git

	echo -e "\nAttempt to set global user email"
	git config --global user.email "gustavo_celani@hotmail.com"

	echo -e "Attempt to set global user name"
	git config --global user.name "Gustavo Pasqua de Oliveira Celani"

	echo -e "\nGit Config\n"
	cat ~/.gitconfig
}

_Bash_() {

	_title_ "Bash"

	echo -e "Backuping current .bashrc"
	cp -v ~/.bashrc ~/.bashrc.bkp

	echo -e "\nAttempt to replace .bashrc"
	cp -v ./bash/.bashrc_gc_custom ~/.bashrc
}

_Vim_() {

	_title_ "Vim"

	echo -e "Attempt to install Vim"
	sudo apt-get install -y vim

	VIMRC_PATH="NONE"
	declare -a VIMRC_PATHS=("/etc/vim/vimrc" "~/.vimrc")

	for path in ${VIMRC_PATHS[@]}; do
		if [[ -f "$path" ]]
		then
			VIMRC_PATH=$path
			break
		fi
	done

	if [[ ${VIMRC_PATH} == "NONE" ]]
	then
		echo -e "\n[FAIL] vimrc file not found...\n"
		return
	fi

	echo -e "\nBackuping current .vimrc"
	sudo cp -v ${VIMRC_PATH} ${VIMRC_PATH}.bkp

	echo -e "\nAttempt to replace .vimrc"
	sudo cp -v ./vim/.vimrc ${VIMRC_PATH}
}

#
# Main Loop
#

clear
_validate_path_
_initial_setup_
clear

SETUP_LIST=$( dialog \
		--stdout \
		--separate-output \
		--backtitle "Powered by Gustavo Celani ( github.com/gustavocelani )" \
		--title "GC Custom Linux Configuration Setup" \
		--clear \
		--ok-label "OK" \
		--cancel-label "Exit" \
		--checklist "" \
	0 0 0 \
	_Upgrade_      "OS Packages Upgrade"                   OFF \
	_Dist_Upgrade_ "OS Distribution Upgrade"               OFF \
	_Keyboard_     "Portuguese (Brazil) Layout"            ON  \
	_Terminator_   "Install and configure layout settings" ON  \
	_Git_          "Install and configure user"            ON  \
	_Bash_         "GC Custom .bashrc"                     ON  \
	_Vim_          "GC Custom Vim boundles"                ON  )

clear
echo "$SETUP_LIST" | while read SETUP
do
	$SETUP
done

_title_ "Finish"
exit 0

