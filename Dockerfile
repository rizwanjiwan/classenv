FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
#apt installs
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2
RUN apt-get install -y mysql-server
RUN apt-get install -y php
RUN apt-get install -y php-mysql
RUN apt-get install -y php-bcmath
RUN apt-get install -y libapache2-mod-php
RUN apt-get install -y php-curl
RUN apt-get install -y php-json
RUN apt-get install -y php-common
RUN apt-get install -y php-mbstring
RUN apt-get install -y php-dom
RUN apt-get install -y php-zip
RUN apt-get install -y php-imap
RUN apt-get install -y php-imagick
RUN apt-get install -y php-gd
RUN apt-get install -y composer
RUN apt-get -y install cron
RUN apt-get install -y software-properties-common
#install app on image
WORKDIR /app

#config mysql
RUN rm /etc/mysql/mysql.conf.d/mysqld.cnf
COPY dockerfiles/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

#setup apache:
#part 1, get ssl certs/keys setup
COPY dockerfiles/apache-selfsigned.crt /etc/ssl/certs/apache-selfsigned.crt
COPY dockerfiles/apache-selfsigned.key  /etc/ssl/private/apache-selfsigned.key
COPY dockerfiles/dhparam.pem /etc/ssl/certs/dhparam.pem
COPY dockerfiles/ssl-params.conf /etc/apache2/conf-available/ssl-params.conf
#part 2, put in the config files
RUN rm /etc/apache2/sites-available/000-default.conf
COPY dockerfiles/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm /etc/apache2/sites-available/default-ssl.conf
COPY dockerfiles/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

#part 3 enable and apache site/module
WORKDIR /etc/apache2/sites-available/
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers
RUN a2ensite default-ssl
RUN a2enconf ssl-params

#open ports on host
EXPOSE 80
EXPOSE 443
EXPOSE 3306

#setup supervisor file
#RUN mv /etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf.old
#RUN cp /app/dockerfiles/supervisord.conf /etc/supervisor
#go!
WORKDIR /app/

ENTRYPOINT apachectl -D FOREGROUND