#!/bin/bash

while [ $# -gt 0 ]
do
	name=$(basename $1)
	path=$(pwd)
	Abs_path=${path}/${name}
	echo $Abs_path
	shift
done
