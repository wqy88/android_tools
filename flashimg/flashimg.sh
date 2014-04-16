#!/bin/bash
img_file=$1
temp=/data/local/tmp

if [ "${img_file:0:4}" = "boot" ]; then
   echo start flash ${img_file} to your phone
   adb push ${img_file} $temp/$img_file
   adb shell "dd if=$temp/$img_file of=/dev/block/mmcblk0p8" || adb shell su -c "dd if=$temp/$img_file of=/dev/block/mmcblk0p8"
   adb shell rm $temp/$img_file
elif [ "${img_file:0:8}" = "recovery" ]; then
   echo start flash ${img_file} to your phone
   adb push ${img_file} $temp/$img_file
   adb shell "dd if=$temp/$img_file of=/dev/block/mmcblk0p9" || adb shell su -c "dd if=$temp/$img_file of=/dev/block/mmcblk0p9"
   adb shell rm $temp/$img_file   
else
   echo Are you select the boot*.img or recovery*.img file to flash ?
fi


#全部通用命令：
#命令后加&&再加命令是成功了才继续运行的
#命令后加||再加命令是失败了才继续运行的
#img文件必须是boot*.img或recovery*.img格式
