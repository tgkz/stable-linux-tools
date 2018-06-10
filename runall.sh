#!/bin/sh
# Run all the scripts and output the result to result directory
PATH=$PATH:`pwd`
echo "Running reldate.sh"
VER=4.17
./reldate.sh $VER >result/reldate-$VER.txt

echo "Running allreldate.sh"
./allreldate.sh  >result/allreldate.txt

echo "Running stable-commitcoun.sh"
./stable-commitcount.sh >result/stable-commitcount-out.txt

echo "Running stable-reldate.sh"
./stable-reldate.sh 4.4 >result/stable-reldate-out-4.4.txt
./stable-reldate.sh 4.9 >result/stable-reldate-out-4.9.txt
./stable-reldate.sh 4.14 >result/stable-reldate-out-4.14.txt


echo "Running count-month.sh"
./count-month.sh 4.4 >result/count-month-out-4.4.txt
./count-month.sh 4.9 >result/count-month-out-4.9.txt
./count-month.sh 4.14 >result/count-month-out-4.14.txt


