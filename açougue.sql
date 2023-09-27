CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
id bigint auto_increment,
tipo varchar(255),
nobre boolean not null,
primary key(id)
);

CREATE TABLE tb_produtos (
id bigint auto_increment,
nome varchar(255) not null,
valor decimal (6,2) not null,
peso decimal(6,2) not null,
gordura boolean not null,
categorias_id bigint not null,
primary key (id)
);

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categorias_id) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (tipo, nobre) VALUES ("Suína", false);
INSERT INTO tb_categorias (tipo, nobre) VALUES ("Suína", true);
INSERT INTO tb_categorias (tipo, nobre) VALUES ("Bovina", false);
INSERT INTO tb_categorias (tipo, nobre) VALUES ("Bovina", true);
INSERT INTO tb_categorias (tipo, nobre) VALUES ("Avícola", false);

INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Picanha", 150.00, 1.5, true, 4);
INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Alcatra", 60.00, 2.0, true, 3);
INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Maminha", 50.00, 1.0, true, 4);
INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Lombo", 70.00, 4.0, true, 2);
INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Coxa do frango", 20.00, 1.0, false, 5);
INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Frango inteiro", 50.00, 1.2, true, 5);
INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Bacon", 30.00, 0.5, true, 1);
INSERT INTO tb_produtos (nome, valor, peso, gordura, categorias_id) VALUES ("Pé de galinha", 15.00, 1.0, false, 5);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT nome, valor, peso, gordura FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.categorias_id;

SELECT nome, valor, peso, gordura FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.categorias_id WHERE categorias_id = 5;

