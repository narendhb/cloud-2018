## Soal NO 3
Biasanya pada saat membuat website, data user yang sedang login disimpan pada session. Sesision secara default tersimpan pada memory pada sebuah host. Bagaimana cara mengatasi masalah session ketika kita melakukan load balancing?

### Jawab
Adalah Sebuah metode yang digunakan untuk aplikasi load balancing. Router atau load balancer dapat menetapkan satu server ke pengguna tertentu, berdasarkan sesi HTTP atau alamat IP mereka. Server yang ditetapkan diingat oleh router untuk jangka waktu tertentu, memastikan bahwa semua permintaan masa depan untuk sesi yang sama dikirim ke server yang sama.