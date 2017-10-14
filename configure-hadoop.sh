#!/bin/bash
sed -i 's/{JAVA_HOME}$/(readlink -f \/usr\/bin\/java | sed "s:bin\/java::")/' /usr/local/hadoop-2.8.1/etc/hadoop/hadoop-env.sh
mv -f /tmp/core-site.xml /usr/local/hadoop-2.8.1/etc/hadoop/core-site.xml
mv -f /tmp/core-site.xml /usr/local/hadoop-2.8.1/etc/hadoop/hdfs-site.xml
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
/usr/local/hadoop-2.8.1/bin/hdfs namenode -format
/usr/local/hadoop-2.8.1/sbin/start-dfs.sh
sudo ufw allow 50070
