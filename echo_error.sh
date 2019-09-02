#!/bin/bash

error=$(cat anonymous.file 2>&1)
echo $error

cat anonymous.file 2>err.log
cat err.log
