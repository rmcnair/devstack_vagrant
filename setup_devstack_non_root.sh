#!/bin/sh

# Seems needed in the case that we're using VirtualBox
# GUI as I don't think SSH forwarding works with that
for key in `ls /vagrant/keys/`; do
    cp /vagrant/keys/$key ~/.ssh
    chmod 600 ~/.ssh/$key
done

# Cron was having trouble with file from shared folder
cp /vagrant/remount_lvm_backing_file.sh ~/remount_lvm_backing_file.sh
# Setup job to remount LVM backing file for devstack after boot
(crontab -l 2>/dev/null; echo "@reboot ~/remount_lvm_backing_file.sh") | crontab -

# Time to stack
git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
# Change these passwords...
pass=password
token=tokentoken
cat >local.conf <<EOL
[[local|localrc]]
ADMIN_PASSWORD=$pass
MYSQL_PASSWORD=$pass
RABBIT_PASSWORD=$pass
SERVICE_PASSWORD=$pass
SERVICE_TOKEN=$token
EOL

./stack.sh

/vagrant/config_git.sh
