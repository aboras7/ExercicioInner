CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
id bigint auto_increment,
area varchar(255) not null,
descricao varchar(255) not null,
primary key(id)
);

CREATE TABLE tb_cursos (
id bigint auto_increment,
nome_curso varchar(255) not null,
duracao_semestres int not null,
valor_mensalidade decimal(6,2) not null,
media bigint not null,
categorias_id bigint not null,
primary key (id)
);

ALTER TABLE tb_cursos ADD CONSTRAINT fk_cursos_categorias
FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id);

INSERT INTO tb_categorias (area, descricao) VALUES ("Exatas", "Estudo que utiliza cálculo e lógica para gerar predições e medições precisas.");
INSERT INTO tb_categorias (area, descricao) VALUES ("Ciências Humanas", "Entender comportamentos e necessidades da sociedade.");
INSERT INTO tb_categorias (area, descricao) VALUES ("Ciências Biológicas", "Estudo da vida em diversas escalas.");
INSERT INTO tb_categorias (area, descricao) VALUES ("Ciências da Saúde", "Estuda a vida, mas com um foco maior em doenças e a busca pelo bem-estar.");
INSERT INTO tb_categorias (area, descricao) VALUES ("Letras e Artes", "Focada na comunicação entre seres humanos, expressões artísticas e culturais.");

INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("História", 10, 500.00, 6, 2);
INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("Psicologia", 10, 1000.00, 7, 4);
INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("Biomedicina", 8, 800.00, 7, 4);
INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("Matemática Aplicada", 8, 600.00, 8 ,1);
INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("Biologia", 8, 500.00, 6, 3);
INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("Direito", 10, 800.00, 7, 2);
INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("Educação Física", 8, 650.00, 6, 4);
INSERT INTO tb_cursos (nome_curso, duracao_semestres, valor_mensalidade, media, categorias_id) VALUES ("Letras", 8, 700.00, 7, 5);

SELECT * FROM tb_cursos WHERE valor_mensalidade > 500.00;
SELECT * FROM tb_cursos WHERE valor_mensalidade BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome_curso LIKE '%M%';

SELECT nome_curso, duracao_semestres, valor_mensalidade, media FROM tb_cursos
INNER JOIN tb_categorias ON tb_categorias.id = tb_cursos.categorias_id;

SELECT nome_curso, duracao_semestres, valor_mensalidade, media FROM tb_cursos
INNER JOIN tb_categorias ON tb_categorias.id = tb_cursos.categorias_id WHERE media = 7;
