#!/usr/local/bash

#声明数组
declare -a Array_1
declare -a Array_2
declare -A Hash

#数组赋值
Array_1=($(seq 15))
#IFS=" " Array=(($seq 15))
Array_2=($(seq 2 16))
#IFS=" " Array=($(seq 15))

for i in $(seq 15)
do
i=$((i-1))
key=${Array_1[$i]}
value=${Array_2[$i]}
#echo $key
#echo $value
#对关联数组赋值
Hash["$key"]=$value
done

for i in $(seq 15)
do
	i=$((i-1))
	echo ${Hash[$i]} 
    #Hash 为关联数组，无法输出value值
	echo ${Array_1[$i]} 
    #Array为非关联数组，则可以输出对应element
done


for key in ${!Hash[@]}
do
echo "$key -> ${Hash[$key]}" #针对关联数组Hash，输出映射：key -> value
done

