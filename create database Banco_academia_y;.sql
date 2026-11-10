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

--DIFERENTE DE: 
select Nome, Turma from Alunos
where Turma <> '2INFO-A';

--AND: 
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