


-------------	INSERTS PARA REALIZAR PRUEBAS
INSERT INTO [practica1].[Usuarios] ([Id],[Firstname],[Lastname],[Email],[DateOfBirth],[Password],[LastChanges],[EmailConfirmed])
VALUES('11111111-1AFC-1F11-11F1-40BB5E7C7E29','Mynor','Perez','perez@hotmail.es','2000-08-12 19:01:27.6700000','1234',GETDATE(),1)
--select * from [practica1].[Usuarios]
GO
insert into [practica1].[Roles](Id,RoleName)
Values ('69121893-3AFC-4F92-85F3-40BB5E7C7E29','Estudiante')
--select * from [practica1].[Roles]
GO
INSERT INTO [practica1].[UsuarioRole]([RoleId],[UserId],[IsLatestVersion])
VALUES('F4E6D8FB-DF45-4C91-9794-38E043FD5ACD','11111111-1AFC-1F11-11F1-40BB5E7C7E29',1)
--select * from [practica1].[UsuarioRole]
GO
INSERT INTO [practica1].[TutorProfile]([UserId],[TutorCode])
VALUES('11111111-1AFC-1F11-11F1-40BB5E7C7E29','502')
-- select * from [practica1].[TutorProfile]    
GO
INSERT INTO [practica1].[Notification] ([UserId],[Message],[Date])
VALUES('11111111-1AFC-1F11-11F1-40BB5E7C7E29' ,'Correo Enviado',GETDATE())
-- select * from [practica1].[Notification]
GO
INSERT INTO [practica1].[HistoryLog] ([Date],[Description])
VALUES (GETDATE(),'primer log en history')
-- select * from [practica1].[HistoryLog]
GO
INSERT INTO [practica1].[Course] ([CodCourse],[Name],[CreditsRequired]) VALUES    
(281,'Sistemas Operativos',5)
--select * from [practica1].[Course]
GO
INSERT INTO [practica1].[CourseTutor] ([TutorId],[CourseCodCourse])
VALUES ('11111111-1AFC-1F11-11F1-40BB5E7C7E29',283)
--select * from [practica1].[CourseTutor]
GO



--------------  TABLA ROLES   ----- Triggers
CREATE TRIGGER trigger_roles_insert
ON [practica1].[Roles] 
AFTER INSERT   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un insert en la tabla  - Roles'     );
go
CREATE TRIGGER trigger_roles_update
ON [practica1].[Roles] 
AFTER UPDATE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un UPDATE al un registro en la tabla  - Roles'     );
go
CREATE TRIGGER trigger_roles_delete
ON [practica1].[Roles] 
AFTER DELETE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un DELETE al un registro en la tabla  - Roles'     );
go

 
------- TABLA USUARIOROLE      ----- Triggers
CREATE TRIGGER trigger_USUARIOROLE_insert
ON [practica1].[UsuarioRole] 
AFTER INSERT   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un insert en la tabla  - USUARIOROLE'     );
go
CREATE TRIGGER trigger_USUARIOROLE_update
ON [practica1].[UsuarioRole]
AFTER UPDATE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un UPDATE al un registro en la tabla  - USUARIOROLE'     );
go
CREATE TRIGGER trigger_USUARIOROLE_delete
ON [practica1].[UsuarioRole] 
AFTER DELETE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un DELETE al un registro en la tabla  - USUARIOROLE'     );
go



------- TABLA NOTIFICACION ----- Triggers
CREATE TRIGGER trigger_NOTIFICACION_insert
ON [practica1].[Notification]
AFTER INSERT   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un insert en la tabla  - NOTIFICACION'     );
go
CREATE TRIGGER trigger_NOTIFICACION_update
ON [practica1].[Notification]
AFTER UPDATE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un UPDATE al un registro en la tabla  - NOTIFICACION'     );
go
CREATE TRIGGER trigger_NOTIFICACION_delete
ON [practica1].[Notification] 
AFTER DELETE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un DELETE al un registro en la tabla  - NOTIFICACION'     );
go


------- TABLA TUTORPROFILE  --- Triggers
CREATE TRIGGER trigger_TUTORPROFILE_insert
ON [practica1].[TutorProfile]
AFTER INSERT   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un insert en la tabla  - TUTORPROFILE'     );
go
CREATE TRIGGER trigger_TUTORPROFILE_update
ON [practica1].[TutorProfile]
AFTER UPDATE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un UPDATE al un registro en la tabla  - TUTORPROFILE'     );
go
CREATE TRIGGER trigger_TUTORPROFILE_delete
ON [practica1].[TutorProfile] 
AFTER DELETE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un DELETE al un registro en la tabla  - TUTORPROFILE'     );
go





---------------------------         Transaccion TR2

