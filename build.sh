#!/bin/bash
set -e

DEBIAN_FRONTEND=noninteractive

useradd -c NFSEN -G www-data netflow

mkdir -p /var/www
ln -s /var/www/nfsen /var/www/html

apt-get -y install automake libtool libbz2-dev unzip build-essential flex bison rrdtool librrds-perl libmailtools-perl libsocket6-perl librrd-dev lighttpd php5-cgi php5-cli wget

lighttpd-enable-mod fastcgi-php

#php http?
#xdrum/nginx-extras

mkdir -p /build

cd /build
wget --no-check-certificate -O master.zip https://github.com/phaag/nfdump/archive/master.zip
unzip master.zip
cd  nfdump-master
./autogen.sh
# clean ugly mac files
#find . | grep "\\._" | xargs rm

./configure --enable-nfprofile --enable-sflow
make && make install

cd /build
wget http://sourceforge.net/projects/nfsen/files/stable/nfsen-1.3.8/nfsen-1.3.8.tar.gz
tar -xzf nfsen-1.3.8.tar.gz
cd nfsen-1.3.8
# clean ugly mac files
#find . | grep "\\._" | xargs rm


mkdir /data

