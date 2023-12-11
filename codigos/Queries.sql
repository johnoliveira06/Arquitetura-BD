--Listar pedidos feitos pelos usuários
SELECT 
    u.nome, 
    pe.id AS pedido_id, 
    pe.data AS pedido_data
FROM pedido pe
JOIN usuario u ON pe.usuario_id = u.id
WHERE pe.usuario_id = u.id;

--Listar as vendas realizadas em um determinado período
SELECT
    pe.id AS pedido_id,
    u.nome AS nome_usuario,
    e.logradouro AS endereco_entrega,
    pe.data AS data_pedido,
    SUM(ip.quantidade * pr.preco) AS total_pedido
FROM pedido pe
JOIN usuario u ON pe.usuario_id = u.id
JOIN endereco_usuario eu ON pe.endereco_id = eu.id
JOIN endereco e ON eu.endereco_id = e.id
JOIN itens_pedido ip ON pe.id = ip.pedido_id
JOIN produto pr ON ip.produto_id = pr.id
WHERE pe.data BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY pe.id, u.nome, e.logradouro, pe.data;

--Listar os produtos mais vendidos em um determinado período
SELECT
    pr.id AS produto_id,
    pr.nome AS nome_produto,
    SUM(ip.quantidade) AS total_vendido,
    e.quantidade_estoque AS estoque_atual
FROM produto pr
JOIN itens_pedido ip ON pr.id = ip.produto_id
JOIN estoque e ON pr.id = e.produto_id
JOIN pedido pe ON ip.pedido_id = pe.id
WHERE pe.data BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY pr.id, pr.nome, e.quantidade_estoque
ORDER BY total_vendido DESC;