alter PROCEDURE [practica1].[PR2]
@Email nvarchar(max), @Cod_Curso int
AS
BEGIN

		DECLARE @Role_ID uniqueidentifier,
		@User_ID uniqueidentifier,
		@IsLastest_V bit ,
		@Code nvarchar(max),
		--@Cod_Curso int,
		@EmailConfirmed bit

		/* Asignamos los parametros que necesitamos*/

		SET @Role_ID = '2CF8E1CF-3CD6-44F3-8F86-1386B7C17657'
		SET @User_ID = '11111111-1AFC-1F11-11F1-40BB5E7C7E29'
		SET @IsLastest_V = 1
		SET @Code = CONVERT(VARCHAR(10), @Cod_Curso)
		--SET @Cod_Curso  =283

		BEGIN TRANSACTION 
		BEGIN TRY

				/* Verifico el EmailConfirmed  */
				SELECT @EmailConfirmed=[EmailConfirmed] FROM [BD2].[practica1].[Usuarios] where [Id] ='11111111-1AFC-1F11-11F1-40BB5E7C7E29'
				IF  (@EmailConfirmed = 1)
				BEGIN
					/* Asignar Rol De Tutor */
					INSERT INTO [practica1].[UsuarioRole]([RoleId],[UserId],[IsLatestVersion])
					VALUES(@Role_ID, @User_ID, @IsLastest_V)


					/* Asignar Rol De Tutor */
					INSERT INTO [practica1].[TutorProfile]([UserId],[TutorCode])
					VALUES(@User_ID, @Code)


					/* Ingreso de curso tutor  */
					INSERT INTO [practica1].[CourseTutor] ([TutorId],[CourseCodCourse])
					VALUES (@User_ID, @Cod_Curso)

					/* Notificiar al usuario  */
					INSERT INTO [practica1].[Notification] ([UserId],[Message],[Date])
					VALUES(@User_ID , concat('Correo Enviado al ',@Email,' mesnaje:  promovido con el rol de tutor'),GETDATE())

					/* Transaccion TR2 log  */
					INSERT INTO [practica1].[HistoryLog]([Date],[Description])
					VALUES (GETDATE(),'TR2 se ha realizado con exito')

					/* Confirmamos la transaccion*/
					COMMIT TRANSACTION 
				END
				ELSE
				BEGIN
					/* CONDICION NO VALIDA  */
					INSERT INTO [practica1].[HistoryLog]([Date],[Description]) VALUES (GETDATE(),'TR2 - EL USUARIO NO HA CONFIRMADO SU EMAIL ES VALOR 0')
					/* Ocurrió un error, deshacemos los cambios*/ 
					ROLLBACK TRANSACTION
				END
		END TRY

		BEGIN CATCH
				/* Ocurrió un error, deshacemos los cambios*/ 
				ROLLBACK TRANSACTION
				PRINT 'Ha ocurrido un error!'
				/* Falló TR2  */
				INSERT INTO [practica1].[HistoryLog]([Date],[Description])
				VALUES (GETDATE(),'TR2 No se ha realizado')
		END CATCH
END


GO

-- exec [practica1].[PR2] @EMAIL = 'sergiounix@gmail.com' , @Cod_Curso = 283
--SELECT * FROM [practica1].[HistoryLog]





---------------------------         Transaccion TR5
alter PROCEDURE [practica1].[PR5]
@Name nvarchar(max), @CreditsRequired int
AS
BEGIN

DECLARE  @Cod_Curso int


BEGIN TRANSACTION 
BEGIN TRY
		/* obtengo el ultimo id curso */
		select top 1 @Cod_Curso = CodCourse + 1 from [practica1].[Course] order by CodCourse DESC

		/* Asignar Rol De Tutor */
		INSERT INTO [practica1].[Course] ([CodCourse],[Name],[CreditsRequired]) 
		VALUES(@Cod_Curso,@Name,@CreditsRequired)

		/* Transaccion TR2 log  */
		INSERT INTO [practica1].[HistoryLog]([Date],[Description])
		VALUES (GETDATE(),'TR5 --- se ha realizado con exito')

		/* Confirmamos la transaccion*/
		COMMIT TRANSACTION 
END TRY
BEGIN CATCH
	/* Ocurrió un error, deshacemos los cambios*/ 
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error!'
	/* Falló TR5  */
	INSERT INTO [practica1].[HistoryLog]([Date],[Description])
	VALUES (GETDATE(),'TR5 --- No se ha realizado')
END CATCH
end



-- select * from [practica1].[Course]
-- exec [practica1].[PR5] @Name = 'Contabilidad', @CreditsRequired = 3
GO




---Funciones F3 y F4
CREATE FUNCTION [practica1].[F3](
	@Id uniqueidentifier
) RETURNS TABLE
AS
	Return (select * from [practica1].[Notification] where UserId = @Id	);

--SELECT * FROM [practica1].[F3] ('11111111-1AFC-1F11-11F1-40BB5E7C7E29')


CREATE FUNCTION [practica1].[F4]() RETURNS TABLE
AS
	Return (SELECT * FROM [practica1].[HistoryLog]);

--SELECT * FROM [practica1].[F4] ()


