-- 1. CLIENTE
INSERT INTO cliente
(cpf, nome, contato, rua, numero, bairro, cidade, estado, cep)
VALUES
('12345678900', 'Carlos Silva', '11987654321', 'Rua das Flores', '100', 'Centro', 'São Paulo', 'SP', '01000-000'),
('98765432100', 'Maria Oliveira', '11976543210', 'Rua Brasil', '250', 'Jardim Paulista', 'São Paulo', 'SP', '01400-000'),
('45678912300', 'João Santos', '11965432109', 'Avenida Central', '500', 'Vila Nova', 'Santo André', 'SP', '09000-000');

-- 2. ADMINISTRADOR
INSERT INTO administrador
(cpf_admin, nome, email, senha_hash, perfil, ativo, data_criacao)
VALUES
('11122233344', 'Yago Souza', 'yago@renoforma.com', 'hash_ficticio_123', 'administrador', TRUE, CURDATE()),
('55566677788', 'Ana Costa', 'ana@renoforma.com', 'hash_ficticio_456', 'atendente', TRUE, CURDATE());

-- 3. SERVICO
INSERT INTO servico
(nome, descricao, valor_inicial)
VALUES
('Reforma de cadeira', 'Reforma completa de cadeira corporativa', 250.00),
('Troca de rodinhas', 'Substituição das rodinhas da cadeira', 50.00),
('Troca de estofado', 'Substituição do revestimento e espuma', 120.00);

-- 4. PRODUTO
INSERT INTO produto
(nome, descricao, preco, quantidade_estoque, categoria)
VALUES
('Rodinha de cadeira', 'Rodinha giratória para cadeira corporativa', 25.00, 100, 'Peças'),
('Base de cadeira', 'Base metálica para cadeira de escritório', 90.00, 30, 'Peças'),
('Cadeira executiva', 'Cadeira corporativa com regulagem de altura', 650.00, 15, 'Cadeiras');

-- 5. ORCAMENTO
INSERT INTO orcamento
(cpf, cpf_admin, data_solicitacao, valor, status, descricao)
VALUES
('12345678900', '11122233344', CURDATE(), 300.00, 'aprovado', 'Reforma de cadeira e troca de rodinhas'),
('98765432100', '55566677788', CURDATE(), 120.00, 'pendente', 'Troca de estofado'),
('45678912300', '11122233344', CURDATE(), 650.00, 'aprovado', 'Compra de cadeira executiva');

-- 6. ITEM_SERVICO
INSERT INTO item_servico
(id_servico, id_orcamento, quantidade, valor_unitario)
VALUES
(1, 1, 1, 250.00),
(2, 1, 1, 50.00),
(3, 2, 1, 120.00);

-- 7. ITEM_PRODUTO
INSERT INTO item_produto
(id_produto, id_orcamento, quantidade, preco_unitario)
VALUES
(1, 1, 2, 25.00),
(3, 3, 1, 650.00);

-- 8. PEDIDO
INSERT INTO pedido
(cpf, id_orcamento, cpf_admin, data_pedido, status, valor_total)
VALUES
('12345678900', 1, '11122233344', CURDATE(), 'em_producao', 300.00),
('45678912300', 3, '11122233344', CURDATE(), 'pendente', 650.00),
('98765432100', NULL, '55566677788', CURDATE(), 'concluido', 150.00);

-- 9. ITEM_PEDIDO
INSERT INTO item_pedido
(id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 2, 25.00),
(2, 3, 1, 650.00),
(3, 2, 1, 90.00);

-- 10. PAGAMENTO
INSERT INTO pagamento
(id_pedido, valor, status, forma_pagamento, data_pagamento)
VALUES
(1, 300.00, 'confirmado', 'pix', CURDATE()),
(2, 650.00, 'pendente', 'cartao_credito', NULL),
(3, 150.00, 'confirmado', 'dinheiro', CURDATE());