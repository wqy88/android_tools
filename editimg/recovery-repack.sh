#!/bin/sh
recovery_file=$1
echo start repack $recovery_file to recovery.img
cd $recovery_file
../tools/mkbootfs ./ramdisk/ | gzip > $recovery_file.img-ramdisk-new.gz
#cd initrd
#find . | cpio -o -H newc | gzip > ../boot.img-ramdisk-new.gz
#cd ..

../tools/mkbootimg --cmdline "BOARD_KERNEL_CMDLINE console=ttySAC2,115200" --kernel  $recovery_file.img-zImage --ramdisk $recovery_file.img-ramdisk-new.gz --base 40000000 --pagesize 2048 -o ../$recovery_file-new.img


