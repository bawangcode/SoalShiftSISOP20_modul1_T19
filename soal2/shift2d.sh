#!/bin/bash

for nama in $@
do
waktu=`date +%H -r $nama`
nama_sblm=`basename $nama .txt`
waktu_baru=`expr 26 - $waktu`
nama_stlh=`echo $nama_sblm | caesar $waktu_baru`
mv $nama $nama_stlh.txt
done
