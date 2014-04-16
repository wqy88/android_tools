#!/bin/sh
boot_file=$1
echo start repack $boot_file to boot.img
cd $boot_file
../tools/mkbootfs ./initrd/ | gzip > $boot_file.img-ramdisk-new.gz
#cd initrd
#find . | cpio -o -H newc | gzip > ../boot.img-ramdisk-new.gz
#cd ..

../tools/mkbootimg --kernel $boot_file.img-zImage --ramdisk $boot_file.img-ramdisk-new.gz --base 40000000 --pagesize 2048 -o ../$boot_file-new.img


