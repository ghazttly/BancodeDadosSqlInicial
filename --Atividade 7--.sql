--Atividade 7--
create database DbYasmiViaro_At7;

use DbYasmiViaro_At7;
go

create table Usuario(
    Id_Usuario int primary key,
    Nome varchar(50) not null,
    Apelido varchar(30),
    Email varchar(50) not null,
    Data_nascimento date not null
);

create table Post(
    Id_Post int primary key,
    Texto varchar(200),
    Data_Criado date not null,
    Hora_Criado time not null,
    Id_Usuario int,
    Foreign key (Id_Usuario) references Usuario(Id_Usuario)
);