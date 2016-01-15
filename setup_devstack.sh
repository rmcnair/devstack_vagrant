#!/bin/sh

# NOTE - this provisioning script will run as root
apt-get -qqy update || yum update -qy
apt-get install -qqy git || yum install -qy git

# Some packages I find useful my development, feel free to update
apt-get install -y dos2unix
apt-get install -y pep8
apt-get install -y vim

# Install python
wget -q -O - http://archive.getdeb.net/getdeb-archive.key
echo "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list
apt-get update
apt-get install -y --force-yes pycharm

for file in `ls /vagrant/*sh`; do
  chmod +x $file
done

# In order to make devstack and everyone happy, we need to
# run the rest of the setup as a non-root user
su -c "/vagrant/setup_devstack_non_root.sh" vagrant
