FROM php:7.2-fpm-alpine

ARG BUILD_ARGUMENT_ENV=prod
ENV ENV=$BUILD_ARGUMENT_ENV
RUN mkdir /app
ENV APP_HOME /app

# Copy composer.lock and composer.json
COPY composer.lock composer.json /app/

# Set working directory
WORKDIR $APP_HOME

# install extensions
# intl, zip, soap
RUN apk add --update --no-cache libintl icu icu-dev libxml2-dev \
    && docker-php-ext-install intl zip soap

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow vim curl \
    php7 \
    php7-fpm \
    php7-common \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-gd \
    php7-dom \
    php7-session \
    php7-zlib \
    supervisor

# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql

RUN apk --update add --virtual build-dependencies build-base openssl-dev autoconf \
  && pecl install mongodb \
  && docker-php-ext-enable mongodb \
  && pecl install redis \
  && docker-php-ext-enable redis \
  && apk del build-dependencies build-base openssl-dev autoconf \
  && rm -rf /var/cache/apk/*

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Remove Cache
RUN rm -rf /var/cache/apk/*

# install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1

# add supervisor
RUN mkdir -p /var/log/supervisor
COPY --chown=root:root ./docker/general/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY --chown=root:root ./docker/general/cron /var/spool/cron/crontabs/root
RUN chmod 0600 /var/spool/cron/crontabs/root

# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . $APP_HOME
COPY --chown=www-data:www-data .env.$ENV $APP_HOME/.env

# Change current user to www
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

USER root
