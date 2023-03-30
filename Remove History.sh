#!/bin/bash
#
# About: Script for Disable Hisory
# Author: liberodark
# Thanks :
# License: GNU GPLv3

version="0.0.1"

echo "Welcome on Disable History $version"

#=================================================
# CHECK ROOT
#=================================================

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

#=================================================
# RETRIEVE ARGUMENTS FROM THE MANIFEST AND VAR
#=================================================

user="my_user"
c_history="/home/${user}/.bash_history"
c_bashrc="/home/${user}/.bashrc"

clean_history(){
if [ -e "${c_history}" ]; then
    echo -e "HISTSIZE=0" >> "${c_bashrc}"
    rm -f "${c_history}" || exit
    history -c
    echo "History is Now Disable"
else
    echo "History is Disabled"
fi
}

check_user(){
if id -u "${user}" > /dev/null 2>&1; then
    clean_history
else
    echo "${user} don't exist"
fi
}

check_user
