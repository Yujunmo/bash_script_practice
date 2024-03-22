#!/bin/bash

function SetFirewall(){
	local firewalld_srv_name=$1   #firewalld ex) http
	echo -e "\e[34mset up a $firewalld_srv_name protocol on Firewalld...\e[0m"
	firewall-cmd --add-service=${firewalld_srv_name} 2> /dev/null
	firewall-cmd --runtime-to-permanent
	logger -i -p local3.info "ADDED FIREWALLD SERVICE"
}

function ListFirewall(){
	local firewalld_srv_name=$1	#firewalld ex) http
	echo -e "\e[34mverify $firewalld_srv_name protocol on Firewalld...\e[0m"
	firewall-cmd --list-services | grep "${firewalld_srv_name} " 2> /dev/null
	if [ $? -eq 0 ]; then
		echo "${firewalld_srv_name} is on Firewall"
	else
		echo "${firewalld_srv_name} is not on Firewall"
	fi
	logger -i -p local3.info "SHOWED FIREWALLD SERVICE LIST"
}

function RemoveFirewall(){
	local firewalld_srv_name=$1
	echo -e "\e[34remove ${firewalld_srv_name} protocol on Firewalld...\e[0m"
	firewall-cmd --remove-service=${firewalld_srv_name} 2> /dev/null
	logger -i -p local3.info "Removed ${firewalld_srv_name} Firewalld service"
}
