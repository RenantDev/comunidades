#!/bin/bash

# Corrigir finais de linha
echo "Corrigindo finais de linha..."
find . -type f -name "*.rb" -o -name "*.rake" | xargs sed -i "s/\r$//"
find ./bin -type f | xargs sed -i "s/\r$//"
sed -i "s/\r$//" config.ru
chmod +x ./bin/*

# Criar diretório para assets
echo "Criando diretório para assets..."
mkdir -p app/assets/builds
touch app/assets/builds/.keep

# Compilar assets do Tailwind
echo "Compilando assets do Tailwind..."
bin/rails tailwindcss:build

# Remover server.pid
echo "Removendo server.pid..."
rm -f tmp/pids/server.pid

# Preparar banco de dados
echo "Preparando banco de dados..."
bin/rails db:prepare

# Iniciar servidor Rails
echo "Iniciando servidor Rails..."
bin/rails server -b 0.0.0.0