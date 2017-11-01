#!/bin/bash
username=$1
master=$2
slaves=$3

echo "setting up config files..."
echo "export HADOOP_PREFIX=/usr/local/hadoop-2.8.1" >> /home/$username/.bash_profile
echo "export HADOOP_PREFIX=/usr/local/hadoop-2.8.1" >> /home/$username/.bashrc
export HADOOP_PREFIX=/usr/local/hadoop-2.8.1
sed -i 's/{JAVA_HOME}$/(readlink -f \/usr\/bin\/java | sed "s:bin\/java::")/' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
mv -f /tmp/*.xml $HADOOP_PREFIX/etc/hadoop/
mv /tmp/.bashrc /home/$username

echo "updating hosts file"
IFS=',' read -r -a slave_array <<< "$slaves"
for i in "${!slave_array[@]}"; do
  echo "${slave_array[$i]} slave$i" | sudo tee -a /etc/hosts
done
echo "$master master" | sudo tee -a /etc/hosts

#echo "creating hadoop directories"
#sudo chown $username /home/$username/.bashrc
#sudo mkdir -p /hadoop-data/$username/hdfs/namenode
#sudo chown $username /hadoop-data/$username/hdfs/namenode
#sudo mkdir -p /hadoop-data/$username/hdfs/datanode
#sudo chown $username /hadoop-data/$username/hdfs/datanode

echo "files configged.  now doing crypto stuff..."
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh-keyscan -H localhost >> ~/.ssh/known_hosts
ssh-keyscan -H 0.0.0.0 >> ~/.ssh/known_hosts
