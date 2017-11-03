#!/bin/bash
username=$1
master=$2
slaves=$3
nodes="$2,$3"
publickey="$4 $5 $6"

./clusterfy.sh hadoopuser hadoopgroup $nodes
scp master_files/*.xml root@$master:/tmp/

for node in $(echo $nodes | sed "s/,/ /g")
do
    ssh root@$node 'bash -s' < setup-initial.sh $username $publickey
    ssh $node 'bash -s' < setup-hadoop.sh $username
    scp node_files/.bashrc $node:/tmp/
    scp node_files/*.xml $node:/tmp/
    ssh $node 'bash -s' < configure-hadoop-nodes.sh $username $master $slaves
done

ssh $master 'bash -s' < configure-hadoop-master.sh $username $master $slaves
