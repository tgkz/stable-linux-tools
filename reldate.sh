#!/bin/sh
# print release date for specified version in stable-tree
# usage reldate versions
# ex. reldate 4.10 4.11.2 
#  this will show the release date for specified release tag

# set stable-linux git repo into $DIR as below
DIR=$HOME/Projects/linux/linuxCI/src/gitrepo/linux-stable
cd $DIR
ver=$*
for i in $ver
do
   v=v$i   # adding "v" for tag name in the repo
   echo -n $v " "
   set `git log -1 --pretty=format:%ai $v`; echo $1
done

