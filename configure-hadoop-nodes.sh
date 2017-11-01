#!/bin/bash
username=$1
master=$2
slaves=$3

echo "setting up config files..."
echo "export HADOOP_PREFIX=/usr/local/hadoop-2.8.1" >> /home/hadoopuser/.bash_profile
echo "export HADOOP_PREFIX=/usr/local/hadoop-2.8.1" >> /home/hadoopuser/.bashrc
export HADOOP_PREFIX=/usr/local/hadoop-2.8.1
sudo sed -i 's/{JAVA_HOME}$/(readlink -f \/usr\/bin\/java | sed "s:bin\/java::")/' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
sudo mv -f /tmp/*.xml $HADOOP_PREFIX/etc/hadoop/
sudo chown -R hadoopuser:hadoopgroup $HADOOP_PREFIX/etc/hadoop/
sudo mv /tmp/.bashrc /home/hadoopuser
sudo chown hadoopuser:hadoopgroup /home/hadoopuser/.bashrc

echo "creating hadoop directories"
sudo mkdir -p /hadoop-data/hdfs/namenode;
sudo mkdir -p /hadoop-data/hdfs/datanode;
sudo chown -R hadoopuser:hadoopgroup /hadoop-data;

echo "files configged.  now doing crypto stuff..."
doopuser tee -a /home/hadoopuser/.ssh/known_hosts
sudo -u hadoopuser ssh-keyscan -H 0.0.0.0 | sudo -u hadosudo -u hadoopuser cat /home/hadoopuser/.ssh/id_rsa.pub | sudo -u hadoopuser tee -a /home/hadoopuser/.ssh/authorized_keys
sudo -u hadoopuser ssh-keyscan -H localhost | sudo -u haopuser tee -a /home/hadoopuser/.ssh/known_hosts
sudo -u hadoopuser ssh-keyscan -H hadoopuser | sudo -u hadoopuser tee -a /home/hadoopuser/.ssh/known_hosts
