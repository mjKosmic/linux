#!/bin/bash

if [ -z $1 ] ; then
	echo "Supply the drive you wish to format for arch. (e.g. /dev/sda)"
	exit
fi
#wipe existing drive
./wipe_partitions.sh $1

#partition the freshly wiped drive
./partition_disk.sh $1
mount $13 /mnt && mkdir /mnt/boot
pacstrap /mnt base linux linux-firmware sudo net-tools
genfstab -U /mnt >> /mnt/etc/fstab
cp configure_minimal.sh /mnt/
arch-chroot /mnt /bin/bash configure_minimal.sh 
rm /mnt/configure_minimal.sh

#set users last because they need user intervention
echo "Install finished!"
echo "Change the root password and add users at this time"
