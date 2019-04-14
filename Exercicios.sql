-- 4Exerc�cios de SQL - parte 1
-- A. INSERIR REGISTROS PARA TODAS AS TABELAS RESPEITANDO AS INTEGRIDADES.

-- 1.Obter os c�digos dos diferentes departamentos que tem turmas no ano-semestre 2002/1
select distinct CodDepto
from lab_db.turma
where AnoSem = 20021;

-- 2.Obter os c�digos dos professores que s�o do departamento de c�digo 'INF01' e que ministraram ao menos uma turma em 2002/1.
select distinct CodProf
from lab_db.profturma
where CodDepto = 'INF01' and AnoSem = 20021


-- 3.Obter os hor�rios de aula (dia da semana,hora inicial e n�mero de horas ministradas) do professor "Antunes" em 20021.
-- 4.Obter os nomes dos departamentos que t�m turmas que, em 2002/1, t�m aulas na sala 101 do pr�dio denominado 'Inform�tica - aulas'.
-- 5.Obter os c�digos dos professores com t�tulo denominado 'Doutor' que n�o ministraram aulas em 2002/1.
-- 6.Obter os identificadores das salas (c�digo do pr�dio e n�mero da sala) que, em 2002/1:
    -- nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do departamento 'Inform�tica', e
    -- nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma ministrada pelo professor denominado 'Antunes'.
-- 7.Obter o dia da semana, a hora de in�cio e o n�mero de horas de cada hor�rio de cada turma ministrada por um professor de nome 'Antunes', em 2002/1, na sala n�mero 101 do pr�dio de c�digo 43423.
-- 8.Um professor pode ministrar turmas de disciplinas pertencentes a outros departamentos. Para cada professor que j� ministrou aulas em disciplinas de outros departamentos, obter o c�digo do professor, seu nome, o nome de seu departamento e o nome do departamento no qual ministrou disciplina.
-- 9.Obter o nome dos professores que possuem hor�rios conflitantes (possuem turmas que tenham a mesma hora inicial, no mesmo dia da semana e no mesmo semestre). Al�m dos nomes, mostrar as chaves prim�rias das turmas em conflito.
-- 10.Para cada disciplina que possui pr�-requisito, obter o nome da disciplina seguido do nome da disciplina que � seu pr�-requisito.
-- 11.Obter os nomes das disciplinas que n�o t�m pr�-requisito.
-- 12.Obter o nome de cada disciplina que possui ao menos dois pr�-requisitos.
