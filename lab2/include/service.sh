#!/bin/bash

function SetService(){
	local srv_verb=$1
	local srv_name=$2

	systemctl ${srv_verb} ${srv_name}
	systemctl is-active ${srv_name}

}
