#!/bin/bash

# process config and install

if [ ! -f /config/nfsen.conf ]
then
  cp /nfsen.conf /config/nfsen.conf
fi

cd /build/nfsen-1.3.8
ldconfig
echo | ./install.pl /config/nfsen.conf

# start nfsen

/usr/local/nfsen/bin/nfsen start

# start httpd

/etc/init.d/lighttpd start

# setup web

ln -s nfsen.php /var/www/nfsen/index.php
rm -rf /var/www/html
ln -s /var/www/nfsen /var/www/html

# block
sleep infinity
