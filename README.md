# hadoop-tutorial

## Getting Started
* Set up a new Ubuntu 14.06 VM using a SSH key
* run the following commands:
  ```bash
  $ hadoop=<your server's ip address>
  $ ssh root@$hadoop 'bash -s' < setup-initial.sh $(whoami) "$(<~/.ssh/id_rsa.pub)"
  $ ssh $hadoop 'bash -s' < setup-hadoop.sh $(whoami)
  $ scp core-site.xml $hadoop:/tmp/
  $ scp hdfs-site.xml $hadoop:/tmp/
  $ ssh $hadoop 'bash -s' < configure-hadoop.sh
  ```

## References
[How To Use SSH Keys with DigitalOcean Droplets](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets)
[Initial Server Setup with Ubuntu 16.04](http://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04)
[How to Install Hadoop in Stand-Alone Mode on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-hadoop-in-stand-alone-mode-on-ubuntu-16-04)
[Hadoop: Setting up a Single Node Cluster](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html)