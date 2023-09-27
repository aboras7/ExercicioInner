CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
id bigint auto_increment,
pedacos varchar(255),
descricao varchar(255),
primary key(id)
);

CREATE TABLE tb_pizzas (
id bigint auto_increment,
sabor varchar(255) not null,
valor bigint not null,
adicionais boolean not null,
salgada boolean,
doce boolean,
categorias_id bigint not null,
primary key (id)
);

INSERT INTO tb_categorias (pedacos, descricao) VALUES ("8", "Tamanho padrão");
INSERT INTO tb_categorias (pedacos, descricao) VALUES ("12", "Tamanho família");
INSERT INTO tb_categorias (pedacos, descricao) VALUES ("4", "Tamanho brotinho");
INSERT INTO tb_categorias (pedacos, descricao) VALUES ("8", "Meio a meio padrão");
INSERT INTO tb_categorias (pedacos, descricao) VALUES ("12", "Meio a meio família");
INSERT INTO tb_categorias (pedacos, descricao) VALUES ("4", "Meio a meio brotinho");

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias
FOREIGN KEY (categorias_id) REFERENCES tb_categorias (id);

INSERT INTO tb_pizzas (sabor, valor, adicionais, salgada, categorias_id) VALUES ("Marguerita", 40, false, true, 1);
INSERT INTO tb_pizzas (sabor, valor, adicionais, salgada, categorias_id) VALUES ("Calabresa", 45, true, true, 2 );
INSERT INTO tb_pizzas (sabor, valor, adicionais, doce, categorias_id) VALUES ("Sorvete", 50, false, true, 1 );
INSERT INTO tb_pizzas (sabor, valor, adicionais, salgada, categorias_id) VALUES ("Metade calabresa, metade frango com catupiry", 70, true, true, 5);
INSERT INTO tb_pizzas (sabor, valor, adicionais, salgada, categorias_id) VALUES ("Frango com catupiry", 55, false, true, 3);
INSERT INTO tb_pizzas (sabor, valor, adicionais, doce, categorias_id) VALUES ("Brigadeiro", 50, false, true, 1);
INSERT INTO tb_pizzas (sabor, valor, adicionais, salgada, categorias_id) VALUES ("Metade brócolis, metade carne seca", 60, true, true, 4);
INSERT INTO tb_pizzas (sabor, valor, adicionais, salgada, categorias_id) VALUES ("Quatro queijos", 70, true, true, 3);

SELECT * FROM tb_pizzas WHERE valor > 45;
SELECT * FROM tb_pizzas WHERE valor >= 50 AND valor <= 100;
SELECT sabor FROM tb_pizzas WHERE sabor LIKE '%M%';

SELECT sabor, valor, adicionais, salgada, doce FROM tb_pizzas
INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categorias_id;

SELECT sabor, valor, adicionais, salgada, doce FROM tb_pizzas
INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categorias_id WHERE doce = true;
