#!/bin/bash
user=$1
group=$2
echo "$user $group"
adduser --disabled-password --gecos "" $user
addgroup $group
usermod -g $group $user

su - $user
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys