FROM php:5.6-apache

MAINTAINER Umberto Migliore <umigliore@nexusonline.it>

RUN apt-get update && apt-get install -y \
 git \
 libldap2-dev \
 libmcrypt-dev \
 zlib1g-dev 

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap mcrypt pdo_mysql mysql mysqli zip 
	
# Apache setup: enable mod_rewrite
RUN a2enmod rewrite

# Installa composer 
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Copia file e configurazioni
COPY php.ini /usr/local/etc/php/
COPY virtualhost.conf /etc/apache2/sites-enabled/

# si aspetta un run con -v
WORKDIR /var/www/html
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
