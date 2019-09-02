#!/bin/bash

awk 'BEGIN{FS=","}{for(i=1;i<=NF-2;i++)
if(($1 ~ /chr.*/)&&($1 !~ /chrY/))Case[i]+=$(i+2)
else if($1 ~ /chrY/) Case_Y[i]+=$(i+2)}
END{printf "Case\tTotal_count\tY_count\tP_Y_count\n";for(n=1;n<=NF-2;n++)
print "Case"n "\t" Case[n]+Case_Y[n] "\t" Case_Y[n] "\t" Case_Y[n]/(Case[n]+Case_Y[n])}' $1
