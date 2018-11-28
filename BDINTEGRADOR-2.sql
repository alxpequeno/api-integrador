/* DROP PROCEDURES */

IF OBJECT_ID('SP_TUTOR_INSERT') IS NOT NULL
    DROP PROCEDURE SP_TUTOR_INSERT
GO

IF OBJECT_ID('SP_LISTA_TUTORES_PENDIENTES') IS NOT NULL
    DROP PROCEDURE SP_LISTA_TUTORES_PENDIENTES
GO

IF OBJECT_ID('SP_LOGIN') IS NOT NULL
    DROP PROCEDURE SP_LOGIN
GO

IF OBJECT_ID('SP_OBTENERTUTORXID') IS NOT NULL
    DROP PROCEDURE  SP_OBTENERTUTORXID
GO

IF OBJECT_ID('SP_TUTOR_DELETE') IS NOT NULL
    DROP PROCEDURE  SP_TUTOR_DELETE
GO

IF OBJECT_ID('SP_TUTOR_LISTAR') IS NOT NULL
    DROP PROCEDURE  SP_TUTOR_LISTAR
GO

IF OBJECT_ID('SP_TUTOR_UPDATE') IS NOT NULL
    DROP PROCEDURE  SP_TUTOR_UPDATE
GO

IF OBJECT_ID('SP_EMP_DELETE') IS NOT NULL
    DROP PROCEDURE  SP_EMP_DELETE
GO

IF OBJECT_ID('SP_EMP_UPDATE') IS NOT NULL
    DROP PROCEDURE  SP_EMP_UPDATE
GO

IF OBJECT_ID('SP_EMP_INSERT') IS NOT NULL
    DROP PROCEDURE  SP_EMP_INSERT
GO

IF OBJECT_ID('SP_EMP_LISTAR') IS NOT NULL
    DROP PROCEDURE  SP_EMP_LISTAR
GO

IF OBJECT_ID('SP_ALUMNO_LISTAR') IS NOT NULL
    DROP PROCEDURE  SP_ALUMNO_LISTAR
GO

IF OBJECT_ID('SP_ALUMNO_INSERT') IS NOT NULL
    DROP PROCEDURE  SP_ALUMNO_INSERT
GO

IF OBJECT_ID('SP_OBTENER_ALUMNO_X_ID') IS NOT NULL
    DROP PROCEDURE  SP_OBTENER_ALUMNO_X_ID
GO

IF OBJECT_ID('SP_OBTENER_ALUMNO_X_ID') IS NOT NULL
    DROP PROCEDURE SP_OBTENER_ALUMNO_X_ID
GO

IF OBJECT_ID('SP_ALUMNO_UPDATE') IS NOT NULL
    DROP PROCEDURE SP_ALUMNO_UPDATE
GO


IF OBJECT_ID('SP_ALUMNO_DELETE') IS NOT NULL
    DROP PROCEDURE SP_ALUMNO_DELETE
GO


IF OBJECT_ID('SP_ALUMNO_INSERT') IS NOT NULL
    DROP PROCEDURE SP_ALUMNO_INSERT
GO


IF OBJECT_ID('SP_ALUMNO_LISTAR') IS NOT NULL
    DROP PROCEDURE SP_ALUMNO_LISTAR
GO

IF OBJECT_ID('SP_TUTORIA_INSERT') IS NOT NULL
    DROP PROCEDURE SP_TUTORIA_INSERT
GO


/* DROP TABLES */

IF OBJECT_ID('USUARIO') IS NOT NULL
    DROP TABLE USUARIO
GO

IF OBJECT_ID('DETALLE_TUTOR') IS NOT NULL
    DROP TABLE DETALLE_TUTOR
GO


IF OBJECT_ID('TUTORIA') IS NOT NULL
    DROP TABLE TUTORIA
GO

IF OBJECT_ID('MATRICULA_TUTORIA') IS NOT NULL
    DROP TABLE MATRICULA_TUTORIA
GO

/* CREATE TABLES */

CREATE TABLE USUARIO (
    Id			INT		     NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
	Nombre		VARCHAR(50)  NOT NULL,
	Apellido	VARCHAR(50)  NOT NULL,
	Direccion	VARCHAR(50)  NOT NULL,
	Email		VARCHAR(100) NOT NULL   UNIQUE,
	Clave		VARCHAR(50)  NOT NULL,
    isEmpleado  BIT          NOT NULL,
    isTutor     BIT          NOT NULL,
    isAlumno    BIT          NOT NULL,
    Estado      BIT          NOT NULL,
    FechaRegistro DATE       NOT NULL   DEFAULT GETDATE()    
)
GO

