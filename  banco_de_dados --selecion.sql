--Atividade 1--
select name as banco_de_dados --selecionando o nome dos bancos de dados
from sys.databases --selecionando todos os bancos de dados existentes no servidor
order by name; --orenando o bancop de dados criado dentro do servidor

use DbYasmiViaro; --seleciona o banco de dados criado dentro do servidor
go

select name from sys.tables --selecionando o nome das tabelas
go;
--where type = 'U'--filtrando apenas as tabelas do tipo usuário

/* localizar dados da tabela */

select name as tabela --selecionando o nome das tabelas
from sys.tables --selecionando o nome das tabelas
order by name; --ordenando todas as tabelas

select * from Jogadores;

select * from TelefonesJogadores;

select nome_completo, apelido, turma
from Jogadores;

select top(50) * from Jogadores;
