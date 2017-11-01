#!/bin/bash
username=$1
master=$2
slaves=$3

mv -f /tmp/*.xml $HADOOP_PREFIX/etc/hadoop/

echo "updating slave file..."
IFS=',' read -r -a slave_array <<< "$slaves"
for i in "${!slave_array[@]}"; do
  echo "slave$i" >> $HADOOP_PREFIX/etc/hadoop/slave
done
echo "master" >> $HADOOP_PREFIX/etc/hadoop/slave

echo "slave file update. formatting hdfs..."
$HADOOP_PREFIX/bin/hdfs namenode -format

#echo "hdfs formatted.  starting dfs..."
#$HADOOP_PREFIX/sbin/start-dfs.sh
#$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user
#$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/$username

#echo "dfs started.  starting yarn..."
#$HADOOP_PREFIX/sbin/start-yarn.sh

#echo "yarn started."
