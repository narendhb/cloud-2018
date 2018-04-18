#1
useradd awan -p $(echo buayakecil | openssl passwd -1 -stdin) -d /home/tempatawan -m

#2
sudo apt-get -y update
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
apt-get install -y esl-erlang
apt-get install -y elixir
yes | mix local.hex
yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
yes | mix phx.new /home/vagrant/hello2

#3

# install nginx
sudo apt-get -y -f install nginx
rm -f /etc/nginx/sites-enabled/*
ln -s /vagrant/pelatihan-laravel.conf /etc/nginx/sites-enabled
nginx -t
service nginx start

# install php
sudo apt-get -y -f install python-software-properties software-properties-common
sudo apt-add-repository -y ppa:ondrej/php
sudo apt-get -y -f install php7.2
sudo apt-get -y -f install php7.2-mysql php7.2-mbstring php7.2-tokenizer php7.2-xml php7.2-ctype php7.2-json
sudo apt-get -y -f install zip unzip

# install composer
curl 'https://getcomposer.org/installer' | php
sudo mv composer.phar /usr/local/bin/composer
composer global require "laravel/installer"

# install mysql
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password \"''\""
sudo debconf-set-selections <<<  "mysql-server mysql-server/root_password_again password \"''\""
sudo apt-get install -y -f mysql-server
mysql_install_db


# config project
cd /var/www/web
composer install

#4
sudo apt-get install -y squid
sudo apt-get install -y bind9
