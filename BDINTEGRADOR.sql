USE MASTER
GO

IF DB_ID('BDINTEGRADOR') IS NOT NULL
	DROP DATABASE BDINTEGRADOR
GO

CREATE DATABASE BDINTEGRADOR
GO

USE BDINTEGRADOR
GO

CREATE TABLE EMPLEADO (
	Id			INT			 NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
	Nombre		VARCHAR(50)  NOT NULL,
	Apellido	VARCHAR(50)  NOT NULL,
	Direccion	VARCHAR(50)  NOT NULL,
	Email		VARCHAR(100) NOT NULL,
	Clave		VARCHAR(50)  NOT NULL,
)
GO

CREATE PROCEDURE SP_EMPLEADO_INSERT
	@nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(50),
	@clave		VARCHAR(50)
AS
BEGIN
	INSERT EMPLEADO (Nombre, Apellido, Direccion, Email, Clave) 
	VALUES (@nombre, @apellido, @direccion, @email, @clave)
END
GO



CREATE TABLE TUTOR (
	Id			INT			 NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
	Nombre		VARCHAR(50)  NOT NULL,
	Apellido	VARCHAR(50)  NOT NULL,
	Direccion	VARCHAR(50)  NOT NULL,
	Email		VARCHAR(100) NOT NULL,
	Contraseña	VARCHAR(50)  NOT NULL
)
GO


create proc sp_registroTutor
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(50),
	@contraseña		VARCHAR(50)
AS
BEGIN
	INSERT TUTOR (Nombre, Apellido, Direccion, Email, Contraseña) 
	VALUES (@nombre, @apellido, @direccion, @email, @contraseña)
END
GO


create proc sp_modificarTutor
    @id int,
    @nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(50),
	@contraseña		VARCHAR(50)
AS
update tutor set
Nombre = @nombre, Apellido = @apellido, Direccion = @direccion, Email = @email, Contraseña = @contraseña
where Id = @id
go



create proc sp_eliminarTutor
@id int
as
begin
Delete tutor where Id=@id
end 
go

/* INSERTS */

EXEC SP_EMPLEADO_INSERT 'nombre1','apellido1','direccion1','email1','clave1'
