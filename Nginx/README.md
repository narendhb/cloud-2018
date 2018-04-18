## Tugas 2 Sesi Lab - Nginx

Buatlah sistem load balancing dengan 1 load balancer(nginx dan 2 worker(apache2), terapkan algoritma load balancing round-robin, least-connected, dan ip-hash.

Soal :

1. Buatlah Vagrantfile sekaligus provisioning-nya untuk menyelesaikan kasus.
2. Analisa apa perbedaan antara ketiga algoritma tersebut.
3. Biasanya pada saat membuat website, data user yang sedang login disimpan pada session. Sesision secara default tersimpan pada memory pada sebuah host. Bagaimana cara mengatasi masalah session ketika kita melakukan load balancing?