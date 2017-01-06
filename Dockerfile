FROM kshenk/php:latest
MAINTAINER Kyle Shenk <k.shenk@gmail.com>

RUN yum --disablerepo='*' --enablerepo='remi-php56,remi,epel,base,updates' install -y php-fpm && \
    yum clean all

RUN mkdir -p /var/run/php-fpm

ENTRYPOINT /usr/sbin/php-fpm --nodaemonize -R

