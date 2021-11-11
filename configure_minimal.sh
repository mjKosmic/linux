#!/bin/bash

echo "configuring $1" 
ln -sF /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen
locale-gen
echo "arch" > /etc/hostname
echo "127.0.0.1		localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1		arch.localdomain	arch" >> /etc/hosts

#grub
pacman -Sy grub --noconfirm
pacman -Sy efibootmgr dosfstools os-prober mtools --noconfirm
mkdir -p /boot/EFI
#mkdir -p /boot/grub
mount $11 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

#install additional packages
pacman -Syu sudo vim networkmanager git --noconfirm

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

useradd -m mike
usermod -aG wheel,audio,video,optical,storage mike
