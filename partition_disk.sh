#!/bin/bash

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << FDISK_CMDS | sudo fdisk /dev/sda
g	# create new GPT partition
n	# add new partition
1	# partition number
	# default - first sector
+550M	# partition size
n	# add new partition
2	# partition number
	# default - first sector
+1G	# partition size
n	# add new partition
3	# partition number
	# default - first sector
	# default - last sector
t	# change partition type
1	# partition number
1	# EFI partition scheme
t	# change partition type
2	# partition number
19	# Linux Swap partition type
w	# write changes to disk
FDISK_CMDS
