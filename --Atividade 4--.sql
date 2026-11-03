--Atividade 4--
create database DbYasmiViaro_At4;

use DbYasmiViaro_At4;
go

CREATE table Estudante(
    Id_Estudante int primary key,
    Nome varchar(100) not null,
    Turma varchar(30) not null
);

select * from EstudanteNew;

create table Musica(
    Id_Musica int primary key,
    Titulo varchar(100) not null,
    Artista varchar(70) not null,
    Album varchar(50),
    Duracao time not null,
    Id_estudante int not null,
    foreign key (Id_estudante) references Estudante(Id_Estudante)
);

select * from Musica;