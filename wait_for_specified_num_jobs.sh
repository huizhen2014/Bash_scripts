###指定最大同时运行数目

#!/bin/bash

count=0

## &表示左右同时；&&表示左边正确，才运行右边
## |表示管道，||表示左边失败，才运行右边

for name in $(seq 1 15)
    do
	echo $name & count=$((count + 1))

	if [ $((count % 4)) -eq 0 ];then
	    wait
	    echo $?
	    count=0
	    sleep 3
	    fi
    
    done

	    
