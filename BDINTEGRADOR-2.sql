﻿/* DROP PROCEDURES */

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

IF OBJECT_ID('SP_ACEPTAR_TUTOR') IS NOT NULL
    DROP PROCEDURE SP_ACEPTAR_TUTOR
GO

IF OBJECT_ID('SP_LISTAR_TUTORIA_TUTOR_ALUMNO') IS NOT NULL
    DROP PROCEDURE SP_LISTAR_TUTORIA_TUTOR_ALUMNO
GO

IF OBJECT_ID('SP_LISTAR_TUTORIA_TUTOR') IS NOT NULL
    DROP PROCEDURE SP_LISTAR_TUTORIA_TUTOR
GO

IF OBJECT_ID('SP_TUTORIA_UPDATE') IS NOT NULL
    DROP PROCEDURE SP_TUTORIA_UPDATE
GO

IF OBJECT_ID('SP_TUTORIA_DELETE') IS NOT NULL
    DROP PROCEDURE SP_TUTORIA_DELETE
GO

IF OBJECT_ID('SP_LISTAR_TUTORIA_FILTROS') IS NOT NULL
    DROP PROCEDURE SP_LISTAR_TUTORIA_FILTROS
GO

IF OBJECT_ID('SP_LISTAR_TUTORIA') IS NOT NULL
    DROP PROCEDURE SP_LISTAR_TUTORIA
GO

IF OBJECT_ID('SP_RANKING') IS NOT NULL
    DROP PROCEDURE SP_RANKING
GO

IF OBJECT_ID('SP_MATRICULATUTORIA') IS NOT NULL
    DROP PROCEDURE SP_MATRICULATUTORIA
GO

IF OBJECT_ID('SP_LISTAR_TUTORIAXFILTROS') IS NOT NULL
    DROP PROCEDURE SP_LISTAR_TUTORIAXFILTROS
GO

IF OBJECT_ID('SP_TARJETAINFO') IS NOT NULL
    DROP PROCEDURE SP_TARJETAINFO
GO

IF OBJECT_ID('SP_LISTARMATRICULA') IS NOT NULL
    DROP PROCEDURE SP_LISTARMATRICULA
GO

IF OBJECT_ID('SP_LISTAR_TUTORIAxIDALUMNO') IS NOT NULL
    DROP PROCEDURE SP_LISTAR_TUTORIAxIDALUMNO
GO

IF OBJECT_ID('SP_LISTAR_TUTORIAxIDTUTOR') IS NOT NULL
    DROP PROCEDURE SP_LISTAR_TUTORIAxIDTUTOR
GO

IF OBJECT_ID('SP_TUTORIA_DELETE2') IS NOT NULL
    DROP PROCEDURE SP_TUTORIA_DELETE2
GO

IF OBJECT_ID('SP_OBTENER_USUARIO') IS NOT NULL
    DROP PROCEDURE SP_OBTENER_USUARIO
GO

IF OBJECT_ID('SP_OBTENERTUTORXID2') IS NOT NULL
    DROP PROCEDURE SP_OBTENERTUTORXID2
GO

/* DROP TABLES */

IF OBJECT_ID('tb_Tarjeta') IS NOT NULL
    DROP TABLE tb_Tarjeta
GO

IF OBJECT_ID('tipoTarjeta') IS NOT NULL
    DROP TABLE tipoTarjeta
GO

IF OBJECT_ID('MATRICULA_TUTORIA') IS NOT NULL
    DROP TABLE MATRICULA_TUTORIA
GO

IF OBJECT_ID('TUTORIA') IS NOT NULL
    DROP TABLE TUTORIA
GO

IF OBJECT_ID('DETALLE_TUTOR') IS NOT NULL
    DROP TABLE DETALLE_TUTOR
GO

IF OBJECT_ID('USUARIO') IS NOT NULL
    DROP TABLE USUARIO
GO

/* CREATE TABLES */

