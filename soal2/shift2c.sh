#!/bin/bash

for nama in $@
do
waktu=`date +%H -r $nama`
nama_sblm=`basename $nama .txt`
nama_stlh=`echo $nama_sblm | caesar $waktu`
mv $nama $nama_stlh.txt
done
