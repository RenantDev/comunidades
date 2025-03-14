# Comunidades

Este README documenta os passos necessários para configurar e executar a aplicação.

## Requisitos

* Ruby versão: ruby 3.1.6
* Sistema de gerenciamento de pacotes: Bundler
* Banco de dados: PostgreSQL

## Dependências do Sistema

* Docker
* Docker Compose

## Configuração

1. Clone o repositório:
    ```sh
    git clone git@github.com:chorume-dev/comunidades.git
    cd comunidades
    ```

2. Instale as dependências:
    ```sh
    bundle install
    ```

3. Configure as variáveis de ambiente:
    ```sh
    cp .env.example .env
    ```

## Criação do Banco de Dados

1. Crie e migre o banco de dados:
    ```sh
    rails db:create db:migrate
    ```

## Inicialização do Banco de Dados

1. Popule o banco de dados com dados iniciais (se aplicável):
    ```sh
    rails db:seed
    ```

2. Acesse a aplicação em `http://localhost:3000`

