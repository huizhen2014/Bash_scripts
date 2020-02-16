##通过{}&使其同时进行

count=0
for i in $(seq 1 20)
    do
	count=$(( $count + 1))
    {
	echo "This the $i"
	sleep 1
	count=$(( $count - 1))
	continue
    }&
    
    if [ $count -eq 4 ];then
	wait
	sleep 3
	count=0
	fi
    done