CREATE TABLE tipoTarjeta
(
    idTipoTarjeta int identity(1,1) primary key,
    nombreTipoTarjeta varchar(20)
)
go

CREATE TABLE tb_Tarjeta
(
    idTarjeta int identity(1,1) primary key,
    idTipoTarjeta int foreign key references tipoTarjeta,
    numeroTarjeta varchar(16),
    nombreTarjeta varchar(50),
    securityCodeTarjeta char(3),
    mesExpiracionTarjeta char(2),
    añoExpiracionTarjeta char(4),
    tarjetaHabilitada bit,
    lineaCredito decimal(10,2),
    creditoDisponible decimal(10,2)
)
GO

CREATE TABLE USUARIO
(
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Clave VARCHAR(50) NOT NULL,
    isEmpleado BIT NOT NULL,
    isTutor BIT NOT NULL,
    isAlumno BIT NOT NULL,
    Estado BIT NOT NULL,
    FechaRegistro DATE NOT NULL DEFAULT GETDATE()
)
GO

CREATE TABLE DETALLE_TUTOR
(
    IdUsuario INT references USUARIO,
    isAceptado BIT,
    Foto VARCHAR(MAX),
    Curriculum VARCHAR(MAX),
    Antecedentes VARCHAR(MAX),
    Recibo VARCHAR(MAX)
)
GO

CREATE TABLE TUTORIA
(
    idTutoria int identity(1,1) primary key,
    tituloTutoria varchar(100) not null,
    categoriaTutoria varchar(50) not null,
    Foto VARCHAR(MAX),
    fechaTutoria date not null,
    horaTutoria varchar(10) not null,
    ubicacionTutoria varchar(MAX) not null,
    precioTutoria money not null ,
    descripcionTutoria varchar(MAX) not null,
    estadoTutoria BIT not null,
    cantidaAlumnos int,
    cantidadMaxima int,
    idTutor int references USUARIO
)
GO

CREATE TABLE MATRICULA_TUTORIA
(
    idTutoria int references TUTORIA,
    idAlumno int references USUARIO,
    unique(idTutoria,idAlumno)
)
go


/* CREATE PROCEDURES */

