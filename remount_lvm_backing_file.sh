#!/bin/bash 
LVM_MOUNTED=`sudo vgs | grep stack-volumes-lvmdriver`
echo $LVM_MOUNTED

# If there's no volume group for LVM remount it
if [[ -z $LVM_MOUNTED ]]; then
   LOOPBACK_FILE=`sudo losetup -f`
   cd '/opt/stack/data'
   LVM_BACKING_FILE=`ls stack-volumes-lvmdriver*`
   sudo losetup $LOOPBACK_FILE $LVM_BACKING_FILE
fi
