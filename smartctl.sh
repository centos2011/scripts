#!/bin/sh
# Script displaying SSD wear level as percents and which estimate SSD days left
# This make use of ext4 "lifetime_write_kbytes" which indicate the number of kbytes written to the file system since it was created
# grz- / 2016
 
########
# lifetime_write_kbytes path (the one you use on your SSD)
sys_fs_fs_device_path="/sys/fs/ext4/sda1/lifetime_write_kbytes"
# when the ssd was used
ssd_date='09/17/2017'
# max ssd endurance (tb)
ssd_tb_endurance=30
########
 
ssd_date_as_timestamp=`date -d $ssd_date +%s`
now_timestamp=`date +%s`
ssd_days_elapsed="$((($now_timestamp - $ssd_date_as_timestamp)/(60*60*24)))"
 
lifetime_write=`cat $sys_fs_fs_device_path`
 
echo "\033[36mSSD wear levels:"
echo "\033[37m specified endurance: \033[32m${ssd_tb_endurance}tb"
echo "\033[37m ssd lifetime write: \033[32m\n\t$(echo "($lifetime_write/1024)" | bc)Mb\n\t$(echo "($lifetime_write/1048576)" | bc)Gb\n\t$(echo "($lifetime_write/1073741824)" | bc)Tb\n"
echo "\033[37m ~ssd wear: \033[32m$(echo "scale=2; (($lifetime_write / 1073741824) / $ssd_tb_endurance) * 100" | bc)%"
 
days_left=$(echo "($ssd_tb_endurance * 1073741824) / ($lifetime_write / $ssd_days_elapsed)" | bc)
 
echo "\033[37m ~ssd days left: \033[32m$days_left days"