CREATE PROCEDURE SP_LOGIN
    @email		VARCHAR(100),
    @clave		VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM USUARIO
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
    INSERT USUARIO
        (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
    VALUES
        (@nombre, @apellido, @direccion, @email, @clave, 'false', 'true', 'false', 'true')

    DECLARE @ID INT = SCOPE_IDENTITY()

    INSERT DETALLE_TUTOR
    values(@ID, 'false', 'FotoURL', 'CVURL', 'AntecedentesURL', 'ReciboURL')
END
GO

CREATE PROCEDURE SP_LISTA_TUTORES_PENDIENTES
AS
BEGIN
    SELECT U.*, D.Foto, D.Curriculum, D.Antecedentes, D.Recibo, CONVERT(char(10), U.FechaRegistro,103) as FechaFormato
    FROM USUARIO U
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
select Id, Nombre, Apellido, Direccion, Email, Clave
from
    usuario
where isTutor='true' and Estado='true'
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
select Id, Nombre, Apellido, Direccion, Email, Clave
from
    usuario
where isEmpleado='true' and Estado='true'
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
INSERT USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES
    (@nombre, @apellido, @direccion, @email, @clave, 'true', 'false', 'false', 'true')
GO


CREATE PROCEDURE SP_OBTENERTUTORXID
as
select u.id, u.Nombre, u.Apellido, u.Direccion, u.Email, u.Clave, Curriculum, Antecedentes, Recibo, Foto, CONVERT(char(10), U.FechaRegistro,103) as FechaFormato, isAceptado
from usuario u inner join detalle_tutor d on u.id = d.idUsuario
where isTutor = 'true' 
go



CREATE PROCEDURE SP_OBTENERTUTORXID2
    @id_tutor int
as
select u.id, u.Nombre, u.Apellido, u.Direccion, u.Email, u.Clave, Curriculum, Antecedentes, Recibo, Foto, CONVERT(char(10), U.FechaRegistro,103) as FechaFormato
from usuario u inner join detalle_tutor d on u.id = d.idUsuario
where isTutor = 'true' and u.Id=@id_tutor
go


CREATE PROCEDURE SP_ACEPTAR_TUTOR
    @id int
as
update DETALLE_TUTOR set isAceptado = 'true' where IdUsuario = @id
go

/*Procedure Alumno*/



CREATE PROCEDURE SP_ALUMNO_LISTAR
as
select Id, Nombre, Apellido, Direccion, Email, Clave
from
    usuario
where isAlumno='true' and Estado='true'
go



CREATE PROCEDURE SP_ALUMNO_INSERT
    @nombre		VARCHAR(50),
    @apellido	VARCHAR(50),
    @direccion	VARCHAR(50),
    @email		VARCHAR(100),
    @clave		VARCHAR(50)
AS
BEGIN
    INSERT USUARIO
        (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
    VALUES
        (@nombre, @apellido, @direccion, @email, @clave, 'false', 'false', 'true', 'true')
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
select u.id, u.Nombre, u.Apellido, u.Direccion, u.Email, u.Clave
from usuario u
    inner join detalle_tutor d
    on u.id = d.idUsuario
where isAlumno = 'true' and u.id=@ID
go

---------------------------------------------------------------------------------------------------------------------
--PROCEDURE TUTORIA

CREATE PROCEDURE SP_TUTORIA_DELETE2
    @idTutoria int
as
update TUTORIA set estadoTutoria='false' where idTutoria=@idTutoria
go


create PROCEDURE SP_TUTORIA_INSERT
    @idTutor int,
    @tituloTutoria varchar(100) ,
    @categoriaTutoria varchar(50),
    @Foto        VARCHAR(MAX),
    @horaTutoria varchar(10) ,
    @ubicacionTutoria varchar(MAX),
    @precioTutoria money ,
    @descipcionTutoria varchar(500),
    @cantidadMaxima int,
    @fechaTutoria date
AS
BEGIN


    INSERT INTO TUTORIA
        (tituloTutoria,categoriaTutoria,Foto,horaTutoria,ubicacionTutoria,precioTutoria,descripcionTutoria,estadoTutoria,fechaTutoria,idTutor,cantidaAlumnos, cantidadMaxima)
    VALUES(@tituloTutoria, @categoriaTutoria, @Foto, @horaTutoria, @ubicacionTutoria, @precioTutoria, @descipcionTutoria, 'true', @fechaTutoria, @idTutor, '0', @cantidadMaxima)
END
GO



create PROCEDURE SP_LISTAR_TUTORIA_TUTOR_ALUMNO
    @idTutoria int,
    @id int
AS
BEGIN

    SELECT t.tituloTutoria, t.categoriaTutoria, t.fechaTutoria, t.precioTutoria, t.horaTutoria, t.Foto
    FROM TUTORIA t
        INNER JOIN USUARIO u ON t.idTutor=u.Id
    where u.id=@id and u.isAlumno='true' or isTutor='true'and estadoTutoria='true'and idTutoria=@idTutoria


END
GO




create PROCEDURE SP_LISTAR_TUTORIA_TUTOR
    @id int
AS
BEGIN

    SELECT t.tituloTutoria, t.categoriaTutoria, t.fechaTutoria, t.horaTutoria, t.precioTutoria, t.Foto, t.cantidaAlumnos
    FROM TUTORIA t
        INNER JOIN USUARIO u ON t.idTutor=u.Id

    where u.id=@id and isTutor='true'and estadoTutoria='true'

END
GO

CREATE PROCEDURE SP_TUTORIA_UPDATE
    @idTutoria int ,
    @idTutor int,
    @tituloTutoria varchar(100) ,
    @categoriaTutoria varchar(50),
    @Foto varchar(MAX),
    @horaTutoria varchar(10) ,
    @ubicacionTutoria varchar(MAX),
    @precioTutoria money ,
    @descripcionTutoria varchar(500),
    @cantidadMaxima int,
    @fechaTutoria date
AS
BEGIN

    update TUTORIA
set tituloTutoria=@tituloTutoria, categoriaTutoria=@categoriaTutoria, Foto=@Foto, horaTutoria=@horaTutoria, ubicacionTutoria=@ubicacionTutoria,
	precioTutoria=@precioTutoria, descripcionTutoria=@descripcionTutoria, fechaTutoria=@fechaTutoria, cantidadMaxima=@cantidadMaxima
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


create PROCEDURE SP_LISTAR_TUTORIA
AS
BEGIN
    SELECT idTutoria, tituloTutoria, categoriaTutoria, Foto, fechaTutoria, horaTutoria, ubicacionTutoria, precioTutoria, descripcionTutoria, estadoTutoria, cantidaAlumnos, idTutor
    FROM TUTORIA
END
GO

create proc SP_LISTAR_TUTORIAXFILTROS
    @titulo VARCHAR(50)= '',
    @fecha	date = '',
    @categoria VARCHAR(50)= ''
as
begin
    SELECT idTutoria, tituloTutoria, categoriaTutoria, Foto,
        fechaTutoria
, horaTutoria, ubicacionTutoria, precioTutoria, descripcionTutoria, estadoTutoria, cantidaAlumnos, cantidadMaxima, idTutor
    FROM TUTORIA
    where estadoTutoria='true' and
        (tituloTutoria like concat('%',@titulo,'%') OR @titulo = '') AND
        (fechaTutoria = CONVERT(VARCHAR(10), @fecha, 103) OR @fecha = '') AND
        (categoriaTutoria = @categoria OR @categoria = '')
    ORDER BY fechaTutoria desc
end 
go



CREATE PROCEDURE SP_LISTAR_TUTORIAxIDALUMNO
    @idAlumno INT
AS
BEGIN
    SELECT T.idTutoria, tituloTutoria, categoriaTutoria, Foto, fechaTutoria, horaTutoria, ubicacionTutoria, precioTutoria, descripcionTutoria, estadoTutoria, cantidaAlumnos, cantidadMaxima, idTutor
    FROM TUTORIA T
        INNER JOIN MATRICULA_TUTORIA M ON (M.idTutoria=T.idTutoria)
    WHERE M.idAlumno = @idAlumno
    ORDER BY fechaTutoria desc
END 
GO

CREATE PROCEDURE SP_LISTAR_TUTORIAxIDTUTOR
    @idTutor INT
AS
BEGIN
    SELECT T.idTutoria, tituloTutoria, categoriaTutoria, Foto, fechaTutoria, horaTutoria, ubicacionTutoria, precioTutoria, descripcionTutoria, estadoTutoria, cantidaAlumnos, cantidadMaxima, idTutor
    FROM TUTORIA T
    WHERE T.idTutor = @idTutor
    ORDER BY fechaTutoria desc
END 
GO

create proc SP_MATRICULATUTORIA
    @idtutoria int,
    @idalumno int
as
insert into matricula_tutoria
values(@idtutoria, @idalumno)
update tutoria set cantidaAlumnos = (select count(*)
from MATRICULA_TUTORIA
where idTutoria=@idtutoria)
 FROM tutoria
    inner join MATRICULA_TUTORIA
    on TUTORIA.idTutoria = MATRICULA_TUTORIA.idTutoria
where MATRICULA_TUTORIA.idTutoria = @idtutoria and (select count(*)
    from MATRICULA_TUTORIA
    where idTutoria=@idtutoria) <= tutoria.cantidadMaxima
update TUTORIA set estadoTutoria = 'false' where tutoria.cantidadMaxima =  TUTORIA.cantidaAlumnos;
go


create proc SP_LISTARMATRICULA
as
select idTutoria, idAlumno
from matricula_tutoria 
go

create proc SP_RANKING
as
select RANK() OVER (ORDER BY sum(cantidaAlumnos) DESC) AS Ranking, categoriaTutoria as Categoria, sum(cantidaAlumnos) as Asistentes
from tutoria
group by categoriaTutoria
ORDER BY asistentes DESC
go



/*
Procedure tarjeta
*/

create proc SP_TARJETAINFO
    (
    @idTipoTarjeta int ,
    @numeroTarjeta varchar(16),
    @nombreTarjeta varchar(50),
    @securityCodeTarjeta char(3),
    @mesExpiracionTarjeta char(2),
    @añoExpiracionTarjeta char(4)
)
as
begin
    select numeroTarjeta, nombreTarjeta, tarjetaHabilitada, creditoDisponible
    from tb_Tarjeta
    where idTipoTarjeta = @idTipoTarjeta and numeroTarjeta = @numeroTarjeta and nombreTarjeta = @nombreTarjeta
        and securityCodeTarjeta = @securityCodeTarjeta and mesExpiracionTarjeta = @mesExpiracionTarjeta
        and añoExpiracionTarjeta = @añoExpiracionTarjeta
end
go

CREATE PROCEDURE SP_OBTENER_USUARIO
    @id_usuario int
AS
SELECT *
FROM USUARIO
WHERE Id = @id_usuario
GO


/* INSERTS */

/*IsEmpleado*/
INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Angel', 'Leon', 'Av. El Sol', 'angel.leon@gmail.com', '12345', 'true', 'false', 'false', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Mayra', 'Lescano', 'Calle los Olivos', 'solange_1423@gmail.com', '9876543', 'true', 'false', 'false', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Hugo', 'Quisoe', 'La Estancia', 'h.quispe@gmail.com', '0987876', 'true', 'false', 'false', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Marcello', 'Sanchez', 'La Molina', 'mcllo.s@gmail.com', 'algoritmo1234', 'true', 'false', 'false', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Luis', 'Acosta', 'Callao', 'acosta.luis@gmail.com', 'casita123', 'true', 'false', 'false', 'true')
GO

/*IsAlumno*/
INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Yesenia', 'Tesen', 'Punta Negra', 'yes.tesen@gmail.com', '123456', 'false', 'false', 'true', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Jhoel', 'Campos', 'Miraflores', 'jcampost@gmail.com', '567890', 'false', 'false', 'true', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Liliana', 'Benites', 'La Victoria', 'lili.benites@gmail.com', 'sillita453', 'false', 'false', 'true', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('Fernandina', 'Allca', 'Lurin', 'fer.nandina@gmail.com', 'fer1234', 'false', 'false', 'true', 'true')
GO

INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado)
VALUES('David', 'Leon', 'Lurin', 'elrey.leon@gmail.com', 'davidleon', 'false', 'false', 'true', 'true')
GO

/*IsTutor*/
INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)
VALUES('Alonso', 'Vasquez', 'San Isidro', 'vasquez.alonso@gmail.com', 'alonso1234', 'false', 'true', 'false', 'true', '12/12/2017')
GO
INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)
VALUES('Daniel', 'Gonzales', 'El Romac', 'dani.g@gmail.com', 'daniel12344', 'false', 'true', 'false', 'true', '03/04/2018')
GO
INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)
VALUES('Thommy', 'Susanivar', 'San Miguel', 'susanivar@gmail.com', 'thommy1234', 'false', 'true', 'false', 'true', '03/06/2018')
GO
INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)
VALUES('Mariella', 'Meza', 'San Miguel', 'mmeza@gmail.com', 'mariella1234', 'false', 'true', 'false', 'true', '05/02/2018')
GO
INSERT INTO USUARIO
    (Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado,FechaRegistro)
