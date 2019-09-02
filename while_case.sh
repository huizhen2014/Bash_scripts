#!/bin/bash

usage(){
	echo "Usage......"
}

while [ $# -ge 0 ]
do
	case $1 in
	-h|--help)usage;exit 1;;
	-s|--single)s=$2;shift;;
	-f|--forward)f=$2;shift;;
	-r|--reverse)r=$2;shift;;
	-l|--list)l=$2;shift;;
	-*)usage;echo "$0:$1 unrecognized paramter" >&2;exit 1;;
	*) # the *), is the default catch-all condition; it is not required, but is often useful for debugging purposes even if we think we know what values the test variable will have. 
	break;;
	esac
	shift
done

if [ $s ] ;then echo "-s: $s" ; fi
if [ $f ] ;then echo "-f: "${f}; fi 
if [ $r ] ;then echo "-r: "${r}; fi
if [ $l ] ;then echo "-l: "${l}; fi

