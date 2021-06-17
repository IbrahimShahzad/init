#!/bin/bash
DIR=/proc/meminfo
cat $DIR | grep -i Huge | awk 'BEGIN {print "FIELD\t\t\tVALUE"} FNR==4 {print $1"\t"$2}  FNR==5 {print $1"\t\t"$2} FNR>7 {print $1"\t\t"$2}'
