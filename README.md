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
- "sort -gk2" digunakan untuk mengurutkan array dari yang terkecil ke terbesar berdasarkan nilai dari arry tersebut. __-g__ karena profit bertipe data float. kemudian __k2__ karena profit ada di kolom kedua.
- lalu di pipe dan awk lagi untuk memasukkan baris pertama ke dalam "region".
- yang terakhir adalah menampilkan isi dari variabel region.

#### 1b.
     states=`awk -v r=$region -F '\t' 'NR>1 { if(match($13, r)) states[$11]+=$21} END { for ( j in states) print states[j], j | "sort -gk1" }' Sample-Superstore.tsv | awk 'NR<3 {print $2}'`
     printf "2 State dengan profit terkecil adalah : \n$states\n"

- Logika yang digunakan sama dengan nomor 1a hanya saja menambahkan __match__ untuk tabel ke 13 dan 11. Logikanya adalah, jika tabel 13 yaitu state isinya sama seperti hasil output di 1a, maka tabel states nya akan dimasukkan ke dalam array. Jadi, isi dari array adalah state yang berada dalam region sesuai dengan output 1a beserta nilai/besar profitnya.
- kemudian menggunakan __NR<3__ karena output yang akan ditampilkan adalah 2 yang paling kecil atau 2 teratas.

#### 1c.
     states1=`echo $states | awk '{print $1}'`
     states2=`echo $states | awk '{print $2}'`
     printf "\n\n"
     echo "10 Produk dengan profit terdikit dari state $states1 :"
     awk -v s=$states1 -F '\t' 'NR>1 { if(match($11, s)) produk[$17]+=$21} END { for ( k in produk) print produk[k], k | "sort -gk1" }' Sample-Superstore.tsv | awk 'NR<11 {$1=""; print $0}'
     printf "\n\n"
     echo "10 Produk dengan profit terdikit dari state $states2 :"
     awk -v s=$states2 -F '\t' 'NR>1 { if(match($11, s)) produk[$17]+=$21} END { for ( k in produk) print produk[k], k | "sort -gk1" }' Sample-Superstore.tsv | awk 'NR<11 {$1=""; print $0}'

- Output yang diminta adalah 10 produk dengan profit terkecil dari masing-masing state, jadi total produknya ada 20
- Dua state dengan profit terkecil yang telah didapat dari nomor 1b, dimasukkan ke dalam variabel __states1__ dan __states2__.
- Logika yang digunakan sama dengan nomor sebelumnya, yaitu 1a dan 1b dengan menggunakan __match__
- __NR<11__ digunakan untuk menampilkan 10 baris teratas, karena yang diminta hanya 10 produk
- __$1=""__ digunakan untuk menghilangkan kolom pertama yang berisi nilai profit (angka)
- __print $0__ digunakan untuk menampilkan semua isi dari kolom yang ada

![](soal1/shift1.png)

# Nomor 2

Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
tersebut cepat diselesaikan. Idenya adalah kalian (a) membuat sebuah script bash yang
dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka. (b) Password acak tersebut disimpan pada file berekstensi
.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di
enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal:
password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt
dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula
seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28,
maka akan menjadi huruf b.) dan (d) jangan lupa untuk membuat dekripsinya supaya
nama file bisa kembali.

HINT: enkripsi yang digunakan adalah caesar cipher.

*Gunakan Bash Script

#### Link code soal 1 :

##### Soal 2a dan 2b : [shift2ab.sh](https://github.com/bawangcode/SoalShiftSISOP20_modul1_T19/blob/master/soal2/shift2ab.sh)

##### Soal 2c : [shift2c.sh](https://github.com/bawangcode/SoalShiftSISOP20_modul1_T19/blob/master/soal2/shift2c.sh)

##### Soal 2d : [shift2d.sh](https://github.com/bawangcode/SoalShiftSISOP20_modul1_T19/blob/master/soal2/shift2d.sh)

jawaban :

#### 2a dan 2b

     #!/bin/bash
     
     cat /dev/urandom | tr -dc '0-9 A-Z a-z' | fold -w 28 | head -n 1 | sed 's/ //g' > `echo $1 | tr -dc 'A-Z a-z'`.txt





