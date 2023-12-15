#!/bin/bash

LENGTH=8
echo "your ip adress is  $(sudo ifconfig | grep broadcast | awk '{print $2}')"


# simple password generator

password_generator(){
		echo "This is a simple password generator"
		read -e -p "Please enter the length of the password you want to generate : " -i $LENGTH
		for p in {seq 1 to 5}; do
			openssl rand -base64 48 | cut -c 1-$REPLY
		done
}

# ip locator

#password_generator
IP="8.8.8.8"
read -e -p "enter the ip address you want the location of : " -i $IP add

if [[ -z $add ]];  then
	echo "Please enter the ip address"
else
#    curl -s "http://ip-api.com#$IP"
	res=$( curl -s "http://ip-api.com/json/$add")

#	which jq
	status=$(echo $res | jq -r '.status')
#	echo $status
	if [[ $status == "success" ]]; then
		echo $res
	else
		echo "you ip provided is private and can't be displayed its location"
	fi
fi
