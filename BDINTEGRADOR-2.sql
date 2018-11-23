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

    INSERT DETALLE_TUTOR values(@ID,'false','CVURL','AntecedentesURL','ReciboURL')
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
END
GO

/* INSERTS */
EXEC SP_TUTOR_INSERT 'Julio','Profe','Av. youtube','jp@juliprofe.com','123'

INSERT USUARIO(Nombre,Apellido,Direccion,Email,Clave,isEmpleado,isTutor,isAlumno,Estado) 
    VALUES ('a', 'b', 'c', 'admin', 'admin', 'true', 'false', 'false','true')

/* SELECTS */

EXEC SP_LISTA_TUTORES_PENDIENTES



