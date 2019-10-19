#!/bin/bash

##filename: mutiple_process_wait.sh
##使用&，使命令后台运行，这样命令就不需要等待前面命令执行完了就可以开始了
##因此，可以在for循环后的大括号}后面添加&符号

##1 .使用&后台运行命令
#!/bin/bash
#all_num=10
#a=$(date +%S)
#for num in $(seq 1 ${all_num})
#    do
#    {
#	sleep 1
#	echo ${num}
#	} &
#    done

#b=$(date +%S)

#echo  "startTime:\t ${a}"
#echo  "endTime:\t ${b}"




##2. 可在循环done后面添加wait命令，就可以实现完成for循环后在进行echo语句
##starttime=$(date +%H%M%S)

#!/bin/bash
all_num=10
a=$(date)
for num in $(seq 1 ${all_num})
    do
    {
	sleep 1 #多个循环sleep会同时进行
	echo ${num}
	} &
    done

wait

b=$(date)

echo  "startTime:\t ${a}"
echo  "endTime:\t ${b}"

##3. 使用xargs -p控制并发数目
##seq 1 ${all_num} | xargs -n 1 -I {} -P ${thread_num} sh ....sh

##4. 使用GNU parellel 命令控制并发数目,使用-j参数控制其并发数量。


