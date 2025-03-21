FROM ruby:3.1.6-slim

# Instala pacotes necessários
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libpq-dev \
    postgresql-client \
    nodejs \
    curl \
    libvips \
    pkg-config && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY Gemfile Gemfile.lock ./

# Instala as gems
RUN bundle install

# Copia o código-fonte
COPY . .

# Cria diretórios necessários
RUN mkdir -p tmp/pids

# Garante que o script entrypoint.sh é executável
RUN chmod +x entrypoint.sh

# Expõe a porta 3000
EXPOSE 3000

# Define o comando de entrada
CMD ["./entrypoint.sh"]
