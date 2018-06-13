#!/bin/bash
# release date core 
# usage rdatecre versions
#    ex. rdatecre 4.10 4.11.2 
#     or rdatecore v4.10 v4.11.2
#  this will show the release date for specified release tag
#  Note: Currend directory must be a git repo

# set stable-linux git repo into $DIR as below
DIR=$HOME/Projects/linux/linuxCI/src/gitrepo/linux-stable
cd $DIR
ver=$*
for i in $ver
do
   if [ ${i::1} = 'v' ]; then v=$i  # 'v' was specified
   else v=v$i   # adding "v" for tag name in the repo
   fi
   echo -n $v " "
   set `git log -1 --pretty=format:%ai $v`; echo $1
done

