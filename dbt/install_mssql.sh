#!/bin/bash

# Atualizar repositórios
apt-get update

# Instalar dependências
apt-get install -y curl apt-transport-https gnupg

# Adicionar chave Microsoft
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Adicionar repositório Microsoft
curl https://packages.microsoft.com/config/debian/10/prod.list | tee /etc/apt/sources.list.d/mssql-release.list

# Atualizar repositórios após adicionar o repositório Microsoft
apt-get update

# Instalar msodbcsql18
ACCEPT_EULA=Y apt-get install -y msodbcsql18

# Instalar dependências ODBC
apt-get install -y unixodbc unixodbc-dev odbcinst

pip install dbt-sqlserver
