FROM ruby:2.7

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    imagemagick \
    libpq-dev \
    git \
    nodejs \
    yarn \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /canvas

# Copiar archivos de la app
COPY . .

# Instalar gems
RUN bundle install

# Instalar dependencias de frontend
RUN yarn install

# Precompilar assets
RUN bundle exec rake canvas:compile_assets

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
