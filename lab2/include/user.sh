#!/bin/bash

function CreateUser(){
	echo "create User ${1}"
	adduser $1 -p $2 2> /dev/null
}

function DeleteUser(){
	echo "delete User ${1}"
	userdel -r $1 2> /dev/null
}
