#!/bin/sh
# Usage : stable-reldate [LTS-version]
#  Print stable release version and its release dates
# Note: You need to download long term kernel git repo such as
#  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/ 
#
# git clone and Set the directory "DIR" as below:
DIR=$HOME/Projects/linux/linuxCI/src/gitrepo/linux-stable
cd $DIR

ltsver=v$1    # "v" is added by me
ver=`git tag -l "$ltsver.*"|sort --version-sort` # get tag names

for v in $ver     # for each tagged version ..
do
   echo -n $v " "   # print a tagged version 
   set `git log -1 --pretty=format:%ai $v`; echo $1  # print release date
done
