#!/bin/bash

#针对当前文件夹内find所能匹配的文件建立绝对路径
#切记bash的返回值$()和$(()), 同时还有数字比较和字符串比较的不同表示

#设置初始值，用于后续将相同文件输入同一行一tab隔开
m=1

for file in $(find . -name "sample*" | sort -t_ -k4 -k2) 
	do
		
		local_path=$(pwd)
		bas_name=$(basename $file)
		abs_path=${local_path}/${bas_name}
		if [ $((${m}%2)) -eq 1 ]
			then
				printf "%s\t" $abs_path
				m=$(($m+1))
		else
			printf "%s\n" $abs_path
			m=$(($m+1))
		fi
	done

