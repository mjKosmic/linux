#!/bin/bash

DRIVE=$1
if [ -z $1 ] ; then
	echo "Target drive not supplied, attempting to use /dev/sda"
	DRIVE=/dev/sda
fi

./wipe_partitions.sh $DRIVE
./partition_disk.sh $DRIVE
mount $DRIVE3 /mnt
pacstrap /mnt base linux linux-firmware vim net-tools
