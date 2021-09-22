FROM php:5.6-fpm

# Install
RUN buildDeps=" \
        libpng-dev \
        libjpeg-dev \
        libmcrypt-dev \
        libxml2-dev \
        libfreetype6-dev \
        libicu-dev \
        g++ \
        procps \
        golang-go \
        git-core \
        vim \
        unzip \
        openssh-server \
    "; \
    set -x \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/*

### Install Mailhog
ENV GOPATH /tmp
RUN cd /tmp
RUN go get github.com/mailhog/mhsendmail
RUN cd /tmp/src/github.com/mailhog/mhsendmail/ && go build
RUN cp /tmp/src/github.com/mailhog/mhsendmail/mhsendmail /usr/local/bin

#PHP EXTENSIONS
RUN docker-php-ext-configure \
    gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir \
    && docker-php-ext-install \
    gd \
    mbstring \
    mysqli \
    mcrypt \
    pdo_mysql \
    soap \
    zip \
    intl \
    bcmath \
    && cd /tmp/ && git clone https://github.com/derickr/xdebug.git \
    && cd xdebug && git checkout tags/XDEBUG_2_2_2 \
    && phpize && ./configure --enable-xdebug && make \
    && mkdir /usr/lib/php/ && cp modules/xdebug.so /usr/lib/php/xdebug.so \
    && touch /usr/local/etc/php/ext-xdebug.ini \
    && rm -r /tmp/xdebug

#REDIS
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir /usr/src/php \
    && mkdir /usr/src/php/ext \
    && mv phpredis-2.2.7 /usr/src/php/ext/redis \
    && docker-php-ext-install redis

# Configure
COPY php.ini /usr/local/etc/php/php.ini
COPY php-fpm.conf /usr/local/etc/
COPY ext-xdebug.ini /usr/local/etc/php/conf.d/ext-xdebug.ini

##COMPOSER
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/bin/composer

#N98
RUN php -r "copy('https://files.magerun.net/n98-magerun-1.103.3.phar', 'n98-magerun.phar');" \
    && mv n98-magerun.phar /usr/bin/n98 \
    && chmod +x /usr/bin/n98

#set folder owner for composer cache
RUN useradd -m tiago \
    && chown -R tiago:tiago /var/www/

USER tiago

RUN composer config --global process-timeout 1500
RUN composer config --global repo.packagist composer https://packagist.org

# PHPCS
RUN composer global require zifius/magizendo
USER root
RUN ln -s /home/tiago/.composer/vendor/bin/phpcs /usr/local/bin
USER tiago
RUN phpcs --config-set installed_paths /home/tiago/.composer/vendor/zifius/magizendo/ \
    && phpcs --config-set default_standard Magento1

# Make sure the volume mount point is empty
RUN rm -rf /var/www/html/*
