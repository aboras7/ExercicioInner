CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias (
id bigint auto_increment,
tipo varchar(255) not null,
descricao varchar(255) not null,
primary key(id)
);

CREATE TABLE tb_produtos (
id bigint auto_increment,
nome varchar(255) not null,
valor decimal (6,2) not null,
descricao_produto varchar(255) not null,
marca varchar(255) not null,
categorias_id bigint not null,
primary key (id)
);

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categorias_id) REFERENCES tb_categorias (id);

-- Olha só, descobri que dá pra fazer assim na hora de inserir!

INSERT INTO tb_categorias (tipo, descricao) VALUES
    ("Hidráulica", "Produtos para sistemas hidráulicos"),
    ("Elétrica", "Produtos elétricos para construção"),
    ("Ferragens", "Ferramentas e acessórios"),
    ("Pintura", "Produtos para pintura"),
    ("Madeira", "Materiais de madeira");

INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Torneira",  120.50, "Torneira para pia de cozinha", "Tigre", 1);
INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Fio Elétrico", 45.90, "Rolo de fio elétrico 10m", "Corfio", 2);
INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Martelo",  19.99, "Martelo de carpinteiro", "Stanley", 3);
INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Tinta Látex",  79.99, "Lata de tinta látex branca", "Lukscolor", 4);
INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Tábua de Madeira",  35.00, "Tábua de madeira para construção", "Madeira Madeira", 5);
INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Chave Inglesa",  65.75, "Chave de metal para ajustes", "IRWIN", 1);
INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Chave de Fenda",  15.50, "Chave com base de borracha para uso comum", "VONDER", 2);
INSERT INTO tb_produtos (nome, valor, descricao_produto, marca, categorias_id) VALUES ("Pincel",  8.99, "Pincel para pintura de parede","WINSOR & NEWTON", 4);
    
SELECT * FROM tb_produtos WHERE valor > 100.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
    
SELECT nome, valor, descricao_produto, marca FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.categorias_id;

SELECT nome, valor, descricao_produto, marca FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.categorias_id WHERE categorias_id = 1;

	
