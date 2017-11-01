#!/bin/bash
user=$1
group=$2
ip=$3
host=$4
key="$5 $6 $7"

echo "$ip $host" >> /etc/hosts
echo "$key" >> /home/$user/.ssh/authorized_keys
ssh-keyscan -H $host >> /home/$user/.ssh/known_hosts
chown $user:$group /home/$user/.ssh/known_hosts