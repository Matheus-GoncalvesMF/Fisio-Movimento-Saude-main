CREATE DATABASE fisio_movimento_saude
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE PACIENTE (
    paciente_ID SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    rua VARCHAR(150) NOT NULL,
    numero VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(10));

CREATE TABLE FISIOTERAPEUTA (
    fisio_CREFITO VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    especialidade VARCHAR(100));

CREATE TABLE TECNICA (
    tecnica_ID SERIAL PRIMARY KEY,
    nome_tecnica VARCHAR(100) UNIQUE NOT NULL,
    descricao_tecnica TEXT,
    custo_padrao DECIMAL(10, 2));

CREATE TABLE PLANO_TRATAMENTO (
    plano_ID SERIAL PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_previsao_fim DATE,
    objetivo_geral TEXT,
    num_total_sessoes INT NOT NULL,
    paciente_ID INT NOT NULL,
    fisio_CREFITO VARCHAR(15) NOT NULL,
    
    FOREIGN KEY (paciente_ID) REFERENCES PACIENTE(paciente_ID) ON DELETE RESTRICT,
    FOREIGN KEY (fisio_CREFITO) REFERENCES FISIOTERAPEUTA(fisio_CREFITO) ON DELETE RESTRICT);

CREATE TABLE PLANO_TECNICA (
    plano_ID INT NOT NULL,
    tecnica_ID INT NOT NULL,
    
    PRIMARY KEY (plano_ID, tecnica_ID), 
    FOREIGN KEY (plano_ID) REFERENCES PLANO_TRATAMENTO(plano_ID) ON DELETE CASCADE, 
    FOREIGN KEY (tecnica_ID) REFERENCES TECNICA(tecnica_ID) ON DELETE RESTRICT);

CREATE TABLE SALA (
    sala_ID SERIAL PRIMARY KEY,
    nome_sala VARCHAR(50) UNIQUE NOT NULL,
    capacidade_maxima INT NOT NULL);

CREATE TYPE status_sessao AS ENUM (
    'Agendada',
    'Realizada',
    'Cancelada');

CREATE TABLE SESSAO (
    sessao_ID SERIAL PRIMARY KEY,
    data_sessao DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME,
    status status_sessao NOT NULL,
    plano_ID INT NOT NULL,
    sala_ID INT,
    
    FOREIGN KEY (plano_ID) REFERENCES PLANO_TRATAMENTO(plano_ID) ON DELETE RESTRICT,
    FOREIGN KEY (sala_ID) REFERENCES SALA(sala_ID) ON DELETE SET NULL);

CREATE TABLE EVOLUCAO (
    evolucao_ID INT NOT NULL, 
    data_registro TIMESTAMP NOT NULL,
    anotacoes_fisioterapeuta TEXT NOT NULL,
    nivel_dor INT CHECK (nivel_dor >= 0 AND nivel_dor <= 10),
    sessao_ID INT PRIMARY KEY, 
    
    FOREIGN KEY (sessao_ID) REFERENCES SESSAO(sessao_ID) ON DELETE CASCADE);