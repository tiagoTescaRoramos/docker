FROM php:8.1.3-fpm

RUN apt-get update && apt-get install -y --allow-unauthenticated \
		pkg-config \
		libmcrypt-dev  \
		libicu-dev \
		libfreetype6-dev \
		libpng-dev \
		libzip-dev \
		libmcrypt-dev \
		libxml2-dev \
		libxslt-dev \
		procps \
		libjpeg62-turbo-dev \
		g++ \
        golang-go \
        git-core \
        vim \
        cron \
		nodejs \
		npm;
RUN docker-php-ext-configure gd --with-freetype=/usr/include/freetype --with-jpeg=/usr/include/;
RUN docker-php-ext-install gd;
RUN docker-php-ext-install pdo;
RUN docker-php-ext-install mysqli;
RUN docker-php-ext-install pdo_mysql;
RUN docker-php-ext-install intl;
RUN docker-php-ext-install opcache;
RUN docker-php-ext-install xml;
RUN docker-php-ext-install soap;
RUN docker-php-ext-install xsl;
RUN docker-php-ext-install zip;
RUN docker-php-ext-install bcmath;
RUN docker-php-ext-install sockets;
RUN pecl install -f xdebug;
RUN docker-php-ext-enable xdebug;

### Install Mailhog
ENV GOPATH /tmp
RUN cd /tmp
RUN go get github.com/mailhog/mhsendmail
RUN cd /tmp/src/github.com/mailhog/mhsendmail/ && go build
RUN cp /tmp/src/github.com/mailhog/mhsendmail/mhsendmail /usr/local/bin

# Configure
COPY php.ini /usr/local/etc/php/php.ini
COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY php-fpm.conf /usr/local/etc/
COPY xdebug.ini /usr/local/etc/php/conf.d/ext-xdebug.ini

#COMPOSER
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && rm composer-setup.php \
    && mv composer.phar /usr/bin/composer;

RUN curl -O https://files.magerun.net/n98-magerun2.phar \
	&& mv n98-magerun2.phar /usr/bin/n98 \
	&& chmod +x /usr/bin/n98;

#set folder owner for composer cache
RUN useradd -m ttescaro
RUN chown -R ttescaro:ttescaro /var/www/html/
USER ttescaro

RUN composer config --global process-timeout 1500
RUN composer config --global repo.packagist composer https://packagist.org

# PHPCS
RUN composer global require squizlabs/php_codesniffer
USER root
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
RUN chmod +x phpcs.phar
RUN mv phpcs.phar /usr/local/bin/phpcs
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
RUN chmod +x phpcbf.phar
RUN mv phpcbf.phar /usr/local/bin/phpcbf
USER ttescaro

RUN curl -sS https://accounts.magento.cloud/cli/installer | php

# Make sure the volume mount point is empty
RUN rm -rf /var/www/html/*

CMD ["php-fpm"]
