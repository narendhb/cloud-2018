## Soal NO 2
Analisa apa perbedaan antara ketiga algoritma tersebut.

#### Round-Robin
Algoritma ini akan digunakan untuk menjalankan load balancing seperti loop cycle, sesuai dengan urutan array IP yang didefinisikan pada server.

#### Least Connections
Algortima ini akan membagi pengakses kepada yang memiliki beban yang rendah. Tetapi akan memiliki masalah yang sama dengan Round Robin untuk session yang aktif.

### IP Hash
Algoritma ini algoritma yang akan membagi berdasarkan ditribusi IPnya. Sehingga 1 IP akan mengakses 1 server yang sama terus menerus sampai terjadi masalah misalnya server mati atau down akan di pindahkan ke server lain.