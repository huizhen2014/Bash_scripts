#!/bin/bash

A=B

echo "PID for 1.sh before exec/source/fork:$$"

export A

echo "1.sh :\$A is $A"

case $1 in

    exec)
    echo "Using exec.."
    exec ./2.sh ;;
    source)
    echo "Using source.."
    . ./2.sh ;;
    *)
    echo "Using fork by default..."
    ./2.sh ;;
esac

echo "PID for 1.sh after exec/source/fork:$$"
echo "1.sh: \$A is $A"

