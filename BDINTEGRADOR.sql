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
	Id			INT		     NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
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
	id_tutor			INT	 NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
	nombre_tutor		VARCHAR(50)  NOT NULL,
	apellido_tutor	VARCHAR(50)  NOT NULL,
	direccion_tutor	VARCHAR(50)  NOT NULL,
	email_tutor		VARCHAR(100) NOT NULL,
	contrase�a_tutor	VARCHAR(50)  NOT NULL
)
GO


create proc sp_registroTutor
    @nombreT		VARCHAR(50),
	@apellidoT	VARCHAR(50),
	@direccionT	VARCHAR(50),
	@emailT		VARCHAR(50),
	@contrase�aT		VARCHAR(50)
AS
BEGIN
	INSERT TUTOR (nombre_tutor, apellido_tutor, direccion_tutor, email_tutor, contrase�a_tutor) 
	VALUES (@nombreT, @apellidoT, @direccionT, @emailT, @contrase�aT)
END
GO


create proc sp_modificarTutor
    @idT int,
    @nombreT		VARCHAR(50),
	@apellidoT	VARCHAR(50),
	@direccionT	VARCHAR(50),
	@emailT		VARCHAR(50),
	@contrase�aT		VARCHAR(50)
AS
update tutor set
nombre_tutor = @nombreT, apellido_tutor = @apellidoT, direccion_tutor = @direccionT, email_tutor = @emailT, contrase�a_tutor = @contrase�aT
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
select id_tutor,nombre_tutor,apellido_tutor,direccion_tutor,email_tutor,contrase�a_tutor from TUTOR
end
go

/* INSERTS */

EXEC sp_registroTutor'nombre1','apellido1','direccion1','email1','clave1'
exec sp_modificarTutor '1', 'nombrddd','apellido1','direccion1','email1','clave1'
exec sp_eliminarTutor '1'
exec sp_listarTutor
go

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------


--ALUMNOS
--TABLA DE ALUMNOS

CREATE TABLE ALUMNOS(
idAlumno int  identity(1,1) primary key,
emailAlumno varchar(50) not null,
nombreAlumno varchar(50) not null,
apellidoAlumno varchar(50) not null,
contrase�aAlumno varchar(50) not null
)
go


--procedures para los alumnos
--listar alumnos
CREATE PROC SP_LISTAR_ALUMNOS
as
BEGIN

select idAlumno, nombreAlumno,apellidoAlumno,emailAlumno  from ALUMNOS
END
GO

--crear alumnos
CREATE PROC SP_REGISTRAR_ALUMNOS
@nombreA varchar(50),
@apellidoA varchar(50),
@emailA varchar(50),
@contrase�aA varchar(50)
AS
BEGIN

 insert into ALUMNOS(nombreAlumno,apellidoAlumno,emailAlumno,contrase�aAlumno)
 values(@nombreA,@apellidoA,@emailA,@contrase�aA)

END
GO

--modificar alumno sin contrase�a
CREATE PROC SP_MODIFICAR_ALUMNO
@idA int,
@nombreA varchar(50),
@apellidoA varchar(50),
@emailA varchar(50),
@contrase�aA varchar(50)
AS
BEGIN 
UPDATE ALUMNOS
SET 
nombreAlumno=@nombreA, apellidoAlumno=@apellidoA,emailAlumno=@emailA , contrase�aAlumno=@contrase�aA
WHERE   idAlumno=@idA
END
GO

--modificar contrase�a
CREATE PROC SP_MODIFICAR_CONTRASE�A_ALUMNO
@idA int,
@contrase�aA varchar(50)
AS
BEGIN 
UPDATE ALUMNOS
SET 
contrase�aAlumno=@contrase�aA
where  idAlumno=@idA
END
GO


CREATE PROC SP_ELIMINAR_ALUMNO
@idA int
AS
BEGIN

DELETE ALUMNOS WHERE idAlumno=@idA

END
GO



--TUTORIAS

--TABLA TUTORIAS

CREATE TABLE TUTORIAS(
idTutoria int identity(1,1)not null,--el id es para contar las turorias que existen en total,
codigoTutoria char(8),
tituloTutoria varchar(100),
categoriaTutoria varchar(50),
fechaTutoria date,
horaTutoria char(5),
ubicacionTutoria varchar(50),
precioTutoria money,
descipcionTutoria varchar(500),
idA int references ALUMNOS,
id_tutor int references TUTOR   
);
GO

--PROCEDURES DE TUTORIAS

CREATE PROC SP_LISTAR_TUTORIAS_TUTOR
@idT int
AS
BEGIN
SELECT codigoTutoria,tituloTutoria,categoriaTutoria,fechaTutoria,horaTutoria,ubicacionTutoria,precioTutoria,DescipcionTutoria,id_tutor   FROM TUTORIAS
where id_tutor=@idT
END 
GO



CREATE PROC SP_LISTAR_TUTORIAS_EMPLEADO
AS
BEGIN

SELECT idTutoria,codigoTutoria,tituloTutoria,categoriaTutoria,fechaTutoria,
horaTutoria,ubicacionTutoria,precioTutoria,DescipcionTutoria  
 FROM TUTORIAS

END
GO

CREATE PROC SP_LISTAR_TUTORIAS_X_FECHA
@fechaT date
AS
BEGIN

SELECT idTutoria,codigoTutoria,tituloTutoria,categoriaTutoria,fechaTutoria,
horaTutoria,ubicacionTutoria,precioTutoria,DescipcionTutoria  
 FROM TUTORIAS
 WHERE fechaTutoria=@fechaT

END
GO


CREATE PROC SP_LISTAR_TUTORIAS_X_CATEGORIA
@categoriaT varchar(50)
AS
BEGIN

SELECT idTutoria,codigoTutoria,tituloTutoria,categoriaTutoria,fechaTutoria,
horaTutoria,ubicacionTutoria,precioTutoria,DescipcionTutoria  
 FROM TUTORIAS
 WHERE categoriaTutoria=@categoriaT

END
GO


CREATE PROC SP_LISTAR_TUTORIAS_X_TITULO
@tituloT varchar(100)
AS
BEGIN

SELECT idTutoria,codigoTutoria,tituloTutoria,categoriaTutoria,fechaTutoria,
horaTutoria,ubicacionTutoria,precioTutoria,DescipcionTutoria  
 FROM TUTORIAS
 WHERE tituloTutoria LIKE '%'+@tituloT+'%'

END
GO