CREATE TABLE DETALLE_TUTOR(
    IdUsuario   INT,
    isAceptado  BIT,
    Foto        VARCHAR(MAX),
    Curriculum  VARCHAR(MAX),
    Antecedentes VARCHAR(MAX),
    Recibo       VARCHAR(MAX)
)
GO



CREATE TABLE TUTORIA(
idTutoria int identity(1,1) primary key,
tituloTutoria varchar(100) not null,
categoriaTutoria varchar(50) not null,
Foto        VARCHAR(MAX),
fechaTutoria datetime not null,
horaTutoria varchar(10) not null,
ubicacionTutoria varchar(50) not null,
precioTutoria money not null,
descripcionTutoria varchar(500) not null,
 estadoTutoria BIT not null,
idTutor int references USUARIO
)
GO

CREATE TABLE MATRICULA_TUTORIA(
idTutoria  int references TUTORIA,
idTutor int references USUARIO,
)
go
/* CREATE PROCEDURES */

CREATE PROCEDURE SP_LOGIN
    @email		VARCHAR(100),
	@clave		VARCHAR(50)
AS
BEGIN
    SELECT * FROM USUARIO
    WHERE Email = @email AND Clave = @clave AND Estado = 'true'
END
GO

CREATE PROCEDURE SP_TUTOR_INSERT
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(100),
	@clave		VARCHAR(50)
AS
BEGIN
    INSERT USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
    VALUES (@nombre, @apellido, @direccion, @email, @clave, 'false', 'true', 'false','true')
    
    DECLARE @ID INT = SCOPE_IDENTITY()

    INSERT DETALLE_TUTOR values(@ID,'false','FotoURL','CVURL','AntecedentesURL','ReciboURL')
END
GO

CREATE PROCEDURE SP_LISTA_TUTORES_PENDIENTES
AS
BEGIN
    SELECT U.*, D.Foto, D.Curriculum, D.Antecedentes, D.Recibo, CONVERT(char(10), U.FechaRegistro,103) as FechaFormato FROM USUARIO U
    INNER JOIN DETALLE_TUTOR D ON (D.IdUsuario = U.Id)
    WHERE 
        isTutor = 'true'
        AND D.isAceptado = 'false'
    ORDER BY 
        u.FechaRegistro DESC
END
GO

CREATE PROCEDURE SP_TUTOR_DELETE
@id int
as
update usuario set Estado='false' where @id=Id
go

CREATE PROCEDURE SP_TUTOR_LISTAR
as
select Id,Nombre,Apellido,Direccion,Email,Clave from
usuario where isTutor='true' and Estado='true'
go

CREATE PROCEDURE SP_TUTOR_UPDATE
    @id   int,
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(100),
	@clave		VARCHAR(50)
AS
    UPDATE usuario 
    set Nombre=@nombre,Apellido=@apellido,Direccion=@direccion,Email=@email,Clave=@clave
	where Id = @id
GO



CREATE PROCEDURE SP_EMP_DELETE
@id int
as
update usuario set Estado='false' where @id=Id
go

CREATE PROCEDURE SP_EMP_LISTAR
as
select Id,Nombre,Apellido,Direccion,Email,Clave from
usuario where isEmpleado='true' and Estado='true'
go

CREATE PROCEDURE SP_EMP_UPDATE
    @id   int,
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(100),
	@clave		VARCHAR(50)
AS
    UPDATE usuario 
    set Nombre=@nombre,Apellido=@apellido,Direccion=@direccion,Email=@email,Clave=@clave
	where Id = @id
GO


CREATE PROCEDURE SP_EMP_INSERT
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(100),
	@clave		VARCHAR(50)
AS
    INSERT USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
    VALUES (@nombre, @apellido, @direccion, @email, @clave, 'true', 'false', 'false','true')
GO



CREATE PROCEDURE SP_OBTENERTUTORXID
as
select u.id,u.Nombre,u.Apellido,u.Direccion,u.Email,u.Clave,Curriculum,Antecedentes,Recibo,Foto, CONVERT(char(10), U.FechaRegistro,103) as FechaFormato
from usuario u inner join detalle_tutor d on u.id = d.idUsuario where isTutor = 'true'
go


