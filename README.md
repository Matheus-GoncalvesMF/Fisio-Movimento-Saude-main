# Fisio-Movimento-Saude

##Sobre o Projeto
Este projeto consiste na implementação e manipulação de um banco de dados relacional para a clínica "Movimento & Saúde", focando na aplicação prática de comandos SQL (DML e DDL) e na garantia da integridade referencial dos dados. O projeto traduz um modelo lógico (desenvolvido nas etapas anteriores) para um banco de dados funcional, utilizando o PostgreSQL.

O objetivo principal é gerenciar o fluxo de trabalho da clínica, abrangendo o cadastro de pacientes, a criação de planos de tratamento, o agendamento de sessões e o registro da evolução clínica.

##Como Executar o Projeto
Para replicar e testar o ambiente do projeto, siga os passos abaixo:

###1. Pré-requisitos
Certifique-se de ter o PostgreSQL instalado em seu ambiente e uma ferramenta cliente, como o PGAdmin ou VS Code com extensão de SQL, configurada.

###2. Criação do Banco de Dados
Conecte-se ao seu servidor PostgreSQL (por exemplo, ao banco postgres padrão).
Execute a primeira parte do script DDL para criar o banco de dados.

###3. Criação das Tabelas
Conecte-se ao recém-criado banco de dados fisio_movimento_saude.
Execute o script ceates da pasta DDL completo (exceto criação do banco de dados) para criar todas as tabelas.

###4. População e Testes
Execute os scripts em DML para popular e testar o banco de dados:
inserts.sql: Contém comandos INSERT para popular as tabelas principais e criar um cenário de dados para testes.
selects.sql: Contém comandos SELECT que demonstram a manipulação de dados.
updates.sql: UPDATE e DELETE que demonstram a manipulação e a integridade dos dados.