drop database biblioteca;
create database biblioteca;
use biblioteca;

CREATE TABLE Autores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Categorias (
    id INT PRIMARY KEY,
    descricao VARCHAR(50)
);

CREATE TABLE Livros (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    ano_publicacao int (4),
    id_autor INT,
    id_categoria INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);

alter table Livros
add preco decimal(5,2);

alter table Categorias
add quantidade int;

insert into Autores values
(1, 'J.K. Rowling',' Britânica'),
(2, 'George R.R. Martin', 'Americana'),
(3, 'Jules Verne', 'Francesa');

insert into Categorias values
(1, 'Ficção Fantástica', 5),
(2, 'Ficção Científica', 3),
(3, 'Mistério', 4);

insert into Livros values
(1, 'Harry Potter e a Pedra Filosofal', 1997, 1, 1, 39.90),
(2, 'A Guerra dos Tronos', 1996, 2, 1, 49.90),
(3, 'Vinte Mil Léguas Submarinas', 1870, 3, 2, 34.90);

insert into Autores values
(4, 'Charles Dickens', 'Britânica');

insert into Livros values
(4, 'Oliver Tree', 1837, 4, 3, 19.90);

update Categorias
set descricao = "Romance"
where id = 1;

update Livros
set preco = preco + (preco * 0.10)
where ano_publicacao < 2000;

update Autores
set nome = 'Gabriel García Márquez'
where id = 3;

delete from Livros
where ano_publicacao < 1950;

delete from Categorias
where quantidade < 5;

alter table Categorias
drop quantidade;

select *from Autores;
select *from Livros;
select *from Categorias;
