# SoalShiftSISOP20_modul1_T19

## Nama Angggota

- Adeela Nurul Fadhila [05311840000001]
- Muhammad Zulfikar Fauzi [05311840000012]

# Nomor 1

Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

  1. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
     sedikit
  2. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
     sedikit berdasarkan hasil poin a
  3. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
     sedikit berdasarkan 2 negara bagian (state) hasil poin b
    
Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan
laporan tersebut.

*Gunakan Awk dan Command pendukung

#### Link code soal 1 :

##### Source code : [Soal1fix.sh](https://github.com/bawangcode/SoalShiftSISOP20_modul1_T19/blob/master/soal1/Soal1fix.sh)

##### Data : [Sample-Superstore.tsv](https://github.com/bawangcode/SoalShiftSISOP20_modul1_T19/blob/master/soal1/Sample-Superstore.tsv)

jawaban:

#### 1a.
     region=`awk -F '\t' 'NR>1 {regions[$13]+=$21} END { for ( i in regions) print i,regions[i] | "sort -gk2" }' Sample-Superstore.tsv | awk 'NR==1 {print $1}'` 
     printf "Region dengan profit terkecil adalah $region\n\n"

- Pertama kita buat awk dengan pemisah tab ('\t'). Karena row pertama merupakan nama dari tabel sehingga tidak memiliki data, maka digunakan NR>1.
- {regions[$13]+=$21} digunakan untuk menjumlahkan keseluruhan profit yang ada di masing-masing state.
- END{} artinya kode ini dijalankan sekali dan di akhir saja.
- for (i in regions) print i,regions[i] digunakan untuk menampilkan seluruh array dan nilai yang ada di dalam array.
- "sort -gk2" digunakan untuk mengurutkan array dari yang terkecil ke terbesar berdasarkan nilai dari arry tersebut. -g karena profit bertipe data float. kemudian k2 karena profit ada di kolom kedua.
- lalu di pipe dan awk lagi untuk memasukkan baris pertama ke dalam "region".
- yang terakhir adalah menampilkan isi dari variabel region.

