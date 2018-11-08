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
	id_tutor			INT			 NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
	nombre_tutor		VARCHAR(50)  NOT NULL,
	apellido_tutor	VARCHAR(50)  NOT NULL,
	direccion_tutor	VARCHAR(50)  NOT NULL,
	email_tutor		VARCHAR(100) NOT NULL,
	contraseña_tutor	VARCHAR(50)  NOT NULL
)
GO


create proc sp_registroTutor
    @nombreT		VARCHAR(50),
	@apellidoT	VARCHAR(50),
	@direccionT	VARCHAR(50),
	@emailT		VARCHAR(50),
	@contraseñaT		VARCHAR(50)
AS
BEGIN
	INSERT TUTOR (nombre_tutor, apellido_tutor, direccion_tutor, email_tutor, contraseña_tutor) 
	VALUES (@nombreT, @apellidoT, @direccionT, @emailT, @contraseñaT)
END
GO


create proc sp_modificarTutor
    @idT int,
    @nombreT		VARCHAR(50),
	@apellidoT	VARCHAR(50),
	@direccionT	VARCHAR(50),
	@emailT		VARCHAR(50),
	@contraseñaT		VARCHAR(50)
AS
update tutor set
nombre_tutor = @nombreT, apellido_tutor = @apellidoT, direccion_tutor = @direccionT, email_tutor = @emailT, contraseña_tutor = @contraseñaT
where id_tutor = @idT
go



create proc sp_eliminarTutor
@idT int
as
begin
Delete tutor where id_tutor=@idT
end 
go


create proc sp_listarTutor
as
begin
select id_tutor,nombre_tutor,apellido_tutor,direccion_tutor,email_tutor,contraseña_tutor from TUTOR
end
go

/* INSERTS */

EXEC sp_registroTutor'nombre1','apellido1','direccion1','email1','clave1'
exec sp_modificarTutor '1', 'nombrddd','apellido1','direccion1','email1','clave1'
exec sp_eliminarTutor '1'
exec sp_listarTutor