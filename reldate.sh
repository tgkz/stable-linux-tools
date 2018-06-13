#!/bin/sh
# print release date for specified version in stable-tree
# usage reldate versions
# ex. reldate 4.10 4.11.2 
#  this will show the release date for specified release tag

# set stable-linux git repo into $DIR as below
DIR=$HOME/Projects/linux/linuxCI/src/gitrepo/linux-stable
cd $DIR
rdatecore.sh $*
