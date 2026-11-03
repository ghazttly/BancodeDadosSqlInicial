--Atividade 5--
create database DbYasmiViaro_At5;

use DbYasmiViaro_At5;
go

create table Aluno(
    Id_Aluno int primary key,
    Nome varchar(100) not null,
    Turma varchar(20) not null
);

create table Produto(
    Id_Produto int primary key,
    Nome varchar(50) not null,
    Preco decimal not null,
    Categoria varchar(30) not null
);

create table Pedido(
    Id_Pedido int primary key,
    Data_pedido date not null,
    Valor_total decimal not null,
    Id_Produto int,
    Id_Aluno int,
    foreign key (Id_Produto) references Produto(Id_Produto),
    foreign key (Id_Aluno) references Aluno(Id_Aluno)
);

select * from Aluno;
select * from Pedido;
select * from Produto;

insert into Pedido (Id_Pedido, Data_pedido, Valor_total, Id_Produto, Id_Aluno)
(1, , , , )