CREATE PROCEDURE SP_ACEPTAR_TUTOR
@id int
as
update DETALLE_TUTOR set isAceptado = 'true' where IdUsuario = @id
go


/* INSERTS */

/*IsEmpleado*/
INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Angel','Leon','Av. El Sol', 'angel.leon@gmail.com','12345','true','false','false','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Mayra','Lescano','Calle los Olivos', 'solange_1423@gmail.com','9876543','true','false','false','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Hugo','Quisoe','La Estancia', 'h.quispe@gmail.com','0987876','true','false','false','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Marcello','Sanchez','La Molina', 'mcllo.s@gmail.com','algoritmo1234','true','false','false','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Luis','Acosta','Callao', 'acosta.luis@gmail.com','casita123','true','false','false','true')
GO

/*IsAlumno*/
INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Yesenia','Tesen','Punta Negra', 'yes.tesen@gmail.com','123456','false','false','true','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Jhoel','Campos','Miraflores', 'jcampost@gmail.com','567890','false','false','true','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Liliana','Benites','La Victoria', 'lili.benites@gmail.com','sillita453','false','false','true','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('Fernandina','Allca','Lurin', 'fer.nandina@gmail.com','fer1234','false','false','true','true')
GO

INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
VALUES('David','Leon','Lurin', 'elrey.leon@gmail.com','davidleon','false','false','true','true')
GO

/*IsEmpleado*/
INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)  
VALUES('Alonso','Vasquez','San Isidro', 'vasquez.alonso@gmail.com','alonso1234','false','true','false','true','12/12/2017')
GO
INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)  
VALUES('Daniel','Gonzales','El Romac', 'dani.g@gmail.com','daniel12344','false','true','false','true','03/04/2018')
GO
INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)  
VALUES('Thommy','Susanivar','San Miguel', 'susanivar@gmail.com','thommy1234','false','true','false','true','03/06/2018')
GO
INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)  
VALUES('Mariella','Meza','San Miguel', 'mmeza@gmail.com','mariella1234','false','true','false','true','05/02/2018')
GO
INSERT INTO USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)  
VALUES('Miguel','Miranda','Los Olvivos', 'miguel.miranda@gmail.com','miki1234','false','true','false','true','10/10/2018')
GO

/*INSERT DETALLE TUTOR*/

INSERT INTO DETALLE_TUTOR VALUES(11,'false','https://www.psicoactiva.com/blog/wp-content/uploads/2017/07/hombre-soltero-feliz.jpg',null,null,null)
GO
INSERT INTO DETALLE_TUTOR VALUES(12,'false','https://afemefa.com/wp-content/uploads/2017/02/mujer-obesa.jpg',null,null,null)
GO
INSERT INTO DETALLE_TUTOR VALUES(13,'false','http://www.laredcoaching.com/wp-content/uploads/2016/07/Hombre-pensando-mientras-se-toca-la-barbilla-con-la-mano.jpg',null,null,null)
GO
INSERT INTO DETALLE_TUTOR VALUES(14,'false','http://i.shangc.net/2017/0320/20170320094441281.jpg',null,null,null)
GO
INSERT INTO DETALLE_TUTOR VALUES(15,'false','https://www.abc.es/media/recreo/2016/09/12/Fotolia_32201374_Subscription_XXL--478x270-kmyG--620x349@abc.jpg',null,null,null)
GO

go



/*Procedure Alumno*/



CREATE PROCEDURE SP_ALUMNO_LISTAR
as
select Id,Nombre,Apellido,Direccion,Email,Clave from
usuario where isAlumno='true' and Estado='true'
go



CREATE PROCEDURE SP_ALUMNO_INSERT
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(100),
	@clave		VARCHAR(50)
AS
BEGIN
    INSERT USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
    VALUES (@nombre, @apellido, @direccion, @email, @clave, 'false', 'false', 'true','true')
END
GO




CREATE PROCEDURE SP_ALUMNO_DELETE
@id int
as
update usuario set Estado='false' where @id=Id 
go


CREATE PROCEDURE SP_ALUMNO_UPDATE
    @id   int,
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(100),
	@clave		VARCHAR(50)
