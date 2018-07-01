#!/bin/sh
# Run all the scripts and output the result to result directory
PATH=$PATH:`pwd`
echo "Running reldate.sh"
VER=4.17
./reldate.sh v$VER |tee result/reldate-$VER.txt

echo "Running reldate.sh with -l"
./reldate.sh -l v$VER | tee -a result/reldate-$VER.txt

echo "Running reldate.sh with no parameter; show all"
./reldate.sh  | tee result/allreldate.txt

echo "Running stable-commitcount.sh"
./stable-commitcount.sh | tee result/stable-commitcount-out.txt

echo "Running stable-reldate.sh"
./stable-reldate.sh 4.4 | tee result/stable-reldate-out-4.4.txt
./stable-reldate.sh 4.9 | tee result/stable-reldate-out-4.9.txt
./stable-reldate.sh 4.14 | tee rehult/stable-reldate-out-4.14.txt


echo "Running count-month.sh"
./count-month.sh 4.4 | tee result/count-month-out-4.4.txt
./count-month.sh 4.9 | tee result/count-month-out-4.9.txt
./count-month.sh 4.14 | tee result/count-month-out-4.14.txt


