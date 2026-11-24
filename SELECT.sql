-- 1. LISTAR CLIENTES

SELECT

    cpf,

    nome,

    contato,

    cidade,

    estado

FROM cliente

ORDER BY nome ASC;
 
 
-- 2. LISTAR ADMINISTRADORES ATIVOS

SELECT

    cpf_admin,

    nome,

    email,

    perfil

FROM administrador

WHERE ativo = TRUE

ORDER BY nome ASC;
 
 
-- 3. LISTAR SERVIÇOS DISPONÍVEIS

SELECT

    id_servico,

    nome,

    descricao,

    valor_inicial

FROM servico

ORDER BY nome ASC;
 
 
-- 4. CONSULTAR PRODUTOS EM ESTOQUE

SELECT

    id_produto,

    nome,

    categoria,

    preco,

    quantidade_estoque

FROM produto

WHERE quantidade_estoque > 0

ORDER BY nome ASC;
 
 
-- 5. CONSULTAR ORÇAMENTOS

SELECT

    id_orcamento,

    cpf,

    cpf_admin,

    data_solicitacao,

    valor,

    status

FROM orcamento

ORDER BY data_solicitacao DESC;
 
 
-- 6. CONSULTAR ORÇAMENTOS PENDENTES

SELECT

    id_orcamento,

    cpf,

    valor,

    data_solicitacao

FROM orcamento

WHERE status = 'pendente'

ORDER BY data_solicitacao ASC;
 
 
-- 7. CONSULTAR PEDIDOS

SELECT

    id_pedido,

    cpf,

    data_pedido,

    status,

    valor_total

FROM pedido

ORDER BY data_pedido DESC;
 
 
-- 8. CONSULTAR PEDIDOS EM PRODUÇÃO

SELECT

    id_pedido,

    cpf,

    status,

    valor_total

FROM pedido

WHERE status = 'em_producao';
 
 
-- 9. CONSULTAR PAGAMENTOS CONFIRMADOS

SELECT

    id_pagamento,

    id_pedido,

    valor,

    forma_pagamento,

    data_pagamento

FROM pagamento

WHERE status = 'confirmado'

ORDER BY data_pagamento DESC;
 
 
-- 10. CONSULTAR PAGAMENTOS PENDENTES

SELECT

    id_pagamento,

    id_pedido,

    valor,

    forma_pagamento

FROM pagamento

WHERE status = 'pendente';