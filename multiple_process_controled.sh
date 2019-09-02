#!/bin/bash

##filename: mutiple_process_controled.sh

function a_sub{
    sleep 3;
    echo 1>>a && endtime=$(data +%s) && echo "我是$i, 运行了3秒，整个脚本执行了$(( $endtime - $starttime))秒" && echo 
}

starttime=$(date +%s)

export starttime

tmp_fifofile="/tmp/$.fifo"
echo $tmp_fifofile

mkfifo $tmp_fiflfile
exec 6<>$tmp_fifofile
rm $tmp_fifofile
thread=3

for((i=0;i<$thread;i++))
    do
	echo
    done >&6

for((i=0;i<10;i++))
    do
	read -u6
	{
	    a_sub || { echo "a_sub is failed" }
	    echo >&6
	}&
done
wait
exec 6>&-

wc -l aa
rm -f aa
exit 0




