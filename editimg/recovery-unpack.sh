#!/bin/sh
recovery_file=$1
echo  start unpack $recovery_file to recovery dircovery
mkdir recovery
mv $recovery_file ./recovery
cd recovery
mv $recovery_file recovery.img
../tools/unpackbootimg -i recovery.img
mv recovery.img $recovery_file
mkdir ramdisk
cd ramdisk
gzip -dc ../recovery.img-ramdisk.gz | cpio -i

