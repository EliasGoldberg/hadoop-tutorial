#!/bin/bash
username=$1

echo "setting up config files..."
sed -i 's/{JAVA_HOME}$/(readlink -f \/usr\/bin\/java | sed "s:bin\/java::")/' /usr/local/hadoop-2.8.1/etc/hadoop/hadoop-env.sh
mv -f /tmp/*.xml /usr/local/hadoop-2.8.1/etc/hadoop/

echo "files configged.  now doing crypto stuff..."
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh-keyscan -H localhost >> ~/.ssh/known_hosts
ssh-keyscan -H 0.0.0.0 >> ~/.ssh/known_hosts

echo "stuff cryptoed.  formatting hdfs..."
/usr/local/hadoop-2.8.1/bin/hdfs namenode -format

echo "hdfs formatted.  starting dfs..."
/usr/local/hadoop-2.8.1/sbin/start-dfs.sh
sudo ufw allow 50070
/usr/local/hadoop-2.8.1/bin/hdfs dfs -mkdir /user
/usr/local/hadoop-2.8.1/bin/hdfs dfs -mkdir /user/$username

echo "dfs started.  starting yarn..."
/usr/local/hadoop-2.8.1/sbin/start-yarn.sh
sudo ufw allow 8088

echo "yarn started."