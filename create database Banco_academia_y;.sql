create database Banco_academia_y;

use Banco_academia_y;

select name as NomeDoBanco
from sys.databases
order by name;

-- COMANDO PARA LISTAR O BANCO DE DADOS ATUAL
select db_name() as BancoAtual;

-- CRIANDO TABELAS PROFESSORES
create table Professores(
    IdProfessor int primary key identity(1,1), --IDENTITY- para auto incrementar o IdProfessor
    Nome varchar(100) not null,
    Email varchar(100) not null unique, --UNIQUE- para nao permitir emails duplicados
    Especialidade varchar(100) not null
);

create table Cursos(
    IdCurso int primary key identity(1,1), --IDENTITY- para auto incrementar o IdCurso
    NomeCurso varchar(100) not null unique, 
    CargaHoraria int not null check (CargaHoraria > 0 and CargaHoraria <= 200), --CHECK- para validar a carga horaria
    IdProfessor int not null, 
    Ativo bit not null default 1, --DEFAULT- para definir o valor padrao como 1 (ativo)
    CONSTRAINT FK_Cursos_Professores --CONSTRAINT para criar a chave estrangeira
    foreign key (IdProfessor) references Professores(IdProfessor)
);

create table Alunos(
    IdAluno int primary key identity(1,1), --IDENTITY- para auto incrementar o IdAluno
    Nome Varchar(100) not null,
    Email varchar(100) not null unique, 
    Turma varchar(50) not null,
    DataNascimento date not null,
    Ativo bit not null constraint DF_Alunos_Ativo default 1, --DEFAULT- para definir o valor padrao como 1 (ativo)
);

CREATE TABLE Matriculas(
    IdMatricula INT IDENTITY(1,1) PRIMARY KEY, --Identity para auto incrementar o IdMatricula
    IdAluno INT NOT NULL,
    IdCurso INT NOT NULL,
    DataMatricula DATE NOT NULL CONSTRAINT DF_Matriculas_Data DEFAULT (CONVERT(DATE, GETDATE())), -- Default para definir a data atual como valor padrão
    NotaFinal DECIMAL(4,2) NULL CHECK (NotaFinal BETWEEN 0 AND 10), -- Check para validar a nota final
    StatusMatricula VARCHAR(20) NOT NULL CONSTRAINT DF_Matriculas_Status DEFAULT 'Ativa', -- Default para definir o valor padrão como 'Ativa'

    CONSTRAINT UQ_Matriculas_AlunoCurso UNIQUE (IdAluno, IdCurso), -- Unique para não permitir que um aluno se matricule no mesmo curso mais de uma vez
    CONSTRAINT FK_Matriculas_Alunos -- CONSTRAINT para criar a chave estrangeira
        FOREIGN KEY (IdAluno) REFERENCES Alunos(IdAluno), -- CONSTRAINT para criar a chave estrangeira
    CONSTRAINT FK_Matriculas_Cursos  -- CONSTRAINT para criar a chave estrangeira
        FOREIGN KEY (IdCurso) REFERENCES Cursos(IdCurso) --Para criar a chave estrangeira, referenciando a tabela Cursos
);

INSERT INTO Professores (Nome, Email, Especialidade)
VALUES
    ('Ana Martins',     'ana.martins@academia.com',    'Banco de Dados'),
    ('Carlos Ribeiro',  'carlos.ribeiro@academia.com', 'Programação'),
    ('Fernanda Lima',   'fernanda.lima@academia.com',  'Desenvolvimento Web'),
    ('Rafael Souza',    'rafael.souza@academia.com',   'Redes de Computadores');

INSERT INTO Cursos (NomeCurso, CargaHoraria, IdProfessor)
VALUES
    ('Banco de Dados Inicial', 40, 1),
    ('SQL Server Essencial',   36, 1),
    ('Lógica de Programação',  40, 2),
    ('JavaScript para Jovens', 32, 2),
    ('HTML e CSS',             30, 3),
    ('Fundamentos de Redes',   24, 4);

