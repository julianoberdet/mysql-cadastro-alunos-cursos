-- ============================================================
-- PROJETO: MySQL Cadastro | 20 Exercícios - Fácil ao Pleno
-- Autor: Juliano Berdet | Alunos (a) e Cursos (c)
-- ============================================================

-- ================= NIVEL 1 - BÁSICO - SEM JOIN =================

-- 01 - Fácil - Aquecimento - Listar nome, peso, altura
SELECT id, nome, peso, altura FROM alunos;

-- 02 - Fácil - Brasileiros com mais de 1.80m
SELECT a.nome, a.peso, a.altura, a.nacionalidade
FROM alunos AS a
WHERE a.nacionalidade = 'Brasil' AND a.altura > 1.80
ORDER BY a.altura DESC;

-- 03 - Fácil - Profissões terminadas em eiro/eira
SELECT a.nome, a.profissao, a.peso
FROM alunos AS a
WHERE a.profissao LIKE '%eiro' OR a.profissao LIKE '%eira'
ORDER BY a.profissao ASC;

-- 04 - Fácil/Médio - Top 10 mais altos
SELECT nome, altura FROM alunos ORDER BY altura DESC LIMIT 10;

-- 05 - Fácil/Médio - Alunos nascidos depois de 2000
SELECT nome, nascimento FROM alunos WHERE nascimento > '2000-01-01';

-- ================= NIVEL 2 - MÉDIO - FILTROS E GROUP BY =================

-- 06 - Médio - Quantidade por sexo
SELECT sexo, COUNT(*) AS total FROM alunos GROUP BY sexo;

-- 07 - Médio - Total por nacionalidade
SELECT a.nacionalidade, COUNT(*) AS total
FROM alunos AS a
GROUP BY a.nacionalidade
ORDER BY total DESC;

-- 08 - Médio - Profissões diferentes sem repetir
SELECT DISTINCT profissao FROM alunos ORDER BY profissao;

-- 09 - Médio - Média peso e altura por sexo
SELECT a.sexo, AVG(a.peso) AS media_peso, AVG(a.altura) AS media_altura, COUNT(*) AS total_pessoas
FROM alunos AS a
GROUP BY a.sexo;

-- 10 - Médio - Média de peso por nacionalidade
SELECT a.nacionalidade, AVG(a.peso) AS media_peso
FROM alunos AS a
GROUP BY a.nacionalidade
ORDER BY media_peso DESC;

-- 11 - Médio - Profissões com 3 ou mais alunos
SELECT a.profissao, COUNT(*) AS total_alunos
FROM alunos AS a
GROUP BY a.profissao
HAVING total_alunos > 2
ORDER BY total_alunos DESC;

-- 12 - Médio - Total por sexo (o mais cobrado em prova Jr)
SELECT a.sexo, COUNT(*) AS total FROM alunos AS a GROUP BY a.sexo;

-- ================= NIVEL 3 - DIFÍCIL / JÚNIOR / PLENO - JOINS =================

-- 13 - Difícil - INNER JOIN clássico - Cursos de 2016
SELECT a.nome AS nome_aluno, c.nome AS nome_curso, c.ano
FROM alunos AS a
INNER JOIN cursos AS c ON c.idcurso = a.cursopreferido
WHERE c.ano = 2016
ORDER BY a.nome;

-- 14 - Difícil - JOIN com carga > 30h
SELECT a.nome AS nome_aluno, c.nome AS nome_curso, c.carga
FROM alunos AS a
INNER JOIN cursos AS c ON c.idcurso = a.cursopreferido
WHERE c.carga > 30
ORDER BY c.carga DESC;

-- 15 - Difícil - LEFT JOIN - TODOS os alunos mesmo sem curso
SELECT a.nome, a.profissao, c.nome AS curso_preferido
FROM alunos AS a
LEFT JOIN cursos AS c ON c.idcurso = a.cursopreferido
ORDER BY a.nome;

-- 16 - Difícil - Limpeza de base - Quem NÃO tem curso (o pulo do gato)
SELECT a.nome AS nome_aluno
FROM alunos AS a
LEFT JOIN cursos AS c ON a.cursopreferido = c.idcurso
WHERE c.idcurso IS NULL;

-- 17 - Júnior - Curso mais popular - Top 5
SELECT c.nome AS nome_curso, COUNT(a.id) AS total_alunos
FROM cursos AS c
INNER JOIN alunos AS a ON c.idcurso = a.cursopreferido
GROUP BY c.nome
ORDER BY total_alunos DESC
LIMIT 5;

-- 18 - Júnior - Cursos com média peso > 70kg - HAVING com AVG
SELECT c.nome, AVG(a.peso) AS media_peso
FROM cursos AS c
INNER JOIN alunos AS a ON c.idcurso = a.cursopreferido
GROUP BY c.nome
HAVING media_peso > 70;

-- 19 - Júnior - Programadores + nome do curso
SELECT a.nome, a.profissao, c.nome AS nome_curso
FROM alunos AS a
INNER JOIN cursos AS c ON c.idcurso = a.cursopreferido
WHERE a.profissao LIKE '%programador%';

-- 20 - Júnior Pleno - O BRABO FINAL - Top 3 cursos de 2016 mais pesados
SELECT c.nome AS nome_curso, AVG(a.peso) AS media_peso, COUNT(a.id) AS qtd_alunos, c.ano
FROM alunos AS a
INNER JOIN cursos AS c ON c.idcurso = a.cursopreferido
WHERE c.ano = 2016
GROUP BY c.nome, c.ano
HAVING qtd_alunos >= 2
ORDER BY media_peso DESC
LIMIT 3;