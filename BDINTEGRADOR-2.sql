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

/* DROP TABLES */

IF OBJECT_ID('USUARIO') IS NOT NULL
    DROP TABLE USUARIO
GO

IF OBJECT_ID('DETALLE_TUTOR') IS NOT NULL
    DROP TABLE DETALLE_TUTOR
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
    SELECT U.* FROM USUARIO U
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
@id int
as
select u.id,u.Nombre,u.Apellido,u.Direccion,u.Email,u.Clave,Curriculum,Antecedentes,Recibo,Foto
from usuario u inner join detalle_tutor d on u.id = d.idUsuario where isTutor = 'true' and Id = @id
go


/* INSERTS */
EXEC SP_TUTOR_INSERT 'Julio','Profe','Av. youtube','jp@juliprofe.com','123'

INSERT USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
    VALUES ('a', 'b', 'c', 'admin', 'admin', 'true', 'false', 'false','true')

/* SELECTS */

exec SP_OBTENERTUTORXID '1'
EXEC SP_LISTA_TUTORES_PENDIENTES


select*from USUARIO