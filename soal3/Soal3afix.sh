#!bin/bash

now=`ls -d pdkt_kusuma_* | wc -l`
if [ $now == 0 ]
then
  now=1
  max=28
else
  max=$now+28
fi

for ((i=now; i<=max; i=i+1))
do
wget -O "pdkt_kusuma_$i"  -a "temp.log" "https://loremflickr.com/320/240/cat"
done

cat temp.log >> wget.log
rm temp.log
