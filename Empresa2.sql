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
    foreign key(CodigoDepartamento) references Departamentos(Codigo),
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
SELECT PrimeiroNome, UltimoNome FROM Funcionarios ORDER BY UltimoNome;
	
/*b)Listar todos os campos de funcionários ordenados por cidade*/
SELECT *FROM Funcionarios ORDER BY cidade;

/*c)Liste os funcionários que têm salário superior a R$ 1.000,00 ordenados pelo nome completo*/
SELECT PrimeiroNome, SegundoNome, Salario
FROM Funcionarios
WHERE Salario > 1000
ORDER BY PrimeiroNome, SegundoNome, UltimoNome;

/*d)Liste a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho*/
SELECT PrimeiroNome, DataNasci
FROM Funcionarios
ORDER BY DataNasci DESC;

/*e)Liste os funcionários como uma listagem telefônica*/
SELECT PrimeiroNome, SegundoNome, UltimoNome, Fone /*or  CONCAT(PrimeiroNome, ' ', SegundoNome, ' ', UltimoNome) AS NomeCompleto*/
FROM Funcionarios
ORDER BY PrimeiroNome, SegundoNome, UltimoNome; /*or NomeCompleto*/

/*f)Liste o total da folha de pagamento*/
SELECT SUM(Salario) as TotalFolhaPagamento
FROM Funcionarios;

/*g) Liste o nome, o nome do departamento e a função de todos os funcionários*/
SELECT concat(PrimeiroNome, ' ', SegundoNome, ' ', UltimoNome) AS NomeCompleto,
Departamento.Nome AS NomeDepartamento, Funcao
FROM Funcionarios
JOIN Departamentos AS Departamento ON Funcionarios.CodigoDepartamento = Departamento.Codigo;

/*h) Liste todos departamentos com seus respectivos gerentes*/
SELECT Departamentos.Nome AS NomeDepartamento, CONCAT(Funcionarios.PrimeiroNome, ' ', Funcionarios.SegundoNome, ' ', Funcionarios.UltimoNome) AS FuncionarioNomeGerente
FROM Departamentos
JOIN Funcionarios ON Departamentos.CodigoFuncionarioGerente = Funcionarios.Codigo;

/*i) Liste o valor da folha de pagamento de cada departamento (nome)*/
SELECT Departamento.Nome AS NomeDepartamento, SUM(Funcionarios.Salario) AS TotalFolhaPagamento
FROM Departamentos
JOIN Funcionarios ON Departamentos.Codigo = Funcionarios.CodigoDepartamento
GROUP BY Departamentos.Nome;

/*j) Liste os departamentos dos funcionários que têm a função de supervisor*/
SELECT Departamento.Nome AS NomeDepartamento
FROM Departamentos 
JOIN Funcionarios ON Departamentos.Codigo = Funcionarios.CodigoDepartamento
WHERE Funcionarios.Funcao =  "Supervisor";


/*k) Liste a quantidade de funcionários desta empresa*/
SELECT COUNT(*) AS TotalFuncionarios
FROM Funcionarios;

/*l) Liste o salário médio pago pela empresa*/
SELECT AVG(Salario) AS SalarioMedio
FROM Funcionarios;

/*m) Liste os nomes dos funcionários que moram em Recife e que exerçam a função de Telefonista*/
SELECT CONCAT(PrimeiroNome, ' ', SegundoNome, ' ', UltimoNome) AS NomeCompleto, Cidade, Funcao
FROM Funcionarios
WHERE Cidade = "Recife" AND Funcao = "Telefonista";

SELECT Departamentos.Nome AS NomeDepartamento, 
CONCAT(Funcionarios.PrimeiroNome, ' ', Funcionarios.SegundoNome, ' ', Funcionarios.UltimoNome) AS NomeFuncionario
FROM Departamentos
JOIN Funcionarios ON Departamentos.Codigo = Funcionarios.CodigoDepartamento
ORDER BY NomeDepartamento, NomeFuncionario;

/*o) Liste o nome completo de todos os funcionários que não tenham segundo nome*/
SELECT CONCAT(PrimeiroNome, ' ', UltimoNome) AS NomeCompleto
FROM Funcionarios
WHERE SegundoNome IS NULL OR SegundoNome = ' ';

/*p) Liste o menor salário pago pela empresa em cada departamento*/
SELECT MIN(Salario), Departamento.Nome AS NomeDepartamento
FROM Funcionarios
JOIN Departamentos AS Departamento ON Funcionarios.CodigoDepartamento = Departamento.Codigo
GROUP BY Departamento.Nome;
