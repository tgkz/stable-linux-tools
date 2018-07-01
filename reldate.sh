#!/bin/sh
# usage reldate [-l] [version-names]
#   -l : count and print # of lines and files for specific version[s]
#         note: if multiple version specified, you need to wait long
#   version-names: tag in the repo can be specified
#                  reqular expression can be used: ex. v4.1? or v4.1??  
#  if no version-names, all the version will be used v2.6.12 to latest

line=''
if [ $# -ne 0 ]; then
  if [ $1 = '-l' ]; then 
     line='-l'
     shift
  fi
  parm="$*"
else 
  parm="v2.6.1[2-9] v2.6.[2-9]? v[0-9].? v[0-9].??"
fi
# set stable-linux git repo as below
DIR=$HOME/Projects/linux/linuxCI/src/gitrepo/linux-stable
cd $DIR
#ver=$parm
ver=`git tag -l $parm |sort --version-sort`
rdatecore.sh $line $ver
