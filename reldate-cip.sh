#!/bin/sh
# usage reldate-cip [-l] [version-names]
#   -l : count and print # of lines and files for specific version[s]
#         note: if multiple version specified, you need to wait long
#   version-names: tag in the repo can be specified
#                  reqular expression can be used: ex. v4.1? or v4.1??  
#  if no version-names, all the version will be used v2.6.12 to latest
# Bewlow is output in some case;
# $ sh reldate-cip.sh v4.4.*-*
# v4.4.42-cip1  2017-01-13
# v4.4.48-cip2  2017-02-10
# v4.4.55-cip3  2017-03-19
# v4.4.69-cip4  2017-05-24
# v4.4.75-cip5  2017-06-30
# v4.4.75-cip6  2017-06-30
# v4.4.75-cip7  2017-08-21
# v4.4.83-cip8  2017-08-21
# v4.4.83-cip9  2017-09-21
# v4.4.83-cip10  2017-10-11
# v4.4.92-cip11  2017-10-18
# v4.4.92-cip12  2017-11-15
# v4.4.98-cip13  2017-11-15
# v4.4.98-cip14  2017-12-10
# v4.4.105-cip15  2017-12-13
# v4.4.109-cip16  2018-01-05
# v4.4.112-cip17  2018-01-24
# v4.4.112-cip18  2018-01-24
# v4.4.112-cip19  2018-03-07
# v4.4.120-cip20  2018-03-08
# v4.4.126-cip21  2018-04-10
# v4.4.126-cip22  2018-04-10
# v4.4.130-cip23  2018-05-17
# v4.4.130-cip24  2018-06-19
# v4.4.138-cip25  2018-06-19
 
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
DIR=$HOME/Projects/linux/linux-master/linux-cip
cd $DIR
#ver=$parm
ver=`git tag -l $parm |sort --version-sort`
rdatecore.sh $line $ver
