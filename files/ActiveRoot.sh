#!/bin/bash
clear
if [ "$(id -u)" != "0" ]; then
    echo "ACCESSING ROOT..."
    sudo -i;
    update_system;
    active_root_en
else
    update_system;
    active_root_en
fi

update_system () {
	echo -e "UPDATING REPOSITORS, PLEASE WAIT..."
	sleep 3
	apt update; 
	apt upgrade -y; 
	apt install wget -y; 
	clear
}

active_root_en () {
	[[ $(grep -c "prohibit-password" /etc/ssh/sshd_config) != '0' ]] && {
		sed -i "s/prohibit-password/yes/g" /etc/ssh/sshd_config
	} > /dev/null
	[[ $(grep -c "without-password" /etc/ssh/sshd_config) != '0' ]] && {
		sed -i "s/without-password/yes/g" /etc/ssh/sshd_config
	} > /dev/null
	[[ $(grep -c "#PermitRootLogin" /etc/ssh/sshd_config) != '0' ]] && {
		sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config
	} > /dev/null
	[[ $(grep -c "PasswordAuthentication" /etc/ssh/sshd_config) = '0' ]] && {
		echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config
	} > /dev/null
	[[ $(grep -c "PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
		sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
	} > /dev/null
	[[ $(grep -c "#PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
		sed -i "s/#PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
	} > /dev/null
	service ssh restart > /dev/null
	clear; 
	echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
	tput setaf 7 ; tput setab 3 ; tput bold ; printf '%40s%s%-12s\n' "ROOT ACTIVATION" ; tput sgr0
	echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
	echo ""
	echo -e "             \033[1;31mWARNING! \033[1;33mTHIS SCRIPT WILL GO !\033[0m"
	echo ""
	echo -e "             \033[1;33m  ACTIVATE YOUR ROOT ACCESS\033[0m"
	echo ""
	echo -e "\033[1;31m≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×≠×\033[0m"
	echo ""; 
	sleep 2s; 
	passwd;
	clear;
	cat /dev/null > ~/.bash_history && history -c
	if [ -f /root/ActiveRoot.sh ]; then
		rm /root/ActiveRoot.sh
		true
	else
		true
	fi
	if [ -f /root/wget-log ]; then
		rm /root/wget-log
		true
	else
		true
	fi
	clear;
	echo -e "\033[1;32m ROOT ACTIVATED SUCCESSFULLY!"
	echo ""
}

active_root_pt () {}
