--Atividade 6--
create database DbYasmiViaro_At6;

use DbYasmiViaro_At6;
go

create table Estudante(
    Id_Estudante int primary key,
    Nome varchar(100) not null,
    Turma int not null
);

create table Exemplar(
    Id_Exemplar int primary key,
    Numero_Tombo int not null,
    Estado varchar(20),
    Id_Estudante int,
    foreign key (Id_Estudante) references Estudante(Id_Estudante)
);

create table Livro(
    Id_Livro int primary key,
    Titulo varchar(70) not null,
    Autor varchar(50) not null,
    Ano_lancamento smallint,
    Editora varchar(50),
    Id_exemplar int not null,
    foreign key (Id_exemplar) references Exemplar(Id_Exemplar)
); 

