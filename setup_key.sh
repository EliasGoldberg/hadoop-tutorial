#!/bin/bash
user=$1
pip=$2

su - $user
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa > /dev/null
exit
key="$(</home/$user/.ssh/id_rsa.pub)"
name=$(hostname)
ip=$(ifconfig | grep "inet addr" | sed "/$pip/d" | sed "/127.0.0.1/d" | cut -d: -f 2 | awk '{print $1}')

echo "$ip $name $key"
