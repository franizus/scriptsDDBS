alter table MATERIA_CARRERA_QUITUMBE
   drop constraint FK_MATERIA__MATERIA_C_CARRERA_
go
alter table ESTUDIANTE_QUITUMBE
   drop constraint FK_ESTUDIAN_ESTUDIANT_CARRERA_
go
ALTER TABLE CARRERA_QUITUMBE DROP CONSTRAINT PK_CARRERA_QUITUMBE
ALTER TABLE CARRERA_QUITUMBE add CONSTRAINT PK_CARRERA_QUITUMBE primary key (ID_CARRERA, NODO)
ALTER TABLE CARRERA_QUITUMBE add CONSTRAINT OK_NODO CHECK (NODO = 2)
ALTER TABLE CARRERA_QUITUMBE add CONSTRAINT OK_CAMPUS CHECK (CAMPUS = 2)
alter table ESTUDIANTE_QUITUMBE
   add constraint FK_ESTUDIAN_ESTUDIANT_CARRERA_ foreign key (ID_CARRERA, NODO)
      references CARRERA_QUITUMBE (ID_CARRERA, NODO)
go
alter table MATERIA_CARRERA_QUITUMBE
   add constraint FK_MATERIA__MATERIA_C_CARRERA_ foreign key (ID_CARRERA, NODO)
      references CARRERA_QUITUMBE (ID_CARRERA, NODO)
go

sp_help MATERIA_CARRERA_QUITUMBE

ALTER TABLE PROFESOR_MATERIA_QUITUMBE DROP CONSTRAINT PK_PROFESOR_MATERIA_QUITUMBE
ALTER TABLE PROFESOR_MATERIA_QUITUMBE add CONSTRAINT PK_PROFESOR_MATERIA_QUITUMBE primary key (ID_PROF, ID_MATERIA, NODO)
ALTER TABLE PROFESOR_MATERIA_QUITUMBE add CONSTRAINT OK_NODOPM CHECK (NODO = 2)



alter table ESTUDIANTE_MATERIA_QUITUMBE
   drop constraint FK_ESTUDIAN_ESTUDIANT_ESTUDIAN
go
ALTER TABLE ESTUDIANTE_QUITUMBE DROP CONSTRAINT PK_ESTUDIANTE_QUITUMBE
ALTER TABLE ESTUDIANTE_QUITUMBE add CONSTRAINT PK_ESTUDIANTE_QUITUMBE primary key (ID_ESTUDIANTE, NODO)
ALTER TABLE ESTUDIANTE_QUITUMBE add CONSTRAINT OK_NODOEST CHECK (NODO = 2)
alter table ESTUDIANTE_MATERIA_QUITUMBE
   add constraint FK_ESTUDIAN_ESTUDIANT_ESTUDIAN foreign key (ID_ESTUDIANTE, NODO)
      references ESTUDIANTE_QUITUMBE (ID_ESTUDIANTE, NODO)
go



alter table PROFESOR_MATERIA_QUITUMBE
   drop constraint FK_PROFESOR_PROFESOR__MATERIA_
go
alter table MATERIA_CARRERA_QUITUMBE
   drop constraint FK_MATERIA__MATERIA_C_MATERIA_
go
alter table ESTUDIANTE_MATERIA_QUITUMBE
   drop constraint FK_ESTUDIAN_ESTUDIANT_MATERIA_
go
ALTER TABLE MATERIA_QUITUMBE DROP CONSTRAINT PK_MATERIA_QUITUMBE
ALTER TABLE MATERIA_QUITUMBE add CONSTRAINT PK_MATERIA_QUITUMBE primary key (ID_MATERIA, NODO)
ALTER TABLE MATERIA_QUITUMBE add CONSTRAINT OK_NODOM CHECK (NODO = 2)
alter table PROFESOR_MATERIA_QUITUMBE
   add constraint FK_PROFESOR_PROFESOR__MATERIA_ foreign key (ID_MATERIA, NODO)
      references MATERIA_QUITUMBE (ID_MATERIA, NODO)
go
alter table MATERIA_CARRERA_QUITUMBE
   add constraint FK_MATERIA__MATERIA_C_MATERIA_ foreign key (ID_MATERIA, NODO)
      references MATERIA_QUITUMBE (ID_MATERIA, NODO)
go
alter table ESTUDIANTE_MATERIA_QUITUMBE
   add constraint FK_ESTUDIAN_ESTUDIANT_MATERIA_ foreign key (ID_MATERIA, NODO)
      references MATERIA_QUITUMBE (ID_MATERIA, NODO)
go



ALTER TABLE ESTUDIANTE_MATERIA_QUITUMBE DROP CONSTRAINT PK_ESTUDIANTE_MATERIA_QUITUMBE
ALTER TABLE ESTUDIANTE_MATERIA_QUITUMBE add CONSTRAINT PK_ESTUDIANTE_MATERIA_QUITUMBE primary key (ID_ESTUDIANTE, ID_MATERIA, NODO)
ALTER TABLE ESTUDIANTE_MATERIA_QUITUMBE add CONSTRAINT OK_NODOEM CHECK (NODO = 2)



