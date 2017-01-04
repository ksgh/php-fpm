FROM centos:7
MAINTAINER Kyle Shenk <k.shenk@gmail.com>

RUN yum install -y epel-release && \
    yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum install -y libvpx

RUN yum --disablerepo='*' --enablerepo='remi-php56,remi,epel,base' install -y \
    php \
    php-bcmath \
    php-cli \
    php-common \
    php-devel \
    php-gd \
    php-imap \
    php-intl \
    php-ldap \
    php-mbstring \
    php-mcrypt \
    php-mysqlnd \
    php-opcache \
    php-pdo \
    php-pear \
    php-pecl-imagick \
    php-pecl-memcache \
    php-pecl-memcached \
    php-pecl-mongo \
    php-pecl-mongodb \
    php-pecl-solr2 \
    php-pgsql \
    php-process \
    php-soap \
    php-tidy \
    php-xml \
    php-xmlrpc && \

    yum --disablerepo='*' --enablerepo='remi-php56,remi,epel,base,updates' install -y php-fpm

RUN mkdir -p /var/run/php-fpm

ENTRYPOINT /usr/sbin/php-fpm --nodaemonize -R
