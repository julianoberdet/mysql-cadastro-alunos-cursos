# MySQL - Sistema Cadastro de Alunos e Cursos | 20 Análises

> Projeto de Análise de Dados com MySQL - Do básico ao Pleno - Portfólio para vaga de Analista de Dados Jr

**Autor:** Juliano Berdet | Pelotas/RS | Analista de Dados Jr

### Sobre o Projeto
Banco `cadastro` com 2 tabelas reais:
- **alunos:** id, nome, nascimento, sexo, peso, altura, nacionalidade, profissao, cursopreferido
- **cursos:** idcurso, nome, descricao, carga, totaulas, ano

Base com brasileiros e estrangeiros, cursos de 2014 a 2016, cargas de 8h a 40h+, e vários NULL no cursopreferido - cenário perfeito para treinar limpeza de dados.

### Estrutura
- `banco/cadastro.sql` -> Criação do banco e tabelas
- `queries/analise_dados.sql` -> 20 exercícios comentados

### Tecnologias
MySQL | MySQL Workbench | VS Code | Git & GitHub

### Os 20 Exercícios - Organizados por Nível

#### NÍVEL 1 - BÁSICO - Sem JOIN
- **01:** Listar todos os alunos
- **02:** Brasileiros com altura > 1.80m | `WHERE + ORDER BY`
- **03:** Profissões terminadas em eiro/eira | `LIKE '%eiro'`
- **04:** Top 10 mais altos | `ORDER BY + LIMIT`
- **05:** Nascidos depois de 2000 | `WHERE com data`

#### NÍVEL 2 - MÉDIO - Agregação
- **06:** Total por sexo | `GROUP BY`
- **07:** Total por nacionalidade | `GROUP BY + COUNT + ORDER BY DESC`
- **08:** Profissões distintas | `DISTINCT`
- **09:** Média de peso e altura por sexo | `AVG + GROUP BY`
- **10:** Média de peso por nacionalidade
- **11:** Profissões com 3 ou mais alunos | `GROUP BY + HAVING`
- **12:** Total por sexo - o clássico de prova técnica

#### NÍVEL 3 - DIFÍCIL / JÚNIOR / PLENO - JOINs
- **13:** Quem prefere cursos de 2016 | `INNER JOIN + WHERE ano = 2016`
- **14:** Cursos com carga > 30h | `JOIN + WHERE carga`
- **15:** TODOS os alunos mesmo sem curso | `LEFT JOIN`
- **16:** Limpeza - Quem NÃO tem curso | `LEFT JOIN + WHERE c.idcurso IS NULL` - **Esse cai em entrevista!**
- **17:** Top 5 cursos mais populares | `JOIN + COUNT + ORDER BY DESC + LIMIT 5`
- **18:** Cursos com média de peso > 70kg | `JOIN + GROUP BY + HAVING AVG`
- **19:** Programadores + nome do curso | `JOIN + LIKE`
- **20:** TOP 3 cursos de 2016 mais pesados | `JOIN + WHERE + GROUP BY + HAVING + AVG + ORDER BY + LIMIT` - **Relatório do chefe**

### Insights Encontrados
- Mais de 50 registros órfãos sem curso preferido - tratados com LEFT JOIN + IS NULL
- Ranking dos cursos mais procurados
- Distribuição por sexo, nacionalidade e profissão
- Cursos com maior carga vs. perfil de peso dos alunos

### Como Rodar
```sql
-- 1. Crie o banco
CREATE DATABASE cadastro;
USE cadastro;

-- 2. Rode o banco/cadastro.sql

-- 3. Rode queries/analise_dados.sql do 01 ao 20