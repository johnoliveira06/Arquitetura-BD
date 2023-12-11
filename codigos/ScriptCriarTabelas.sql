DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS endereco_usuario;
DROP TABLE IF EXISTS estoque;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS categoria_produto;
DROP TABLE IF EXISTS endereco;
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario(
    "id" INTEGER NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "nascimento" DATE NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE endereco(
    "id" INTEGER NOT NULL,
    "logradouro" VARCHAR(255) NOT NULL,
    "numero" VARCHAR(255) NOT NULL,
    "bairro" VARCHAR(255) NOT NULL,
    "cidade" VARCHAR(255) NOT NULL,
    "estado" VARCHAR(255) NOT NULL,
    "cep" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE endereco_usuario(
    "id" INTEGER NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "endereco_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT fk_usuario_endereco_usuario
    FOREIGN KEY ("usuario_id")
    REFERENCES "usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_endereco_endereco_usuario
    FOREIGN KEY ("endereco_id")
    REFERENCES "endereco"("id") ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE categoria_produto(
    "id" INTEGER NOT NULL,
    "nome_categoria" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE produto(
    "id" INTEGER NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "preco" DECIMAL(8, 2) NOT NULL,
    "categoria_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT fk_categoria_produto
    FOREIGN KEY ("categoria_id")
    REFERENCES "categoria_produto"("id") ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE estoque(
    "id" INTEGER NOT NULL,
    "produto_id" INTEGER NOT NULL,
    "quantidade_estoque" INTEGER NOT NULL,
    CONSTRAINT fk_produto_estoque
    FOREIGN KEY ("produto_id")
    REFERENCES "produto"("id") ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE pedido(
    "id" SERIAL PRIMARY KEY,
    "usuario_id" INTEGER NOT NULL,
    "endereco_id" INTEGER NOT NULL,
    "data" DATE NOT NULL,
    "status_pedido" VARCHAR(255) NOT NULL,
    CONSTRAINT fk_usuario_pedido
    FOREIGN KEY ("usuario_id")
    REFERENCES "usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_endereco_pedido
    FOREIGN KEY ("endereco_id")
    REFERENCES "endereco_usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE itens_pedido(
    "id" SERIAL PRIMARY KEY,
    "pedido_id" INTEGER NOT NULL,
    "produto_id" INTEGER NOT NULL,
    "quantidade" INTEGER NOT NULL,
    CONSTRAINT fk_pedido_itens_pedido 
    FOREIGN KEY("pedido_id") 
    REFERENCES "pedido"("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_produto_itens_pedido
    FOREIGN KEY("produto_id") 
    REFERENCES "produto"("id") ON DELETE SET NULL ON UPDATE CASCADE
);