
--Atualizar a quantidade de produtos no estoque
CREATE OR REPLACE FUNCTION tg_atualizar_estoque()
RETURNS TRIGGER AS $$
BEGIN

    UPDATE estoque
    SET quantidade_estoque = quantidade_estoque - NEW.quantidade
    WHERE produto_id = NEW.produto_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER tg_atualizar_quantidade_estoque
AFTER INSERT ON itens_pedido
FOR EACH ROW
EXECUTE FUNCTION tg_atualizar_estoque();

-- Teste do trigger
--INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade) VALUES (6, 1, 1, 5);
--SELECT * FROM estoque WHERE produto_id = 1;

--Verificar se um novo usuário possui 18 anos ou mais
CREATE OR REPLACE FUNCTION tg_verificar_idade()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.nascimento > (current_date - interval '18 years') THEN
        RAISE EXCEPTION 'O usuário não possui 18 anos!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER tg_verificar_idade
BEFORE INSERT
ON usuario
FOR EACH ROW
EXECUTE FUNCTION tg_verificar_idade();


-- Teste do trigger
--INSERT INTO usuario (nome, email, nascimento) VALUES (9, 'Djavan', 'djavan@example.com', '2009-01-01');


--Calcular o total por pedido
CREATE OR REPLACE FUNCTION calcular_total_pedido(p_pedido_id INTEGER)
RETURNS DECIMAL(8, 2) AS $$
DECLARE
    total_pedido DECIMAL(8, 2);
BEGIN
    SELECT SUM(ip.quantidade * pr.preco) INTO total_pedido
    FROM itens_pedido ip
    JOIN produto pr ON ip.produto_id = pr.id
    WHERE ip.pedido_id = p_pedido_id;

    RETURN total_pedido;
END;
$$ LANGUAGE plpgsql;

--Teste da função
--SELECT calcular_total_pedido(1)

--Inserir um novo pedido
CREATE OR REPLACE FUNCTION inserir_pedido(
    usuario_id INTEGER,
    endereco_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER
)
RETURNS INTEGER AS $$
DECLARE
    novo_pedido INTEGER;
BEGIN
    INSERT INTO pedido("usuario_id", "endereco_id", "data", "status_pedido") VALUES (usuario_id, endereco_id, current_date, 'Em andamento')
    RETURNING id INTO novo_pedido;

    INSERT INTO itens_pedido(pedido_id, produto_id, quantidade) VALUES (novo_pedido, produto_id, quantidade);

    RETURN novo_pedido;

END;
$$ LANGUAGE plpgsql;

--Teste da função
--SELECT inserir_pedido(5, 9, 8, 4);