AS
    UPDATE usuario 
    set Nombre=@nombre,Apellido=@apellido,Direccion=@direccion,Email=@email,Clave=@clave
	where Id = @id and isAlumno='true'
GO



CREATE PROCEDURE SP_OBTENER_ALUMNO_X_ID
@ID int
as
select u.id,u.Nombre,u.Apellido,u.Direccion,u.Email,u.Clave
from usuario u
 inner join detalle_tutor d 
 on u.id = d.idUsuario
 where isAlumno = 'true' and u.id=@ID
go


exec SP_OBTENERTUTORXID 
select * from usuario
EXEC SP_LISTA_TUTORES_PENDIENTES
GO
---------------------------------------------------------------------------------------------------------------------
--PROCEDURE TUTORIA

CREATE PROCEDURE SP_TUTORIA_INSERT
@idTutor int,
@tituloTutoria varchar(100) ,
@categoriaTutoria varchar(50),
@Foto        VARCHAR(MAX),
@horaTutoria varchar(10) ,
@ubicacionTutoria varchar(50),
@precioTutoria money ,
@descipcionTutoria varchar(500),
@fechaTutoria datetime
AS
BEGIN


INSERT INTO TUTORIA(tituloTutoria,categoriaTutoria,Foto,horaTutoria,ubicacionTutoria,precioTutoria,descripcionTutoria,estadoTutoria,fechaTutoria,idTutor)
			VALUES(@tituloTutoria,@categoriaTutoria,@Foto,@horaTutoria,@ubicacionTutoria,@precioTutoria,@descipcionTutoria,'true',@fechaTutoria,@idTutor)
END
GO



CREATE PROCEDURE SP_LISTAR_TUTORIA_TUTOR_ALUMNO
@idTutoria int,
@id int
AS
BEGIN

SELECT t.tituloTutoria, t.categoriaTutoria, t.fechaTutoria,t.horaTutoria,t.Foto FROM TUTORIA t
INNER JOIN USUARIO u ON t.idTutor=u.Id
where u.id=@id and u.isAlumno='true' or isTutor='true'and estadoTutoria='true'and idTutoria=@idTutoria
	

END
GO




CREATE PROCEDURE SP_LISTAR_TUTORIA_TUTOR

@id int
AS
BEGIN

SELECT t.tituloTutoria, t.categoriaTutoria, t.fechaTutoria,t.horaTutoria,t.precioTutoria,t.Foto FROM TUTORIA t
INNER JOIN USUARIO u ON t.idTutor=u.Id
where u.id=@id and isTutor='true'and estadoTutoria='true'
	
END
GO



CREATE PROCEDURE SP_TUTORIA_UPDATE
@idTutoria int ,
@idTutor int,
@tituloTutoria varchar(100) ,
@categoriaTutoria varchar(50),
@Foto varchar(max),
@horaTutoria varchar(10) ,
@ubicacionTutoria varchar(50),
@precioTutoria money ,
@descripcionTutoria varchar(500),
@fechaTutoria datetime
AS
BEGIN

update TUTORIA
set tituloTutoria=@tituloTutoria, categoriaTutoria=@categoriaTutoria, Foto=@Foto, horaTutoria=@horaTutoria, ubicacionTutoria=@ubicacionTutoria,
	precioTutoria=@precioTutoria, descripcionTutoria=@descripcionTutoria, fechaTutoria=@fechaTutoria
	where idTutor=@idTutor and estadoTutoria='true'and idTutoria=@idTutoria


END
GO



CREATE PROCEDURE SP_TUTORIA_DELETE
@idTutor int,
@idTutoria int
AS
BEGIN

update TUTORIA
set estadoTutoria='false'
	where idTutor=@idTutor and estadoTutoria='true'and idTutoria=@idTutoria


END
GO



CREATE PROCEDURE SP_LISTAR_TUTORIA_FILTROS
@titulo varchar(100),
@fecha datetime,
@categoria varchar(50)
AS
BEGIN

SELECT t.tituloTutoria, t.categoriaTutoria, t.fechaTutoria,t.horaTutoria,t.Foto FROM TUTORIA t
INNER JOIN USUARIO u ON t.idTutor=u.Id
where  u.isAlumno='true' and t.estadoTutoria='true' and t.tituloTutoria Like '%'+@titulo+'%'
						or t.fechaTutoria like '%'+@fecha+'%'or t.categoriaTutoria Like '%'+@categoria+'%'
	

END
GO
