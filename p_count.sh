#!/bin/bash 

#count the total NF
#column=$(sed -n '3p' $1 | awk 'BEGIN{FS=","}{print $NF}')
#extract the total number of NF
#t_num=$(echo $column | sed 's/[a-zA-Z ]//g') 

t_num=$(sed '1,3d' $1 | awk -F, 'END{print NF}')

#The function octal_decimal is for transfering the style
octal_decimal() {
for i  
do
if [ $i -ge 0 ] && [ $i -le 9 ];then
i="00"$i
i=$((10#$i))
elif [ $i -gt 9 ] && [ $i -le 99 ];then
i="0"$i
i=$((10#$i))
elif [ $i -gt 99 ] && [ $i -le 999 ];then
i=$i
fi
echo $i
done
}

for i in $(seq 3 $t_num)
do
i=$(octal_decimal $i)

count_child=$(sed '1,3d' $1 | awk -v FS="," '(100 <= $2) && ($2 <= 150){N=N+$"'$i'"}END{print N}')
#echo "The child count is $count_child"

count_mother=$(sed '1,3d' $1 | awk -v FS="," '(163 <= $2) && ($2 <= 169){N=N+$"'$i'"}END{print N}')
#echo "The motehr count is $count_mother"

count_total=$(sed '1,3d' $1 | awk -v FS="," '{N=N+$"'$i'"}END{print N}')
#echo "The total count is $count_total"

percent=$(awk 'BEGIN{printf "%.3f\n",'$count_child'/'$count_mother'}')
#echo "The percent is $percent"

echo "For sample Case${i}"
printf "The total fragment count: %d\nThe child's fragment count: %d\nThe matenal fragment count: %d\nThe percentage(child/mother): %f\n\n" $count_total $count_mother $count_total $percent

done