VALUES('Miguel', 'Miranda', 'Los Olvivos', 'miguel.miranda@gmail.com', 'miki1234', 'false', 'true', 'false', 'true', '10/10/2018')
GO

/*INSERT DETALLE TUTOR*/

INSERT INTO DETALLE_TUTOR
VALUES(11, 'false', 'https://www.psicoactiva.com/blog/wp-content/uploads/2017/07/hombre-soltero-feliz.jpg', null, null, null)
GO
INSERT INTO DETALLE_TUTOR
VALUES(12, 'false', 'https://afemefa.com/wp-content/uploads/2017/02/mujer-obesa.jpg', null, null, null)
GO
INSERT INTO DETALLE_TUTOR
VALUES(13, 'false', 'http://www.laredcoaching.com/wp-content/uploads/2016/07/Hombre-pensando-mientras-se-toca-la-barbilla-con-la-mano.jpg', null, null, null)
GO
INSERT INTO DETALLE_TUTOR
VALUES(14, 'false', 'http://i.shangc.net/2017/0320/20170320094441281.jpg', null, null, null)
GO
INSERT INTO DETALLE_TUTOR
VALUES(15, 'false', 'https://www.abc.es/media/recreo/2016/09/12/Fotolia_32201374_Subscription_XXL--478x270-kmyG--620x349@abc.jpg', null, null, null)
GO

