-- CRIAR USUÁRIOS DO BANCO RENOFORMA
 
CREATE USER 'admin_renoforma'@'localhost'

IDENTIFIED BY 'Admin@123';
 
CREATE USER 'atendente_renoforma'@'localhost'

IDENTIFIED BY 'Atendente@123';
 
CREATE USER 'estoque_renoforma'@'localhost'

IDENTIFIED BY 'Estoque@123';
 
CREATE USER 'financeiro_renoforma'@'localhost'

IDENTIFIED BY 'Financeiro@123';
 
 
-- 1. ADMINISTRADOR

-- Acesso completo ao banco
 
GRANT ALL PRIVILEGES ON renoforma.*

TO 'admin_renoforma'@'localhost';
 
 
-- 2. ATENDENTE

-- Pode consultar clientes e cadastrar clientes e orçamentos
 
GRANT SELECT, INSERT, UPDATE ON renoforma.cliente

TO 'atendente_renoforma'@'localhost';
 
GRANT SELECT, INSERT, UPDATE ON renoforma.orcamento

TO 'atendente_renoforma'@'localhost';
 
GRANT SELECT, INSERT ON renoforma.item_servico

TO 'atendente_renoforma'@'localhost';
 
GRANT SELECT, INSERT ON renoforma.item_produto

TO 'atendente_renoforma'@'localhost';
 
 
-- 3. ESTOQUE

-- Pode consultar e atualizar produtos
 
GRANT SELECT, INSERT, UPDATE ON renoforma.produto

TO 'estoque_renoforma'@'localhost';
 
GRANT SELECT ON renoforma.item_pedido

TO 'estoque_renoforma'@'localhost';
 
 
-- 4. FINANCEIRO

-- Pode consultar pedidos e administrar pagamentos
 
GRANT SELECT ON renoforma.pedido

TO 'financeiro_renoforma'@'localhost';
 
GRANT SELECT, INSERT, UPDATE ON renoforma.pagamento

TO 'financeiro_renoforma'@'localhost';
 
 
-- ATUALIZAR PERMISSÕES

FLUSH PRIVILEGES;
 
 
-- CONSULTAR PERMISSÕES DOS USUÁRIOS
 
SHOW GRANTS FOR 'admin_renoforma'@'localhost';
 
SHOW GRANTS FOR 'atendente_renoforma'@'localhost';
 
SHOW GRANTS FOR 'estoque_renoforma'@'localhost';
 
SHOW GRANTS FOR 'financeiro_renoforma'@'localhost';