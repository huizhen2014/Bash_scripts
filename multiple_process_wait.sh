#!/bin/bash

##filename: mutiple_process_wait.sh

starttime=$(date +%s)
for((i=0;i<5;i++))
    do
    {
	sleep 3;echo 1>>aa && endtime=$(date +%s) && echo "我是$i, 运行了3秒，整个脚本执行了$(($endtime - $starttime))秒"
    }&
    done
    wait
    cat aa|wc -l
    rm aa

