--Atividade 2--
select name as banco_de_dados
from sys.databases
order by name;

use DbYasmiViaro;
go

select name from sys.tables
go

create table estudantes(
    IdEstudante int primary key,
    Nome varchar(100) not null,
    Turma varchar(50) not null,
    Apelido varchar(30)
);

create table videos(
    IdVideo int primary key,
    Titulo varchar(100) not null,
    Descricao varchar(255) not null,
    data_publicacao date not null,
    Duracao time not null,
    matricula_estudante int not null,
    foreign key (matricula_estudante) references estudantes(IdEstudante)
);

--inserindo dados na tabela estudantes
insert into Estudantes (IdEstudante, Nome, Turma, Apelido)
values
(1, 'Peter Parker', '2A', 'Homem-Aranha'),
(2, 'Mary Jane', '2A', 'MJ'),
(3, 'Tony Stark', '3A', 'Homem de Ferro'),
(4, 'Natasha Romanoff', '2B', 'Víuva Negra'),
(5, 'Thor Odinson', '2B', 'Thor'),
(6, 'Bruce Wayne', '2B', 'Batman'),
(7, 'Clark Kent', '2C', 'Superman'),
(8, 'Diana Prince', '2C', 'Mulher-Maravilha'),
(9, 'Barry Allen', '2C', 'Flash'),
(10, 'Arthur Curry', '2A', 'Aquaman');

select * from Estudantes;
go

INSERT INTO Videos (IdVideo, Titulo, Descricao, data_publicacao, Duracao, matricula_estudante)
VALUES
(1, 'Teia de Dados','Homem-Aranha I', '2023-01-15', '00:45:00', 1),
(2, 'Amor e Ação','Mary Jane II', '2023-02-20', '00:50:00', 2),
(3, 'Homem de Ferro: Ascensão','Tony Stark III', '2023-03-10', '01:30:00', 3),
(4, 'Agente Secreta','Natasha Romanoff IV', '2023-04-05', '01:15:00', 4),
(5, 'Deus do Trovão','Thor Odinson V', '2023-05-12', '01:20:00', 5),
(6, 'Cavaleiro das Trevas','Bruce Wayne VI', '2023-06-18', '01:40:00', 6),
(7, 'O Homem de Aço','Clark Kent VII', '2023-07-22', '01:25:00', 7),
(8, 'A Princesa Guerreira','Diana Prince VIII', '2023-08-30', '01:35:00', 8),
(9, 'Velocidade Extrema','Barry Allen IX', '2023-09-14', '01:10:00', 9),
(10, 'Rei dos Mares','Arthur Curry X', '2023-10-05', '01:50:00', 10);

select * from Videos;

--alterar dados de uma linha com update
update Estudantes
set Apelido = 'Aranha'
where IdEstudante = 1;

select --select responsavel por selecionar os dados das tabelas videos e estudantes

v.Titulo, --v.titulo seleciona o titulo do video da tabela videos
e.Nome as Autor, --e.nome seleciona o nome do estudante da tabela estudantes e renomeia a coluna como autor
e.Apelido as Heroi, --e.apelido seleciona o apelido do estudante da tabela estudantes e renomeia a coluna como heroi
v.Duracao --v.duracao seleciona a duracao do video da tabela videos
from Videos as v --from videos as v seleciona a tabela videos e renomeia como v
inner join Estudantes as e --inner join estudantes as e seleciona a tabela estudantes e 
on v.matricula_estudante = e.IdEstudante;