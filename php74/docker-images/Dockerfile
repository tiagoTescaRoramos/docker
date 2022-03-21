FROM php:7.4-fpm

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
		npm \
	&& docker-php-ext-configure gd --with-freetype=/usr/include/freetype --with-jpeg=/usr/include/ \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install pdo \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install intl \
	&& docker-php-ext-install opcache \
	&& docker-php-ext-install xml \
	&& docker-php-ext-install soap \
	&& docker-php-ext-install xsl \
	&& docker-php-ext-install zip \
	&& docker-php-ext-install json \
	&& docker-php-ext-install bcmath \
	&& docker-php-ext-install sockets \
	&& pecl install -f xdebug-2.9.8 \
	&& docker-php-ext-enable xdebug;

RUN docker-php-ext-install calendar && docker-php-ext-configure calendar;

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

##COMPOSER 1
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php  --version=1.10.22 \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/bin/composer1;

RUN curl -O https://files.magerun.net/n98-magerun2.phar \
	&& mv n98-magerun2.phar /usr/bin/n98 \
	&& chmod +x /usr/bin/n98;

ARG USERNAME

#set folder owner for composer cache
RUN useradd -m $USERNAME
RUN chown -R $USERNAME:$USERNAME /var/www/html/
USER $USERNAME

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

# change user
USER $USERNAME

# Magento cloud cli
RUN php -r "copy('https://accounts.magento.cloud/cli/installer', 'magento-cloud.php');" \
    && php magento-cloud.php \
    && rm magento-cloud.php;

# Make sure the volume mount point is empty
RUN rm -rf /var/www/html/*

CMD ["php-fpm"]
