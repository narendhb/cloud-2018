1. Membuat sebuah Dockerfile image ini akan digunakan sebagai Worker.
 
 
 RUN apt-get update -y
RUN apt-get -y upgrade
RUN apt-get install -y libmysqlclient-dev python-dev python-pip build-essential libssl-dev libffi-dev
RUN apt-get install -y wget apt-utils zip python2.7 
RUN pip install --upgrade pip

# Download Web Reservasi lab yang dibuat menggunakan python flask
RUN wget https://cloud.fathoniadi.my.id/reservasi.zip 
RUN unzip reservasi.zip
RUN mv reservasi reservasi-flask

# Berpindah direktori 
WORKDIR reservasi-flask

# Install dependencies untuk web flask
RUN pip install -r req.txt

# Menjalankan python saat docker dijalankan
ENTRYPOINT ["python"]

# Menjalankan server.py
CMD ["server.py"]

# Port 80
EXPOSE 80

2. Build dengan menggunakan perintah

  docker build -t reservasi-flask-images ./
  
3.  Membuat sebuah file docker-compose.yml

version: '3.3'

services:
    db:
        image: mysql:5.7
        restart: always
        environment:
            MYSQL_ROOT_PASSWORD: buayakecil
            MYSQL_DATABASE: reservasi
            MYSQL_USER: userawan
            MYSQL_PASSWORD: buayakecil
        volumes:
            - ./reservasi:/docker-entrypoint-initdb.d
            - dbdata:/var/lib/mysql
        networks:
            ip-docker:
                ipv4_address: 10.5.5.5

    worker1:
        image: reservasi-flask-images
        depends_on:
            - db
        restart: always
        environment: 
            DB_HOST: 10.5.5.5
            DB_USERNAME: userawan
            DB_PASSWORD: buayakecil
            DB_NAME: reservasi
        networks:
            ip-docker:
                ipv4_address: 10.5.5.10

    worker2:
        image: reservasi-flask-images
        depends_on:
            - db
        restart: always
        environment: 
            DB_HOST: 10.5.5.5
            DB_USERNAME: userawan
            DB_PASSWORD: buayakecil
            DB_NAME: reservasi
        networks:
            ip-docker:
                ipv4_address: 10.5.5.11

    worker3:
        image: reservasi-flask-images
        depends_on:
            - db
        restart: always
        environment:
            DB_HOST: 10.5.5.5
            DB_USERNAME: userawan
            DB_PASSWORD: buayakecil
            DB_NAME: reservasi
        networks:
            ip-docker:
                ipv4_address: 10.5.5.12

    load-balancer:
        image: nginx:stable-alpine
        depends_on:
            - worker1
            - worker2
            - worker3
        volumes:
            - ./nginx.conf:/etc/nginx/conf.d/default.conf:ro
        ports:
            - 2000:80
        networks: 
            ip-docker:
                ipv4_address: 10.5.5.6

volumes:
    dbdata:

networks: 
    ip-docker:
        driver: bridge
        ipam: 
            config:
                - subnet: 10.5.5.0/24
Ket--> Membuat sebuah load balancer dan 3 buah worker menggunakan image yang tadi sudah di buat


4. Membuat configurasi untuk load-balancer yaitu nginx.conf
upstream worker {
    server 10.5.5.10;
    server 10.5.5.11;
    server 10.5.5.12;
}

server {
    listen  80 default_server;
    location / {
        proxy_pass http://worker;
    }
}

5. Jalankan docker-compose  up -d,lalu lakukan testin di browser localhot:2000
