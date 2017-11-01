#!/bin/bash
# This script automatically makes the changes recommended in DigitalOcean's
# "Initial Server Setup with Ubuntu 16.04" article hosted at
# digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04.
# It additionally prevents the login of root over ssh.  The arguments are the
# name of the user to create and the contents of the public key file you will
# be using to login.
# Replace $remotehost in the following command with the IP address of your
# remote server (or set the remotehost environment variable) to create a user
# with your own user name and using the public key found in your id_rsa.pub.
# ssh root@$remotehost 'bash -s' < setup.sh $(whoami) "$(<~/.ssh/id_rsa.pub)"

username=$1
publickey="$2 $3 $4"
adduser --disabled-password --gecos "" $username
usermod -aG sudo $username

mkdir /home/$username/.ssh
touch /home/$username/.ssh/authorized_keys

echo $publickey > /home/$username/.ssh/authorized_keys
chown -R $username /home/$username/.ssh
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys
echo "$username ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

systemctl reload sshd
ufw allow OpenSSH
ufw allow 50070
ufw allow 8088
ufw allow 8042
ufw allow 8030
ufw allow 8031
ufw allow 8032
ufw allow 8033
ufw allow 35715
ufw --force enable
sed -i 's/^PermitRootLogin yes$/PermitRootLogin no/' /etc/ssh/sshd_config