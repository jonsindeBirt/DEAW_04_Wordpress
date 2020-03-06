FROM ubuntu:18.04
RUN apt-get update && apt-get install -y apache2 \
    && apt-get -y install libapache2-mod-fcgid \
    && apt-get -y install git \
    && a2enmod proxy_fcgi 

COPY 000-default.conf /etc/apache2/sites-available
COPY /Wordpress/ /var/www/html/Wordpress
COPY dwes.css /var/www/html
COPY index.php /var/www/html
RUN chown www-data /var/www/html -R \
    && chown .www-data /var/www/html -R
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]