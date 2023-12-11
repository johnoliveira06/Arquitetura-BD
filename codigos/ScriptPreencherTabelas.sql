INSERT INTO "usuario" ("id", "nome", "email", "nascimento") VALUES
(1, 'João Gilberto', 'joao@gmail.com', '1998-05-26'),
(2, 'Elis Regina', 'elis@gmail.com', '1996-06-15'),
(3, 'Jorge Ben Jor', 'jorge@gmail.com', '1994-08-31'),
(4, 'Milton Nascimento', 'milton@gmail.com', '1990-01-09'),
(5, 'Chico Buarque', 'chico@gmail.com', '1996-07-03'),
(6, 'Cartola', 'cartola@gmail.com', '1999-10-10'),
(7, 'Tim Maia', 'tim@gmail.com', '1993-11-18'),
(8, 'Tom Jobim', 'tom@gmail.com', '1997-01-27')
;

INSERT INTO "endereco" ("id", "logradouro", "numero", "bairro", "cidade", "estado", "cep") VALUES
(1, 'Avenida Torres de Oliveira', '1246', 'Jardim Vitória', 'São José', 'SC', '12345-678'),
(2, 'Avenida Sargento Geraldo Santana', '1324', 'Portal do Guarujá', 'Londrina', 'PR', '56789-012'),
(3, 'Rua da Saudade', '1382', 'Barra Funda', 'Manaus', 'AM', '98765-432'),
(4, 'Avenida Lagoa Mirim', '216', 'Lago Norte', 'São Paulo', 'SP', '54321-876'),
(5, 'Rua dos Lirios', '2943', 'Vila Madalena', 'Curitiba', 'PR', '21098-765'),
(6, 'Avenida Felipe Lobo', '2341', 'Água Verde', 'Recife', 'PE', '87654-321'),
(7, 'Avenida dos Jasmins', '148', 'Batista Campos', 'Belém', 'PA', '34567-890'),
(8, 'Avenida Danton Jobim', '1532', 'Ipanema', 'Rio de Janeiro', 'RJ', '89012-345'),
(9, 'Rua Tenente Valmir Alcântara', '172', 'Cabula', 'Salvador', 'BA', '31845-561'),
(10, 'Rua Visconde Itaboray', '320', 'Amaralina', 'Belo Horizonte', 'MG', '51787-652'),
(11, 'Rua Angelina Garcia Avena', '55', 'Barreiras', 'Palmas', 'TO', '84191-483'),
(12, 'Avenida Gilson Fonseca', '653', 'São Caetano', 'Rio de Janeiro', 'RJ', '84713-348')
;

INSERT INTO "endereco_usuario" ("id", "usuario_id", "endereco_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 5, 9),
(10, 2, 10),
(11, 4, 11),
(12, 8, 12)
;

INSERT INTO "categoria_produto" ("id", "nome_categoria") VALUES
(1, 'Eletrônicos'),
(2, 'Moda'),
(3, 'Saúde e Beleza'),
(4, 'Esportes e Lazer'),
(5, 'Livros')
;

INSERT INTO "produto" ("id", "nome", "preco", "categoria_id") VALUES
(1, 'Smartphone', 799.99, 1),
(2, 'Notebook', 1299.99, 1),
(3, 'Câmera digital', 499.99, 1),
(4, 'Camiseta casual', 29.99, 2),
(5, 'Sapato de couro', 89.99, 2),
(6, 'Bolsa de couro', 69.99, 2),
(7, 'Kit de maquiagem', 39.99, 3),
(8, 'Secador de cabelo', 89.99, 3),
(9, 'Creme facial', 29.99, 3),
(10, 'Raquete de Tênis', 59.99, 4),
(11, 'Barraca para acampamento', 129.99, 4),
(12, 'Patins profissionais', 79.99, 4),
(13, 'O Pequeno Príncipe', 19.99, 5),
(14, 'Dom Quixote De La Mancha', 39.99, 5),
(15, 'Dom Casmurro', 14.99, 5)
;

INSERT INTO "estoque" ("id", "produto_id", "quantidade_estoque") VALUES
(1, 1, 50),
(2, 2, 20),
(3, 3, 25),
(4, 4, 30),
(5, 5, 24),
(6, 6, 63),
(7, 7, 56),
(8, 8, 26),
(9, 9, 35),
(10, 10, 48),
(11, 11, 16),
(12, 12, 20),
(13, 13, 32),
(14, 14, 36),
(15, 15, 29)
;
