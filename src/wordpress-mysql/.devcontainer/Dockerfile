# Accept build arguments from docker-compose.yml
ARG VARIANT="latest"
ARG INSTALL_NODE="false"

FROM wordpress:${VARIANT}

# Install Xdebug
RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

# Copy Xdebug configuration
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    default-mysql-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js if INSTALL_NODE is true
RUN if ["${INSTALL_NODE}" = "true"]; then \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs; \
    fi

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
