create database Empresa;
use Empresa;

create table Departamento(
	codigo int primary key,
    descricao varchar(100) not null
);

create table Funcionario (
	cod_func int primary key,
    nome varchar(100) not null,
    endereco varchar(50),
    telefone varchar(15),
    cod_departamento int,
    foreign key (cod_departamento) references departamento(cod_dept)
);

create table Dependentes(
	cod_depend int primary key,
    cod_funcionario int, 
    nome varchar(100) not null,
    data_nasc date,
    foreign key(cod_func) references Funcionario(cod_func)
);

desc Departamento;
desc Funcionario;
desc Dependentes;

alter table Funcionario
add column data_nasc date;

alter table Dependentes 
add column data_nasc date;

alter table Departamento
modify column descricao char(50);

alter table Dependentes 
add column teste varchar(100);

alter table Dependentes 
drop column teste;


