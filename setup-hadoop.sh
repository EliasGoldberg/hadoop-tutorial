#!/bin/bash
sudo apt-get update
sudo apt-get -y install default-jdk
echo "wgetting the hadoop tarball"
wget http://apache.mirrors.tds.net/hadoop/common/hadoop-2.8.1/hadoop-2.8.1.tar.gz -P /tmp --quiet
sha=$(shasum -a 256 /tmp/hadoop-2.8.1.tar.gz)
echo $sha
if [ "$sha" != "b5be527578ef2c8565cd435ab4ae71a024cad704f7bf597bd792082703bd77d9  /tmp/hadoop-2.8.1.tar.gz" ]
then
  echo "shasum -a 256 /tmp/hadoop-2.8.1.tar.gz returned incorrect value! Aborting!"
  exit 1
fi
sudo tar -xzf /tmp/hadoop-2.8.1.tar.gz -C /usr/local
sudo sed -i 's/{JAVA_HOME}$/(readlink -f \/usr\/bin\/java | sed "s:bin\/java::")/' /usr/local/hadoop-2.8.1/etc/hadoop/hadoop-env.sh
