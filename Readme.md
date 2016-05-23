# README #

Contenitore di Apache e PHP 5.6 per servire un sito basato su Laravel.

## Comandi ##

- docker build -t laraimage .
- docker run -d -v ~/Sites/laravel:/var/www/html -p 80:80 --name=lara laraimage