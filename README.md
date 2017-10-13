# hadoop-tutorial
* Set up a new Ubuntu 14.06 VM.
* run the following commands:
  ```bash
  hadoop=<your server's ip address>
  ssh root@$hadoop 'bash -s' < setup.sh $(whoami) "$(<~/.ssh/id_rsa.pub)"`
  ```
  which applies the changes in DigitalOcean's [Initial Server Setup with Ubuntu 16.04](http://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04) guide.