INSERT INTO Alunos (Nome, Email, Turma, DataNascimento)
VALUES
    ('Alice Pereira',   'alice.pereira@escola.com',   '2INFO-A', '2008-03-14'),
    ('Bruno Alves',     'bruno.alves@escola.com',     '2INFO-A', '2008-07-22'),
    ('Camila Rocha',    'camila.rocha@escola.com',    '2INFO-A', '2008-01-30'),
    ('Diego Santos',    'diego.santos@escola.com',    '2INFO-B', '2007-11-09'),
    ('Elisa Nunes',     'elisa.nunes@escola.com',     '2INFO-B', '2008-05-18'),
    ('Felipe Costa',    'felipe.costa@escola.com',    '2INFO-B', '2008-09-02'),
    ('Gabriela Melo',   'gabriela.melo@escola.com',   '2INFO-C', '2007-12-12'),
    ('Henrique Luz',    'henrique.luz@escola.com',    '2INFO-C', '2008-06-28'),
    ('Isabela Torres',  'isabela.torres@escola.com',  '2INFO-C', '2008-02-06'),
    ('João Mendes',     'joao.mendes@escola.com',     '2INFO-C', '2007-08-25');

INSERT INTO Matriculas (IdAluno, IdCurso, DataMatricula, NotaFinal, StatusMatricula)
VALUES
    (1, 1, '2026-02-03', 8.50, 'Concluída'),
    (1, 5, '2026-02-03', 9.00, 'Concluída'),
    (2, 1, '2026-02-03', 7.00, 'Concluída'),
    (2, 3, '2026-02-04', 8.00, 'Ativa'),
    (3, 2, '2026-02-04', 9.50, 'Concluída'),
    (3, 4, '2026-02-04', NULL, 'Ativa'),
    (4, 3, '2026-02-05', 6.50, 'Concluída'),
    (5, 5, '2026-02-05', 8.50, 'Concluída'),
    (6, 6, '2026-02-06', NULL, 'Ativa'),
    (7, 1, '2026-02-06', 7.50, 'Concluída'),
    (8, 2, '2026-02-07', 10.00, 'Concluída'),
    (8, 6, '2026-02-07', 8.00, 'Concluída'),
    (9, 4, '2026-02-08', NULL, 'Ativa'),
    (9, 5, '2026-02-08', 9.00, 'Concluída'),
    (10, 3, '2026-02-09', 7.00, 'Concluída'),
    (10, 2, '2026-02-09', NULL, 'Ativa');



select * from Professores;
select * from Cursos;
select * from Alunos;
select * from Matriculas;


--SELECIONAR SOMENTE COLUNAS ESPECIFICAS DA TABELA
select Nome, Email from professores;

--VIZUALIZA TODAS AS TABELAS DO BANCO DE DADOS Banco_Academia
select table_name
from information_schema.tables
where table_type = 'base table'
order by table_name;

--LISTAR TODAS AS TABELAS DO BANCO DE DADOS Banco_Academia
select name as tablela
from sys.tables
order by name;

--APELIDO PARA DEIXAR O TITULO MAIS CLARO NA RESPOSTA
select Nome as NomeDoAluno, Turma as Sala from Alunos;

--CONSULTA POR ORDEM ALFABÉTICA
select Nome, Turma from Alunos
order by Nome ASC; --ASC- para ordem crescente DESC- para ordem decrescente

--OS 5 PRIMEIROS REGISTROS DE ALUNOS CADASTRADOS
select top 5 Nome, Turma, DataNascimento from Alunos
order by Nome ASC;

--FILTROS COM WHERE
--WHERE FILTRA AS LINHAS, LEIA A CONSULTA COMO UMA FRASE: "SELECIONE OS NOMES E TURMAS DOS ALUNOS ONDE A TURMA SEJA IGUAL A '2INFO-A'""

-- IGUAL A: 
select Nome, Turma from Alunos
where Turma = '2INFO-A';

