#!/bin/bash

declare -a Array      #declare the local array:Array or -A global value

text="A*B*C*D*E*F*G"  #value the scalar 

IFS="*"               #define the IFS as *


echo ${#IFS}          #output the length of $IFS

Array=($text)         #define the array:Array 

echo "${Array[*]}"    #output the scalar with the separated sign:*, since the * will combine the values as a scalar

echo "${Array[@]}"    #output the array:Array, since the @ will maitain the structure of array (a b c d ..)

for i in ${Array[@]}  #output the value of Array, iteratively.
do
		echo -n $i
done

echo 

IFS="/"               #re-assign the IFS as "/"

echo "${Array[*]}"    #output the scalar with the separated sign:/, since the / will aggregate the value as a scalar

echo "${Array[@]}"    #output the Array with the separated sign "/", since the @ will retain the skeleton of array

text=$(IFS="#";echo "${Array[*]}")  #transfer the array to scalar as the assigned separator
echo $text
