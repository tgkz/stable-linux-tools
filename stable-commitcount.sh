#!/bin/bash
# Count the number of commits for stable release (linux-stable.git) 
# Usage: commitcount 
# this script was written by Tsugikazu Shibata 
#
# Set stable kernel tree as below:
DIR=$HOME/Projects/linux/linuxCI/src/gitrepo/linux-stable
cd $DIR
# find tags with vn.x and vn.xx
ver=`git tag -l v[0-9].? v[0-9].?? |sort --version-sort`

for v in $ver   # for each of versions
do
  last=`git tag -l "$v.*"|sort  --version-sort|tail -1` # pick latest one
  first=$v
  echo -n $first -- $last " "
  git log --oneline $first..$last |wc -l
done
