#!/bin/bash

#输入为文件，每行为来自同一样本的单或双端测序read，双端read用tab空开，且所有fastq或fasq.gz文件输入绝对路径
#输出为当前目录下新建文件夹，同时针对来自同一样本的测序fastq数据建立软链接

file=$1

while read id
    do
	    arr=($id)
		if [ ${#arr[@]} -eq 2 ]
			then
				text="${arr[@]}"
				echo $text
				echo "make dir 2"
				dir=${arr[0]##*/}
				dir=${dir/[Rr]1/combined}
				echo $dir
				mkdir $dir/
				ln -s ${arr[0]} $dir/${arr[0]##*/}
				ln -s ${arr[1]} $dir/${arr[1]##*/}
				else
				txt="${arr[@]}"
				echo ${arr[0]}
				echo $txt
				echo "make dir 1"
				dir=${arr[0]##*/}
				dir=${dir%.fastq*}
				echo $dir
				mkdir $dir
				ln -s ${arr[0]} $dir/${arr[0]##*/}
				#...
		fi
    done < $file
