#!/bin/bash
username=$1
master=$2
slaves=$3

#echo "updating slave file..."
export HADOOP_PREFIX=/usr/local/hadoop-2.8.1
#sudo touch $HADOOP_PREFIX/etc/hadoop/slave
#sudo chown $username $HADOOP_PREFIX/etc/hadoop/slave
#IFS=',' read -r -a slave_array <<< "$slaves"
#for slave in $(echo $slaves | sed "s/,/ /g")
#do
#  ip_info=$(sudo -u hadoopuser ssh -o StrictHostKeychecking=no $slave 'ifconfig')
#  private_address=$(echo "$ip_info" | grep "inet addr" | sed "/$slave/d" | sed "/127.0.0.1/d" | cut -d: -f 2 | awk '{print $1}')
#  sudo grep $private_address /etc/hosts | awk '{print $2}' >> $HADOOP_PREFIX/etc/hadoop/slave
#done
#echo $(hostname) >> $HADOOP_PREFIX/etc/hadoop/slave
#sudo chown hadoopuser:hadoopgroup $HADOOP_PREFIX/etc/hadoop/slave

#echo "slave file update. formatting hdfs..."
#sudo -u hadoopuser $HADOOP_PREFIX/bin/hdfs namenode -format

#echo "hdfs formatted.  starting dfs..."
#sudo -u hadoopuser $HADOOP_PREFIX/sbin/start-dfs.sh
#sudo -u hadoopuser $HADOOP_PREFIX/bin/hdfs dfs -mkdir /user
#sudo -u hadoopuser $HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/$username

echo "dfs started.  starting yarn..."
sudo -u hadoopuser $HADOOP_PREFIX/sbin/start-yarn.sh

echo "yarn started."
