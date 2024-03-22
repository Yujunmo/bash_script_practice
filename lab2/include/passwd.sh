#!/bin/bash


function SetUserpasswd(){
	local usr_name=${1}
	local new_passwd=${2}
	local found_yn=N
	local user_list=$(cut -d ":" -f 1 /etc/passwd)

	for user in ${user_list};do
		if [ "${user}" == "${usr_name}" ];then
			found_yn=Y
		fi
	done
	

	if [ ${found_yn} == "N" ];then
		echo "no user such as ${usr_name}"
		return
	fi

	echo ${new_passwd} | passwd --stdin ${1}
	if [ $? -eq 0 ];then
		echo "successfully changed the password for ${1}"
	else
		echo "failed in changing the password for ${1}"
	fi	
}
