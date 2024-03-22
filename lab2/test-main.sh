#!/bin/bash

source include/user.sh
source include/firewalld.sh
source include/passwd.sh
source include/service.sh
source include/container.sh

#usage
# ./test-main.sh operate service start http
# ./test-main.sh create container quay.io.wildfly/wildfly wildfly
# ./test-main.sh stop container wildfly



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
	operate)
		case $2 in
			service)
				if [ $3 == "start" ];then
					echo "start $4 service"   # httpd
					SetService $3 $4
				elif [ $3 == "stop" ];then
					echo "stop $4 service"
					SetService $3 $4
				elif [ $3 == "set" ];then
					echo "set $4 service"
					SetService $3 $4
				else
					"${3} doesn't work"
				fi
				;;
		esac
		;;
	
	create)
		case $2 in
			user)
				echo "this is create"
				CreateUser $3 $4
				;;
			container)
				echo "create container"  # create container service, wildfly middleware
				CreateContainer $3 $4  # container img, container name 
				;;
		esac
		;;
	
	stop)
		case $2 in
			container)
				echo "stop container"
				StopContainer $3
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
