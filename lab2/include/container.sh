#!/bin/bash

function CreateContainer(){
	local container_img=$1
	local container_name=$2
	local cnt=$(podman images --noheading | grep ${container_name} | wc -l)
	if [[ ${cnt} -eq 1 ]]; then
		podman run -d --rm --name ${container_name} -p 8080:8080 -p 9990:9990 -it quay.io/wildfly/wildfly /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 1> /dev/null
		sleep 10
	else
		podman pull ${container_img}
		podman run -d --rm --name ${container_name} -p 8080:8080 -p 9990:9990 -it quay.io/wildfly/wildfly /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 1> /dev/null
		sleep 10

	fi
	
	#podman container ls | grep wildfly | wc -l
	curl --silent localhost:8080 -o /tmp/wildfly-index.html 1> /dev/null
	if [ -f /tmp/wildfly-index.html ]; then
		echo "wildfly container is running"
	else
		echo "wildfly container is not running"
	fi	
}	

function StopContainer(){
	local container_name=$1
	local cnt=$(podman ps --noheading | grep ${container_name} | wc -l)

	if [[ ${cnt} -eq 0 ]];then
		echo "no ${container_name} to stop"
		return 1
	fi
	
	podman stop ${container_name}
	cnt=$(podman ps --noheading | grep ${container_name} | wc -l)
	if [[ ${cnt} -eq 0 ]];then
		echo "successfully stopped ${container_name}"
	fi

}
