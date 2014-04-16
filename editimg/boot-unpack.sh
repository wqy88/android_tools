#!/bin/sh
boot_file=$1
echo  start unpack $boot_file to boot dircovery
mkdir boot
mv $boot_file ./boot
cd boot
mv $boot_file boot.img
../tools/unpackbootimg -i boot.img
mv boot.img $boot_file
mkdir initrd
cd initrd
gzip -dc ../boot.img-ramdisk.gz | cpio -i

