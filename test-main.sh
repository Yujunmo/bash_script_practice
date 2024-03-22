#!/bin/bash

source include/user.sh
source include/firewalld.sh
source include/passwd.sh

case $1 in
	add)
		case $2 in
			service)
				echo "add firewalld service"
				SetFirewall $3
				;;
		esac
		;;
	remove)
		case $2 in
			service)
				echo "remove firewalld service"
				RemoveFirewall $3
				;;
		esac
		;;
	
	list)
		case $2 in
			service)
				echo "list firewalld service"
				ListFirewall $3
				;;
		esac
		;;
	
	create)
		case $2 in
			user)
				echo "this is create"
				CreateUser $3 $4
				;;
		esac
		;;
	delete)
		case $2 in 
			user)
			       echo "this is delete"
			       DeleteUser $3
			       ;;
	        esac
		;;
	change)
		case $2 in 
			user)
				echo "change password"
				SetUserpasswd $3 $4
				;;
		esac
		;;
				
	
esac
