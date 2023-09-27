CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes (
id bigint auto_increment,
humanos varchar(255),
descricao varchar(255),
primary key(id)
);

CREATE TABLE tb_personagens (
id bigint auto_increment,
nome varchar(255) not null,
ataque bigint not null,
defesa bigint not null,
forca bigint not null,
classe_id bigint not null,
primary key (id)
);

INSERT INTO tb_classes (humanos, descricao) VALUES ("Guerreiro", "Usa espada");
INSERT INTO tb_classes (humanos, descricao) VALUES ("Arqueiro", "Usa arco");
INSERT INTO tb_classes (humanos, descricao) VALUES ("Bruxo", "Usa magia");
INSERT INTO tb_classes (humanos, descricao) VALUES ("Curandeiro", "Usa habilidades de restauração");
INSERT INTO tb_classes (humanos, descricao) VALUES ("Tank", "Usa escudo");

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes
FOREIGN KEY (classe_id) REFERENCES tb_classes (id);

INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Geandro", 9000, 5000, 15, 1);
INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Liza", 10000 , 7000 , 13, 3);
INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Filipe", 5000, 5000, 10 , 2 );
INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Raquel", 4000 , 6000, 12, 4);
INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Lucas", 8000, 10000, 20 , 5);
INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Yuri", 11000 , 8000 , 13 , 3);
INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Eliza", 8000, 8000, 10 , 2 );
INSERT INTO tb_personagens (nome, ataque, defesa, forca, classe_id) VALUES ("Jorge", 10000 , 10000 , 15 , 1 );

-- Fiz o select com valores diferentes do enunciado porque na hora de criar os valores de ataque e defesa, fiz valores muito altos.
SELECT nome, ataque FROM tb_personagens WHERE ataque > 7000;
SELECT nome, defesa FROM tb_personagens WHERE defesa >= 6000 AND defesa <= 8000;
SELECT nome FROM tb_personagens WHERE nome LIKE '%C%';

SELECT nome, ataque, defesa, forca FROM tb_personagens
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id;

SELECT nome, ataque, defesa, forca FROM tb_personagens 
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id WHERE humanos in ("Bruxo");
