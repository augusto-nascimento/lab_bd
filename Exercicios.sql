-- 4Exercícios de SQL - parte 1
-- A. INSERIR REGISTROS PARA TODAS AS TABELAS RESPEITANDO AS INTEGRIDADES.

-- 1.Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre 2002/1
select distinct CodDepto
from turma
where AnoSem = 20021

-- 2.Obter os códigos dos professores que são do departamento de código 'INF01' e que ministraram ao menos uma turma em 2002/1.
select distinct CodProf
from profturma
where CodDepto = 'INF01' and AnoSem = 20021

-- 3.Obter os horários de aula (dia da semana,hora inicial e número de horas ministradas) do professor "Antunes" em 20021.
select h.DiaSem, h.HoraInicio, h.NumHoras
from horario h
inner join (
	select AnoSem, CodDepto, NumDisc, SiglaTur
	from profturma
	where CodProf in (
		select CodProf
		from lab_db.professor
		where NomeProf = 'Antunes'
	)
	and AnoSem = 20021
) q
on 
	h.AnoSem = q.AnoSem 
	and h.CodDepto = q.CodDepto
	and h.NumDisc = q.NumDisc
	and h.SiglaTur = q.SiglaTur

	


-- 4.Obter os nomes dos departamentos que têm turmas que, em 2002/1, têm aulas na sala 101 do prédio denominado 'Informática - aulas'.
-- 5.Obter os códigos dos professores com título denominado 'Doutor' que não ministraram aulas em 2002/1.
-- 6.Obter os identificadores das salas (código do prédio e número da sala) que, em 2002/1:
    -- nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do departamento 'Informática', e
    -- nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma ministrada pelo professor denominado 'Antunes'.
-- 7.Obter o dia da semana, a hora de início e o número de horas de cada horário de cada turma ministrada por um professor de nome 'Antunes', em 2002/1, na sala número 101 do prédio de código 43423.
-- 8.Um professor pode ministrar turmas de disciplinas pertencentes a outros departamentos. Para cada professor que já ministrou aulas em disciplinas de outros departamentos, obter o código do professor, seu nome, o nome de seu departamento e o nome do departamento no qual ministrou disciplina.
-- 9.Obter o nome dos professores que possuem horários conflitantes (possuem turmas que tenham a mesma hora inicial, no mesmo dia da semana e no mesmo semestre). Além dos nomes, mostrar as chaves primárias das turmas em conflito.
-- 10.Para cada disciplina que possui pré-requisito, obter o nome da disciplina seguido do nome da disciplina que é seu pré-requisito.
-- 11.Obter os nomes das disciplinas que não têm pré-requisito.
-- 12.Obter o nome de cada disciplina que possui ao menos dois pré-requisitos.
