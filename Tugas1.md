Tugas 1 Cloud 

    Kelompok
    Narendra Haryo Bismo    5115100009
    Zahri Rusli             5115100108 
    
    
    [Komputasi Awan – Vagrant]

1.	Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'.
    	- Buat file provisioning terlebih dahulu. Dalam pengerjaan ini, kami memasukkan perintah
	Nano task.sh
					
   	 - Masukkan syntax untuk membuat user “awan” dan password “buayakecil” : 
    		useradd awan -p $(echo buayakecil | openssl passwd -1 -stdin) -d /home/awankecil -m
    	- Simpan file task.sh
	
   	 - Jalankan perintah :
					vagrant provision
					vagrant up
					vagrant ssh
				
  	 - Lalu masukkan perintah untuk login menggunakan user "awan:
		su awan | Kemudian masukan password buaya kecil

2.	- Buka file task.sh, lalu tambahkan perintah untuk menginstall Erlang/OTP platform (bahasa) dan Phoenix:
	
		sudo apt-get -y update
		#Menda[atkan packages dan install elixir dan erlang
		wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
		apt-get install -y esl-erlang
		apt-get install -y elixir
		#Install Poenix dan add repository
		yes | mix local.hex
		yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
		yes | mix phx.new /home/vagrant/hello2
							
	- Simpan file task.sh	
	- Jalankan perintah :
				vagrant provision
				vagrant up
				vagrant ssh	

3.	Buat vagrant virtualbox dan lakukan provisioning install:
		1.	php
		2.	mysql
		3.	composer
		4.	nginx
		----------
		#4 Install NGINX
  		- Buka file task.sh, lalu tambahkan perintah berikut untuk menginstall Nginx:
					# install nginx
					sudo apt-get install -y -f nginx
					service nginx start
					
 		- Simpan file task.sh
		
		- Jalankan perintah :
					vagrant provision
					vagrant up
					vagrant ssh
		
		- Untuk memastikan apakah nginx sudah terinstall, buka localhost:port pada browser. Jika muncul kalimat "Welcome to nginx!", berarti nginx berhasil terinstall

4. Buat vagrant virtualbox dan lakukan provisioning install:
    1.	Squid proxy
    2.	Bind9
		
- Buka file task.sh, lalu ketikkan perintah berikut untuk menginstall Squid proxy dan Bind9:
					# install squid proxy
					apt-get install -y -f squid

					# install bind9
					apt-get install -y -f bind9
					
	- Simpan file task.sh	
	- Jalankan perintah :
					vagrant provision
