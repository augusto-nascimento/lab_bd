use lab_db;

SET FOREIGN_KEY_CHECKS=0;

drop table if exists PreReq cascade;
drop table if exists Disciplina cascade;
drop table if exists Turma cascade;
drop table if exists Horario cascade;
drop table if exists Sala cascade;
drop table if exists Predio cascade;
drop table if exists Depto cascade;
drop table if exists Professor cascade;
drop table if exists ProfTurma cascade;
drop table if exists Titulacao cascade;


create table if not exists PreReq (
	CodDeptoPreReq char(5),
    NumDiscPreReq int,
    CodDepto char(5),
    NumDisc int4
);


create table if not exists Disciplina (
	CodDepto char(5),
    NumDisc int,
    NomeDisc varchar(10),
	CreditoDisc int
);


create table if not exists Turma (
	AnoSem int,
	CodDepto char(5),
	NumDisc int,
	SiglaTur char(2),
	CapacTur int
);


create table if not exists Horario (
	AnoSem int,
	CodDepto char(5),
	NumDisc int,
	SiglaTur char(2),
	DiaSem int,
	HoraInicio int,
	NumSala int,
	CodPred int,
	NumHoras int
);


create table if not exists Sala (
	CodPred int,
	NumSala int,
	DescricaoSala varchar(40),
	CapacSala int
);


create table if not exists Predio (
	CodPred int,
	NomePred varchar(40)
);


create table if not exists Depto (
	CodDepto char(5),
	NomeDepto varchar(40)
);


create table if not exists Professor (
	CodProf int,
	CodDepto char(5),
	CodTit int,
	NomeProf varchar(40)
);


create table if not exists ProfTurma (
	AnoSem int,
	CodDepto char(5),
	NumDisc int,
	SiglaTur char(2),
	CodProf int
);


create table if not exists Titulacao (
	CodTit int,
	NomeTit varchar(40)
);


alter table Predio add primary key (CodPred);
alter table Sala add foreign key (CodPred) references Predio(CodPred);
alter table Sala add primary key (CodPred, NumSala);
alter table Depto add primary key (CodDepto);
alter table Titulacao add primary key (CodTit);
alter table Professor add primary key (CodProf);
alter table Professor add foreign key (CodDepto) references Depto(CodDepto);
alter table Professor add foreign key (CodTit) references Titulacao(CodTit);
alter table Disciplina add foreign key (CodDepto) references Depto(CodDepto);
alter table Disciplina add primary key (CodDepto, NumDisc);
alter table Turma add foreign key (CodDepto, NumDisc) references Disciplina(CodDepto, NumDisc);
alter table Turma add primary key (AnoSem, CodDepto, NumDisc, SiglaTur);

alter table PreReq add foreign key (CodDepto, NumDisc) references Disciplina (CodDepto, NumDisc);
alter table PreReq add foreign key (CodDeptoPreReq, NumDiscPreReq) references Disciplina(CodDepto, NumDisc);
alter table PreReq add primary key (CodDepto, NumDisc, CodDeptoPreReq, NumDiscPreReq);

alter table ProfTurma add foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) references Turma(AnoSem, CodDepto, NumDisc, SiglaTur);
alter table ProfTurma add foreign key (CodProf) references Professor(CodProf);
alter table ProfTurma add primary key (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf);

alter table Horario add foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) references Turma(AnoSem, CodDepto, NumDisc, SiglaTur);
alter table Horario add foreign key (CodPred, NumSala) references Sala(CodPred, NumSala);
alter table Horario add primary key (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio)


SET FOREIGN_KEY_CHECKS=1;
