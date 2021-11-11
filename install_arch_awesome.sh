#!/bin/bash

umount /mnt
mount /dev/sda3 /mnt
pacstrap /mnt \
	base \
	linux \
	linux-firmware \
	vim \
	net-tools \
	xorg-server \
	xorg-xinit \
	xterm \
	awesome \
	alacritty 
