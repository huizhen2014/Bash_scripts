##
count=0
##For loop for prepare the execution files
for file in $(find $(pwd) -name "*.fq.gz")
    do 
	count=$(($count+1))
	#job=$(($job+1))
	if [ $count -eq 1 ];then 
	    read1=$file
	    fi
	if [ $count -eq 2 ];then
	    read2=$file
	    count=0
	    out=${file##*/}
	    out=${out%%_*}
	    echo "echo ${read1},${read2},${out}_spades_output" >> jobs.sh
	    echo "spades.py -1 ${read1} -2 ${read2} -o ${out}_spades_output --careful -t 4 -k 21,33,55,77,99,127 1>${out}_spades.log 2>&1" >> jobs.sh
	    read1=""
	    read2=""
	    fi
     done

##parallel execute all processes in 6 times
cat jobs.sh | parallel -j 6

