DROP DATABASE IF EXISTS renoforma;
CREATE DATABASE renoforma;
USE renoforma;

SELECT DATABASE();

CREATE TABLE cliente (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    contato VARCHAR(11),
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2),
    cep VARCHAR(9)
);

CREATE TABLE administrador (
    cpf_admin VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha_hash VARCHAR(255),
    perfil VARCHAR(30),
    ativo BOOLEAN,
    data_criacao DATE
);

CREATE TABLE servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    valor_inicial DECIMAL(10,2)
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10,2),
    quantidade_estoque INT,
    categoria VARCHAR(100)
);

CREATE TABLE orcamento (
    id_orcamento INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11),
    cpf_admin VARCHAR(11),
    data_solicitacao DATE,
    valor DECIMAL(10,2),
    status VARCHAR(100),
    descricao TEXT,

    FOREIGN KEY (cpf) REFERENCES cliente (cpf),
    FOREIGN KEY (cpf_admin) REFERENCES administrador (cpf_admin)
);

CREATE TABLE item_servico (
    id_item_servico INT AUTO_INCREMENT PRIMARY KEY,
    id_servico INT,
    id_orcamento INT,
    quantidade INT,
    valor_unitario DECIMAL(10,2),

    FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
    FOREIGN KEY (id_orcamento) REFERENCES orcamento (id_orcamento)
);

CREATE TABLE item_produto (
    id_item_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_orcamento INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),

    FOREIGN KEY (id_produto) REFERENCES produto (id_produto),
    FOREIGN KEY (id_orcamento) REFERENCES orcamento (id_orcamento)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11),
    cpf_admin VARCHAR(11),
    id_orcamento INT,
    data_pedido DATE,
    status VARCHAR(30),
    valor_total DECIMAL(10,2),

    FOREIGN KEY (cpf) REFERENCES cliente (cpf),
    FOREIGN KEY (id_orcamento) REFERENCES orcamento (id_orcamento),
    FOREIGN KEY (cpf_admin) REFERENCES administrador (cpf_admin)
);

CREATE TABLE item_pedido (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),

    FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    valor DECIMAL(10,2),
    status VARCHAR(30),
    forma_pagamento VARCHAR(30),
    data_pagamento DATE,

    FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);


