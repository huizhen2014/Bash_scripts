#!/bin/bash

declare -a reuslt
declare -i i=0
while read A
		do
				result[$i]=$A
				echo $A
				i=$(($i+1))
		done<test_result

echo "${result[@]}"