ALTER TABLE MATERIA_CARRERA_QUITUMBE DROP CONSTRAINT PK_MATERIA_CARRERA_QUITUMBE
ALTER TABLE MATERIA_CARRERA_QUITUMBE add CONSTRAINT PK_MATERIA_CARRERA_QUITUMBE primary key (ID_MATERIA, ID_CARRERA, NODO)
ALTER TABLE MATERIA_CARRERA_QUITUMBE add CONSTRAINT OK_NODOMC CHECK (NODO = 2)



alter table PROFESOR_MATERIA_QUITUMBE
   drop constraint FK_PROFESOR_PROFESOR__PROFESOR
go
ALTER TABLE PROFESOR_DATOS_QUITUMBE DROP CONSTRAINT PK_PROFESOR_DATOS_QUITUMBE
ALTER TABLE PROFESOR_DATOS_QUITUMBE add CONSTRAINT PK_PROFESOR_DATOS_QUITUMBE primary key (ID_PROF, NODO)
ALTER TABLE PROFESOR_DATOS_QUITUMBE add CONSTRAINT OK_NODOPROF CHECK (NODO = 2)
alter table PROFESOR_MATERIA_QUITUMBE
   add constraint FK_PROFESOR_PROFESOR__PROFESOR foreign key (ID_PROF, NODO)
      references PROFESOR_DATOS_QUITUMBE (ID_PROF, NODO)
go







/*
VISTAS
*/
CREATE VIEW V_CARRERA
AS
SELECT ID_CARRERA, NOMBRE, N_SEMESTRES, CAMPUS, NODO 
FROM [WIN-PS6SN3G9U9I].UPS_GIRON.dbo.CARRERA_GIRON
UNION ALL
SELECT ID_CARRERA, NOMBRE, N_SEMESTRES, CAMPUS, NODO 
FROM [WIN-4AJTKV7N3B1].UPS_QUITUMBE.dbo.CARRERA_QUITUMBE

SELECT * FROM V_CARRERA



CREATE VIEW V_PROFESOR_MATERIA
AS
SELECT * FROM [WIN-PS6SN3G9U9I].UPS_GIRON.dbo.PROFESOR_MATERIA_GIRON
UNION ALL
SELECT * FROM [WIN-4AJTKV7N3B1].UPS_QUITUMBE.dbo.PROFESOR_MATERIA_QUITUMBE

SELECT * FROM V_PROFESOR_MATERIA



CREATE VIEW V_ESTUDIANTE
AS
SELECT *
FROM [WIN-PS6SN3G9U9I].UPS_GIRON.dbo.ESTUDIANTE_GIRON
UNION ALL
SELECT *
FROM [WIN-4AJTKV7N3B1].UPS_QUITUMBE.dbo.ESTUDIANTE_QUITUMBE

SELECT * FROM V_ESTUDIANTE



CREATE VIEW V_MATERIA
AS
SELECT *
FROM [WIN-PS6SN3G9U9I].UPS_GIRON.dbo.MATERIA_GIRON
UNION ALL
SELECT *
FROM [WIN-4AJTKV7N3B1].UPS_QUITUMBE.dbo.MATERIA_QUITUMBE

SELECT * FROM V_MATERIA



CREATE VIEW V_ESTUDIANTE_MATERIA
AS
SELECT * FROM [WIN-PS6SN3G9U9I].UPS_GIRON.dbo.ESTUDIANTE_MATERIA_GIRON
UNION ALL
SELECT * FROM [WIN-4AJTKV7N3B1].UPS_QUITUMBE.dbo.ESTUDIANTE_MATERIA_QUITUMBE

SELECT * FROM V_ESTUDIANTE_MATERIA



CREATE VIEW V_MATERIA_CARRERA
AS
SELECT * FROM [WIN-PS6SN3G9U9I].UPS_GIRON.dbo.MATERIA_CARRERA_GIRON
UNION ALL
SELECT * FROM [WIN-4AJTKV7N3B1].UPS_QUITUMBE.dbo.MATERIA_CARRERA_QUITUMBE

SELECT * FROM V_MATERIA_CARRERA



CREATE VIEW V_PROFESOR_DATOS
AS
SELECT *
FROM [WIN-PS6SN3G9U9I].UPS_GIRON.dbo.PROFESOR_DATOS_GIRON
UNION ALL
SELECT *
FROM [WIN-4AJTKV7N3B1].UPS_QUITUMBE.dbo.PROFESOR_DATOS_QUITUMBE

SELECT * FROM V_PROFESOR_DATOS

set xact_abort on
begin distributed transaction 
select * from CARRERA_QUITUMBE
commit 

