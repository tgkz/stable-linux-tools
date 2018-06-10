#!/bin/sh
# Usage: count-month.sh LTSversion
#  example: count-mount.sh 4.14
# print how many releases happed in every month
# We invoke stable-reldate.sh so you need to set PATH
#
# Here is some example output 
#
# $ sh count-mounth.sh 
# 2017-01  6  v4.9.1 .. v4.9.6
# 2017-02  7  v4.9.7 .. v4.9.13
# 2017-03  7  v4.9.14 .. v4.9.20
# 2017-04  5  v4.9.21 .. v4.9.25
# 2017-05  5  v4.9.26 .. v4.9.30
FILE=/tmp/count-mount$$
stable-reldate.sh $1 >$FILE

set `head -1 $FILE`;START=$2
set `tail -1 $FILE`;END=$2
list=`listmonth $START $END`

for m in $list
do
    echo  -n "$m " `grep $m $FILE|wc -l` " "
    set `grep $m $FILE|head -1`; echo -n $1 ".. "
    set `grep $m $FILE|tail -1`; echo $1
done

rm $FILE   # remove it
