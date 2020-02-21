#!bin/bash

cekdir=`ls -d kenangan | wc -l`
if [ cekdir == 0 ]
then
  mkdir kenangan
fi
cekdir2=`ls -d duplicate | wc -l`
if [ cekdir2 == 0 ]
then
  mkdir duplicate
fi

sum=`ls -d pdkt_kusuma_* | wc -l`
for ((i=1; i<=sum; i=i+1))
do
  j=$sum - $i
  img=`awk  -F '/' '/Location/ {print substr($4,7,21)}' wget.log | head -n $i | tail -n 1`
  logdinamis=`awk -F '/' '/Location/ {print substr($4,7,21)}' wget.log | tail -n $j`
  count=`echo $logdinamis | awk '/$img/ {++n} END {print n}'`

  if [ $count == 0 ]
  then
    mv pdkt_kusuma_$i kenangan/kenangan_$i
  else
    mv pdkt_kusuma_$i duplicate/duplicate_$i
  fi
done

cat wget.log >> wget.log.bak
rm wget.log
