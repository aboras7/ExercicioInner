CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
id bigint auto_increment,
tipo varchar(255),
receita boolean not null,
primary key(id)
);

CREATE TABLE tb_produtos (
id bigint auto_increment,
nome varchar(255) not null,
valor decimal (6,2) not null,
marca varchar(255) not null,
generico boolean not null,
categorias_id bigint not null,
primary key (id)
);

INSERT INTO tb_categorias (tipo, receita) VALUES ("Medicamento", true);
INSERT INTO tb_categorias (tipo, receita) VALUES ("Medicamento", false);
INSERT INTO tb_categorias (tipo, receita) VALUES ("Cosmético", false);
INSERT INTO tb_categorias (tipo, receita) VALUES ("Saúde bucal", false);
INSERT INTO tb_categorias (tipo, receita) VALUES ("Tarja preta", true);

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categorias_id) REFERENCES tb_categorias (id);

INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Dipirona", 5.00, "Neosaldina", false, 2);
INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Fluoxetina", 65.00, "Prozac", false, 1);
INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Hastes flexíveis", 19.89, "Cotonetes", false, 3);
INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Relaxante muscular", 7.09, "Não possui", true, 2);
INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Enxaguante bucal", 19.90, "Colgate", false, 4);
INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Clonazepam", 50.39, "Rivotril", false, 5);
INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Esmalte de unha", 20.00, "Risqué", false, 3);
INSERT INTO tb_produtos (nome, valor, marca, generico, categorias_id) VALUES ("Amoxicilina", 30.00, "Amoxil", false, 1);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT nome, valor, marca, generico FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.categorias_id;

SELECT nome, valor, marca, generico FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.categorias_id WHERE tipo = "Medicamento";
