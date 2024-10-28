use hospital;

Alter table medico add crm int;
show databases;
select *from medico;

Alter table medico change cidade cidadeNasc varchar(20);
select *from medico;

desc medico;

alter table paciente modify cpf varchar(11);
select *from medico;

update medico 
set especialidade = 'Dermatologia' 
where nomeMed = 'Pedro';
select *from medico;

delete
from consulta
where codPac = 2;
select *from consulta;

delete
from paciente
where nomePac = 'Lucas';
select *from paciente;