insert into tipoTarjeta
values
    ('Visa');
insert into tipoTarjeta
values
    ('MasterCard');
insert into tipoTarjeta
values
    ('American Express');
insert into tipoTarjeta
values
    ('Diners Club');

insert into tb_Tarjeta
values
    (1, '1234567890123456', 'Yesenia Tesen', '111', '01', '2020', 1, 100000, 5000);
insert into tb_Tarjeta
values
    (1, '1112222333344455', 'Jhoel Campos', '222', '02', '2031', 0, 100000, 5000);
go

exec  SP_TUTORIA_INSERT 11,'Curso de Sql Server ','SQL','https://www.muylinux.com/wp-content/uploads/2018/02/microsoft_sqlserver.png','20:00','Av Angamos 321',30.15,'Con el curso de SQL conocerás el lenguaje de consulta estructurada que te permitirá consultar de manera estructurada la información insertada en la base de datos', '25','06-12-2018'
exec  SP_TUTORIA_INSERT 13,'Spring Boot Basico','Java','https://cdn-images-1.medium.com/max/856/1*O68LbDvD5Dcsnez73M7v4Q.png','16:30','Calle Manco Capac 112',29.60,'Curso para estudiantes que recien se inician en spring boot', '30', '06-11-2018'
exec  SP_TUTORIA_INSERT 15,'Desarrollo de aplicaciones Android ','Android','https://www.adhesivosnatos.com/wp-content/uploads/2016/10/android-pegatina-570x600.png','12:00','Av Cesar Vallejo 421',45.00,'Crea apps en Android o en la web, con las herramientas de Google.', '15','01-12-2018'
exec  SP_TUTORIA_INSERT 14,'Curso de Storage en AWS','AWS','https://uploads-ssl.webflow.com/56a1006de9a99a4669bfd05c/5a037c8a746f250001d469a3_LOGO-AWS-NEW.png','18:00','Av arequipa 552',60.15,'Aprende todo sobre los diferentes tipos de almacenamiento que ofrece AWS e identifica el momento ideal para usarlos', '35','03-12-2018'
exec  SP_TUTORIA_INSERT 11,'Curso de Ingles Basico','Idiomas','https://img.icons8.com/dusk/1600/language.png','08:15','Av aviacion 302',50.60,'Aprende inglés desde cero. Entiende conceptos básicos y construye oraciones simples, enriquece tu vocabulario y da el primer paso en el desarrollo de tus habilidades en el idioma.', '40','04-12-2018'
go

INSERT INTO MATRICULA_TUTORIA VALUES(1,1)
GO