#!/bin/sh
# usage allreldate
# ex. allreldate  
#  this will list all stable version for specified version 
#  and print its release date

# set stable-linux git repo as below
DIR=$HOME/Projects/linux/linuxCI/src/gitrepo/linux-stable
cd $DIR
ver=`git tag -l v2.6.1[2-9] v2.6.[2-9]? v[0-9].? v[0-9].??|sort --version-sort`
for i in $ver
do 
  echo -n $i " "
  set `git log -1 --pretty=format:%ai $i`; echo $1
done

