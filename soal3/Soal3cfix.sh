#!bin/bash

cekdir=`ls -d kenangan | wc -l`
if [ $cekdir == 0 ]
then
  mkdir kenangan
fi


cekdir2=`ls -d duplicate | wc -l`
if [ $cekdir2 == 0 ]
then
  mkdir duplicate
fi

sum=`ls -d pdkt_kusuma_* | wc -l`

for ((i=1; i<=sum; i=i+1))
do
  j=`expr $sum - $i`
  img=`awk  -F '/' '/Location/ {print substr($4,7,21)}' wget.log | head -n $i | tail -n 1`
  count=`awk -F '/' '/Location/ {print substr($4,7,21)}' wget.log | tail -n $j | awk -v img=$img 'BEGIN {n=0} /'$img'/ {++n} END {print n}'`

if [ $count == 0 ]
  then
    countk=`ls kenangan/kenangan_* | wc -l`
    k=`expr 1 + $countk`
    mv pdkt_kusuma_$i kenangan/kenangan_$k
  else
    countd=`ls duplicate/duplicate_* | wc -l`
    d=`expr $countd + 1`
    mv pdkt_kusuma_$i duplicate/duplicate_$d
  fi

done

cat wget.log >> wget.log.bak
rm wget.log
