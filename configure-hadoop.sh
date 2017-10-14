#!/bin/bash
username=$1

echo "setting up config files..."
echo "export HADOOP_PREFIX=/usr/local/hadoop-2.8.1" >> /home/$username/.bash_profile
export HADOOP_PREFIX=/usr/local/hadoop-2.8.1
sed -i 's/{JAVA_HOME}$/(readlink -f \/usr\/bin\/java | sed "s:bin\/java::")/' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
mv -f /tmp/*.xml $HADOOP_PREFIX/etc/hadoop/

echo "files configged.  now doing crypto stuff..."
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh-keyscan -H localhost >> ~/.ssh/known_hosts
ssh-keyscan -H 0.0.0.0 >> ~/.ssh/known_hosts

echo "stuff cryptoed.  formatting hdfs..."
$HADOOP_PREFIX/bin/hdfs namenode -format

echo "hdfs formatted.  starting dfs..."
$HADOOP_PREFIX/sbin/start-dfs.sh
sudo ufw allow 50070
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/$username

echo "dfs started.  starting yarn..."
$HADOOP_PREFIX/sbin/start-yarn.sh
sudo ufw allow 8088

echo "yarn started."