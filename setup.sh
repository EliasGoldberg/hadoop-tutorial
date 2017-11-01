#!/bin/bash
username=$1
master=$2
slaves=$3
nodes="$2,$3"
publickey="$4 $5 $6"



for node in $(echo $nodes | sed "s/,/ /g")
do
    ssh root@$node 'bash -s' < setup-initial.sh $username $publickey
    ssh $node 'bash -s' < setup-hadoop.sh $username
    scp node_files/.bashrc $node:/tmp/
    scp node_files/*.xml $node:/tmp/
    ssh $node 'bash -s' < configure-hadoop-nodes.sh $username $master $slaves
done

scp master_files/*.xml $master:/tmp/
ssh $master 'bash -s' < configure-hadoop-master.sh $username $master $slaves
