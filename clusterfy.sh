#!/bin/bash
user=$1
group=$2
nodes=$3

for node in $(echo $nodes | sed "s/,/ /g")
do
    echo "node: $node"
    ssh root@$node 'bash -s' < make_user.sh $user $group
done

for node in $(echo $nodes | sed "s/,/ /g")
do
    ip_host_key=$(ssh root@$node 'bash -s' < setup_key.sh $user $node)
    for other_node in $(echo $nodes | sed "s/,/ /g")
    do
        if [ $node != $other_node ]
        then
            ssh root@$other_node 'bash -s' < authorize.sh $user $group $ip_host_key
        fi
    done
done
