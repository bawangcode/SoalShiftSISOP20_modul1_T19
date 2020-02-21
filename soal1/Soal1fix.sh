#!bin/bash

#13 = region
#21 = profit
#11 = state
#17 = product

#1a
region=`awk -F '\t' 'NR>1 { regions[$13]+=$21} END { for ( i in regions) print i,regions[i] | "sort -gk2" }' Sample-Superstore.tsv | awk 'NR==1 {print $1}'`
printf "Region dengan profit terkecil adalah $region\n\n"

#1b
states=`awk -v r=$region -F '\t' 'NR>1 { if(match($13, r)) states[$11]+=$21} END { for ( j in states) print states[j], j | "sort -gk1" }' Sample-Superstore.tsv | awk 'NR<3 {print $2}'`
printf "2 State dengan profit terkecil adalah : \n$states\n"

#1c
states1=`echo $states | awk '{print $1}'`
states2=`echo $states | awk '{print $2}'`
printf "\n\n"
echo "10 Produk dengan profit terdikit dari state $states1 :"
awk -v s=$states1 -F '\t' 'NR>1 { if(match($11, s)) produk[$17]+=$21} END { for ( k in produk) print produk[k], k | "sort -gk1" }' Sample-Superstore.tsv | awk 'NR<11 {$1=""; print $0}'
printf "\n\n"
echo "10 Produk dengan profit terdikit dari state $states2 :"
awk -v s=$states2 -F '\t' 'NR>1 { if(match($11, s)) produk[$17]+=$21} END { for ( k in produk) print produk[k], k | "sort -gk1" }' Sample-Superstore.tsv | awk 'NR<11 {$1=""; print $0}'