--DIFERENTE DE: significa que a condição deve ser atendida para que o registro seja retornado na consulta. Ou seja, a consulta irá retornar apenas os registros onde a turma seja exatamente igual a '2INFO-A'.
select Nome, Turma from Alunos
where Turma <> '2INFO-A';

--AND: As duas condições devem ser verdadeiras para que o registro seja retornado na consulta. 
select Nome, Turma, DataNascimento from Alunos
where Turma = '2INFO-A' and DataNascimento > '2008-01-01';

--OR: pelo menos uma consiçao deve ser verdadeira
select Nome, Turma, DataNascimento from Alunos
where Turma = '2INFO-A'or DataNascimento > '2008-01-01';

--IN: versao mais curta para varios valores
select Nome, Turma from Alunos
where Turma in ('2INFO-A', '2INFO-B');

--LIKE: % significa "qualquer quantidade de caracteres" e _ significa "qualquer caractére"
select Nome, Email from Alunos
where Email like '%@escola.com';

--ATUALIZANDO DADOS COM UPDATE
--UPDATE: atualiza os dados de uma tabela. a sintaxe básica é: UPDATE  nome_da_tabela SET nome_da_coluna = novo_valor WHERE condiçao

--CORRIGIR A TURMA DE UM ALUNO ESPECÍFICO
update Alunos
set Turma = '2INFO-c'
where IdAluno = 3; --ALTERA A TURMA DO ALUNO COM IdAluno IGUAL A 3 PARA '2INFO-C'

--REGISTRAR UMA NOTA E ENCERRAR A MATRICULA DO ALUNO 2 NO CURSO 3
UPDATE Matriculas
set NotaFinal = 8.75, StatusMatricula = 'Consluida'
where IdAluno = 2 and IdCurso = 3; --ALTERA A NOTA FINAL E O STATUS DA MATRICULA DOM ALUNO COM IdAluno 2 E IdCurso 3

--CONFERIR A ALTERAÇAO DA TURMA DO ALUNO 2
select * from Matriculas
where IdAluno = 2 and IdCurso = 3;

--DESATIVAR ALUNOS DA TURMA 2INFO-B
update Alunos set Ativo = 0
where Turma = '2INFO-B';

--RESATIVAR ALUNOS DA TURMA 2INFO-B
update Alunos set Ativo = 1
where Turma = '2INFO-B';

--EXCLUINDO REGISTROS COM DELETE
--DELETE: exclui registros de uma tabela. a sintaxe basica é: DELETE FROM nome_da_tabela WHERE condiçao
insert into Alunos (Nome, Email, Turma, DataNascimento)
values ('Aluno Teste', 'teste.remover@escola.com', '2INFO-A', '2008-01-01');

delete from Alunos
where Email = 'teste.remover@escola.com';

--FUNÇOES DE TEXTO E DATA
select
Nome,
UPPER(Nome) as NomeEmMaiusculo, --CONVERTE O NOME PARA MAIU]ÚSCULO
LOWER(Nome) as NomeEmMinusculo,-- CONVERTE O NOME PARA MINUSCULO
LEN(Nome) as QuantidadeCaracteres, -- RETORNA A QUANTIDADE DE CARACTÉRES DO NOME
CONCAT(Nome, ' - ', Turma) as NomeETurma, -- CONCACTENA O NOME E A TURMA
FORMAT(DataNascimento, 'dd/MM/yyyy') as DataNascimentoFormatada, -- FORMATA A DATA
DATEDIFF(year, DataNascimento, getdate()) as IdadeAproximada -- CALCULA A IDADE DO ALUNO
from Alunos;

select * from Alunos;

--FUNÇOES DE CALCULO E AGRUPAMENTO

--QUANTIDADE DE ALUNOS CADASTRADOS
select count(*) as QuantidadeDeAlunos
from Alunos;

--QUANTIDADE DE MATRICULAS QUE JA POSSUEM NOTA FINAL
select count(NotaFinal) as QuantidadeDeMatriculasComNota
from Matriculas;

