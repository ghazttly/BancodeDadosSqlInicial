create table Teste (
    Id_Teste int primary key,
    descricao varchar(50)
);

insert into Teste (Id_Teste, descricao) 
values 
(1, 'primeiro registro');

select * from Teste;

alter table Teste
add Observacao varchar (100) null;

insert into Teste (Id_Teste, descricao, Observacao)
values( '2','resgistro criado depois', 'primeira observacao');

select * from Teste;

insert into Teste (Id_Teste, descricao, Observacao)
values( '3','resgistro criado depois do depois', 'terceira observacao');

select * from Teste;

update Teste
set Observacao = 'Registro revisado pelo professor'
where Id_Teste = 1; 

drop table Teste;
GO

select * from Teste;

select name from sys.tables;
go