#!/bin/bash

IFS=$(echo -en "\n\b")
for name in $(find . -name "*.txt")
    do
	tmp=${name// /_}
	mv $name $tmp
	done

