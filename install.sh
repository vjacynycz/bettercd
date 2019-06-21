#!/bin/bash
function sep () {
	echo -e "---------------------------"
}

function log () {
	echo -e "\033[1;34m $1 \033[0m"
}

function check () {
	echo -e "\033[1;33m $1 \033[0m"
}

function ok () {
	echo -e "\033[1;32m ok \033[0m"
}

function error () {
	echo -e "\033[1;35m ERROR WHILE EXECUTING [$0 $EOS_VER $INSTALLER_OPTION]\033[0m"
	echo -e "\033[1;35m REASON: $1 \033[0m"
}

sep
log "Installing better cd"
sep
check "Checking .bettercd directory"
if [[ -d $HOME/.bettercd ]]; then
	if [[ ! -f $HOME/.bettercd/bettercd.man ||
		  ! -f $HOME/.bettercd/bettercd.source ]]; then
		error "Bettercd files not found, please copy bettercd.man and bettercd.source files to $HOME/.bettercd and run the installer"
		exit 1
	fi
else
	mkdir $HOME/.bettercd
	error "Copy files to $HOME/.bettercd and run the installer"
	exit 1
fi
ok
sep 
check "Checking shell"
_USHEL=$(echo $SHELL | rev | cut -d'/' -f 1 | rev)
case $_USHEL in
	zsh)
		check "Checking ~/.zshrc"
		grep "bettercd.source" $HOME/.zshrc 1>/dev/null
		if [[ $? == "1" ]]; then
			log "Inserting line in .zshrc" 
			echo "source $HOME/.bettercd/bettercd.source" >> $HOME/.zshrc
			ok
		else
			ok
		fi
		;;
	bash)
		check "Checking ~/.bashrc"
		grep "bettercd.source" $HOME/.bashrc 1>/dev/null
		if [[ $? == "1" ]]; then
			log "Inserting line in .bashrc" 
			echo "source $HOME/.bettercd/bettercd.source" >> $HOME/.bashrc
			ok
		else
			ok
		fi
		;;
	*)
		if [[ -z $BETTERCDROOT ]]; then
			error "Unknown shell, add 'source $HOME/.bettercd/bettercd.source' to your profile file and launch the installer again"
		    exit 1
		fi
	;;
esac
sep
log "Creating cache file"
find $HOME -type d 2>/dev/null > $HOME/.bettercd/bettercd.cache
ok
sep
check "Checking crontab job" 
crontab -l | grep ".bettercd/bettercd.cache" 1>/dev/null 2>/dev/null
if [[ $? == "1" ]]; then
	log "Creating crontab job" 
	(crontab -l 2>/dev/null; echo "*/20 * * * * find $HOME -type d 2>/dev/null > $HOME/.bettercd/bettercd.cache") | crontab -
	ok
else
	ok
fi
sep
log "Better cd installation complete, you need to reload your terminal in order to user bettercd"
log
check "Info:  BETTERCDROOT is set to \$HOME by default. If you wish to change bettercd root jump directory please run 'cd --uptateroot /path/to/rootdir'"