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

CREATE PROCEDURE SP_EMPLEADO_UPDATE
	@nombre		VARCHAR(50),
	@apellido	VARCHAR(50),
	@direccion	VARCHAR(50),
	@email		VARCHAR(50),
	@clave		VARCHAR(50)
AS
BEGIN

	UPDATE EMPLEADO 
		SET Nombre=@nombre, Apellido=@apellido,Direccion=@direccion,Clave=@clave
		WHERE Email=@email
END
GO

CREATE PROCEDURE SP_EMPLEADO_LIST
AS
BEGIN

	SELECT Id, Nombre, Apellido, Direccion, Email, Clave FROM EMPLEADO 

END
GO

CREATE PROCEDURE SP_EMPLEADO_DELETE
@email VARCHAR(50)
AS
	DELETE FROM EMPLEADO
	WHERE Email = @email
GO

CREATE TABLE TUTOR (
	id_tutor			INT	 NOT NULL	IDENTITY(1,1)  PRIMARY KEY,
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
nombre_tutor = @nombreT, apellido_tutor = @apellidoT, direccion_tutor = @direccionT, contraseña_tutor = @contraseñaT
where email_tutor = @emailT
go



create proc sp_eliminarTutor
@email varchar(50)
as
begin
Delete tutor where email_tutor=@email
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
go

------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------


--ALUMNOS
--TABLA DE ALUMNOS

CREATE TABLE ALUMNOS(
idAlumno int  identity(1,1) primary key,
emailAlumno varchar(50) not null identity,
nombreAlumno varchar(50) not null,
apellidoAlumno varchar(50) not null,
contraseñaAlumno varchar(50) not null
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
@contraseñaA varchar(50)
AS
BEGIN

 insert into ALUMNOS(nombreAlumno,apellidoAlumno,emailAlumno,contraseñaAlumno)
 values(@nombreA,@apellidoA,@emailA,@contraseñaA)

END
GO

--modificar alumno sin contraseña
CREATE PROC SP_MODIFICAR_ALUMNO
@nombreA varchar(50),
@apellidoA varchar(50),
@emailA varchar(50),
@contraseñaA varchar(50)
AS
BEGIN 
UPDATE ALUMNOS
SET 
nombreAlumno=@nombreA, apellidoAlumno=@apellidoA , contraseñaAlumno=@contraseñaA
WHERE   emailAlumno=@emailA
END
GO

--modificar contraseña
CREATE PROC SP_MODIFICAR_CONTRASEÑA_ALUMNO
@idA int,
@contraseñaA varchar(50)
AS
BEGIN 
UPDATE ALUMNOS
SET 
contraseñaAlumno=@contraseñaA
where  idAlumno=@idA
END
GO


CREATE PROC SP_ELIMINAR_ALUMNO
@email varchar(50)
AS
BEGIN

DELETE ALUMNOS WHERE emailAlumno=@email

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

CREATE VIEW USUARIO AS
	SELECT Email,Clave,1 as 'isEmpleado',0 as 'isAlumno',0 as 'isTutor' FROM EMPLEADO E
	UNION
	SELECT emailAlumno,contraseñaAlumno,0,1,0 FROM ALUMNOS
	UNION
	SELECT email_tutor,contraseña_tutor,0,0,1 FROM TUTOR
GO



/*procedure para registrar y no se dupliquen los correos en las otras tablas*/
CREATE PROC SP_REGISTRAR_ALUMNOS_2
@nombreA varchar(50),
@apellidoA varchar(50),
@emailA varchar(50),
@contraseñaA varchar(50)
AS

BEGIN

if @emailA=(select email_tutor from TUTOR where email_tutor=@emailA)
	print 'Email ya registrado'
	else if @emailA=(select Email from EMPLEADO where Email=@emailA)
	print 'Email ya registrado'
	else if  @emailA=(select emailAlumno from ALUMNOS where emailAlumno=@emailA)
	print 'Email ya registrado'
	else 
	 insert into ALUMNOS(nombreAlumno,apellidoAlumno,emailAlumno,contraseñaAlumno)
		values(@nombreA,@apellidoA,@emailA,@contraseñaA)

END
GO


exec SP_REGISTRAR_ALUMNOS_2 'Hector Jose','Romero','Jose@hotmail.com','pedrito1234' 

insert into empleado (Nombre,Apellido,Direccion,Email,Clave) 
values('Willian','Pantoja','calle siempre viva 123', 'Willian@hotmail.com','hector123' )

insert into TUTOR (nombre_tutor,apellido_tutor,direccion_tutor,email_tutor,contraseña_tutor) 
values('Hector','Pantoja','calle siempre viva 123', 'Hector@hotmail.com','hector123' )

select * from TUTOR
select * from Alumnos
select * from empleado
