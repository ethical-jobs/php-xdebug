FROM php:7.2-cli-alpine
RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
  && pecl install xdebug \
  && docker-php-ext-install pcntl pdo pdo_mysql \
  && docker-php-ext-enable xdebug pdo pdo_mysql \
  && apk del pcre-dev ${PHPIZE_DEPS}
COPY --from=composer:1.5 /usr/bin/composer /usr/bin/composer
