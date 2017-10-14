#!/bin/bash
username=$1
sudo apt-get update
sudo apt-get -y install default-jdk

echo "wgetting the hadoop tarball..."
wget http://apache.mirrors.tds.net/hadoop/common/hadoop-2.8.1/hadoop-2.8.1.tar.gz -P /tmp --quiet

echo "tarball acquired. checking sha..."
sha=$(shasum -a 256 /tmp/hadoop-2.8.1.tar.gz)
if [ "$sha" != "b5be527578ef2c8565cd435ab4ae71a024cad704f7bf597bd792082703bd77d9  /tmp/hadoop-2.8.1.tar.gz" ]
then
  echo "shasum -a 256 /tmp/hadoop-2.8.1.tar.gz returned incorrect value! Aborting!"
  exit 1
fi

echo "sha checked succeeded.  un-tarring..."
sudo tar -xzf /tmp/hadoop-2.8.1.tar.gz -C /usr/local
sudo chown -R $username /usr/local/hadoop-2.8.1

