create database Empresa2;
use Empresa2;

create table Funcionarios(
	Codigo int primary key,
    PrimeiroNome varchar(20),
    SegundoNome varchar(20),
    UltimoNome varchar(20),
    DataNasci date not null,
    CPF char(11) not null,
    RG varchar(9),
    Endereco varchar(50) not null,
    CEP char(8) not null,
    Cidade varchar(50),
    Fone varchar(15) not null,
    CodigoDepartamento int not null,
    foreign key(CodigoDepartamento) references Departamento(Codigo),
    Funcao varchar (20) not null,
    Salario decimal not null
);

create table Departamentos(
	Codigo int primary key,
    Nome varchar(30),
    Localizacao varchar(50),
    CodigoFuncionarioGerente int not null,
    foreign key(CodigoFuncionarioGerente) references Funcionarios(Codigo)
);
    
    
/*a)Listar nome e sobrenome ordenado por sobrenome*/ 
SELECT PrimeiroNome, UltimoNome FROM tabela Funcionarios ORDER BY UltimoNome;
	
/*b)Listar todos os campos de funcionários ordenados por cidade*/
SELECT *FROM Funcionarios ORDER BY cidade

/*c)Liste os funcionários que têm salário superior a R$ 1.000,00 ordenados pelo nome completo*/
SELECT 
