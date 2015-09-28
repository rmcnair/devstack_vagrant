#!/bin/sh

# Seems needed in the case that we're using VirtualBox
# GUI as I don't think SSH forwarding works with that
for key in `ls /vagrant/keys/`; do
    cp /vagrant/keys/$key ~/.ssh
    chmod 600 ~/.ssh/$key
done

git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
echo '[[local|localrc]]' > local.conf
echo ADMIN_PASSWORD=password >> local.conf
echo MYSQL_PASSWORD=password >> local.conf
echo RABBIT_PASSWORD=password >> local.conf
echo SERVICE_PASSWORD=password >> local.conf
echo SERVICE_TOKEN=tokentoken >> local.conf
./stack.sh

/vagrant/config-git.sh
