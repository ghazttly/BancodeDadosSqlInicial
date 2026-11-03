--Atividade 8--
create database DbYasmiViaro_At8;

use DbYasmiViaro_At8;
go

create table Aluno(
    Id_Aluno int primary key,
    Nome varchar(70) not null,
    Telefone int not null,
    Email Varchar(50) not null
);

create table Endereco(
    Id_Endereco int primary key,
    Rua varchar(50) not null,
    Numero int not null,
    Bairro varchar(25) not null,
    Cidade varchar(70) not null,
    CEP int not null,
    Ponto_referencia varchar(75),
    Id_Aluno int,
    foreign key (Id_Aluno) references Aluno(Id_Aluno)
);
