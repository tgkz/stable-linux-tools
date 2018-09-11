#!/bin/sh
# Usage: count-month.sh LTSversion
#  example: count-mount.sh 4.14
# print how many releases happend in every month
# We need to set PATH because We invoke stable-reldate.sh and listmonth
#
# Below is output in some case; 
# $ PATH=$PATH:`pwd`; ./count-month.sh  4.14
# 2017-11  3  v4.14.1 .. v4.14.3
# 2017-12  7  v4.14.4 .. v4.14.10
# 2018-01  6  v4.14.11 .. v4.14.16
# 2018-02  7  v4.14.17 .. v4.14.23
# 2018-03  9  v4.14.24 .. v4.14.32
# 2018-04  6  v4.14.33 .. v4.14.38
# 2018-05  9  v4.14.39 .. v4.14.47
# 2018-06  4  v4.14.48 .. v4.14.51

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