--MÉDIA, MIOR E MENOR NOTA (DADOS NULOS SAO DESCONSIDERADOS)
select
    avg(NotaFinal) as MediaDasNotas,
    max(NotaFinal) as MaiorNota,
    min(NotaFinal) as MenorNota
from Matriculas;

--TROCA NULL POR UM TEXTO QUE EXIBE O RESULTADO DE FORMA MAIS CLARA
select
    IdMatricula, ISNULL(convert(varchar(10), NotaFinal), 'Sem Nota') as NotaFinal,
    StatusMatricula
from Matriculas;

--GROUP BY E HAVING: agrupa os registros por uma ou mais colunas e permite filtrar os grupos com base em uma condiçao
--QUANTOS ALUNOS ESTAO MATRICULADOS EM CADA TURMA
select Turma, count(*) as QuantidadeDeAlunos from Alunos
group by Turma
order by QuantidadeDeAlunos desc;

--CURSOS QUE TEM DUAS OU MAIS MATRICULAS
select IdCurso, count(*) as QuantidadeDeMatriculas from Matriculas
group by IdCurso
having count(*) >= 2 --FILTRA OS CURSOS QUE TEM DUAS OU MAIS MATRICULAS
order by QuantidadeDeMatriculas desc;

--RELACIONANDO TABELAS COM JOIN: permite combinar registros de duas ou maaais tabelas com base em uma condiçao de correspondencia
select
    a.Nome as NomeDoAluno,
    c.NomeCurso as NomeDoCurso,
    m.NotaFinal,
    m.StatusMatricula
from Matriculas as m
inner join Alunos as a
    on m.IdAluno = a.IdAluno --RELACIONA A TABELA MATRICULA COM A TABELA ALUNOS
inner join Cursos as c
    on m.IdCurso = c.IdCurso --RELACIONA A TABELA MATRICULA COM A TABELA CURSOS
order by a.Nome; --ORDENA O RESULTADO PELO NOME O ALUNO

--
select
    a.Nome as Aluno,
    a.Turma,
    c.NomeCurso as Curso,
    p.Nome as Professor,
    m.NotaFinal,
    m.StatusMatricula
from Matriculas as m
inner join Alunos as a
    on m.IdAluno = a.IdAluno --RELACIONA A TABELA MATRICULA COM A TABELA ALUNOS
inner join Cursos as c
    on m.IdCurso = c.IdCurso --RELACIONA A TABELA MATRICULA COM A TABELA CURSOS
inner join Professores as p
    on c.IdProfessor = p.IdProfessor--RELACIONA A TABELA MATRICULA COM A TABELA PROFESSORES
order by p.Nome, c.NomeCurso, a.Nome;

select
    a.Nome as NomeDoAluno,
    c.NomeCurso as NomeDoCurso,
    m.NotaFinal,
    m.StatusMatricula
from Alunos as a
left join Matriculas as m
    on a.IdAluno = m.IdAluno
left join Cursos as c
    on m.IdCurso = c.IdCurso
where m.IdMatricula is null
order by a.Nome;

--JOIN COM FILTRO E MEDIA POR CURSO: retorna a media das notas finais por curso, considerando apenas os alunos que possuem matricula
SELECT
    c.NomeCurso as curso,
    count(m.IdMatricula) as TotalDeMatriculas,
    avg(m.NotaFinal) as MediaDoCurso
from Cursos as c
left join Matriculas as m
    on c.IdCurso = m.IdCurso
where m.NotaFinal is NOT NULL
group by c.NomeCurso
order by c.NomeCurso;

--ERROR: o email ja foi usado por alice
insert into Alunos (Nome, Email, Turma, DataNascimento)
values ('Outra Alice', 'alice.pereira@escola.com', '2INFO-A', '2008-09-11');

--ERROR: nao existe aluno de ID 999
insert into Matriculas (IdAluno, IdCurso, NotaFinal)
values (999, 1, 8.00);

--ERROR: a nota nao pode ser maior que 10
update Matriculas
set NotaFinal = 12.00
where IdMatricula = 1;