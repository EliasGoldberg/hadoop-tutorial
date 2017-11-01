# hadoop-tutorial

## Getting Started
* Set up a new Ubuntu 14.06 VM using a SSH key
* run the following command:
  ```
  $ ./setup.sh $(whoami) <master ip> <slave1 ip>,<slave2 ip> "$(<~/.ssh/id_rsa.pub)"
  ```
* open a new browser tab and navigate to http://<your server's ip address>:50070/
* open a new browser tab and navigate to http://<your server's ip address>:8088/



## References
* [How To Use SSH Keys with DigitalOcean Droplets](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets)
* [Initial Server Setup with Ubuntu 16.04](http://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04)
* [How to Install Hadoop in Stand-Alone Mode on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-hadoop-in-stand-alone-mode-on-ubuntu-16-04)
* [Install a Multi Node Hadoop Cluster on Ubuntu 14.04](https://chawlasumit.wordpress.com/2015/03/09/)
* [Hadoop: Setting up a Single Node Cluster](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html)
* [Hadoop Cluster Setup](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/ClusterSetup.html)
