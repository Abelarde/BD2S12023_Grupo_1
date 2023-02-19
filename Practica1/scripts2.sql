--Transaccion
---------------------------------------------------------------


--OBTENER USARIOS 
--FUNCION 5
CREATE FUNCTION [dbo].[Func_usuarios](
	@id_usuario uniqueidentifier
) RETURNS TABLE
AS
	Return (
		SELECT [User].Firstname, [User].Lastname, [User].Email, [User].DateOfBirth,
				[PS].Credits, [R].RoleName 
		FROM [practica1].[Usuarios] [User]
			INNER JOIN [practica1].[ProfileStudent] [PS]
				ON [User].Id = [PS].UserId
			INNER JOIN [practica1].[UsuarioRole] [UR]
				ON [UR].UserId = [User].Id
			INNER JOIN [practica1].[Roles] [R]
				ON [R].Id = [UR].RoleId
			WHERE [User].Id = @id_usuario
	);
	
SELECT * FROM dbo.Func_usuarios('11111111-1AFC-1F11-11F1-40BB5E7C7E29');

--------------  TABLA COURSEASSIGNMENT
CREATE TRIGGER trigger_courseAssignment_insert
ON [practica1].[CourseAssignment]
AFTER INSERT   
AS  
   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un insert en la tabla  - CourseAssignment');
go

CREATE TRIGGER trigger_courseAssignment_update
ON [practica1].[CourseAssignment] 
AFTER UPDATE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un UPDATE al un registro en la tabla  - CourseAssignment'     );
go

CREATE TRIGGER trigger_courseAssignment_delete
ON [practica1].[CourseAssignment] 
AFTER DELETE   
AS  

   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un DELETE al un registro en la tabla  - CourseAssignment'     );
go

--------------------------------------------------------------------------------------------------------
--------------  TABLA COURSE
CREATE TRIGGER trigger_Course_insert
ON [practica1].[Course]
AFTER INSERT   
AS  
   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un insert en la tabla  - Course');
go

CREATE TRIGGER trigger_Course_update
ON [practica1].[Course] 
AFTER UPDATE   
AS  
   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un UPDATE al un registro en la tabla  - Course'     );
go

CREATE TRIGGER trigger_Course_delete
ON [practica1].[Course] 
AFTER DELETE   
AS  
   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un DELETE al un registro en la tabla  - Course'     );
go

--------------------------------------------------------------------------------------------------------
--------------  TABLA COURSE
CREATE TRIGGER trigger_courseTutor_insert
ON [practica1].[CourseTutor]
AFTER INSERT   
AS  
   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un insert en la tabla  - CourseTutor');
go

CREATE TRIGGER trigger_Course_update
ON [practica1].[CourseTutor] 
AFTER UPDATE   
AS  
   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un UPDATE al un registro en la tabla  - CourseTutor'     );
go

CREATE TRIGGER trigger_Course_delete
ON [practica1].[CourseTutor] 
AFTER DELETE   
AS  
   INSERT INTO [practica1].[HistoryLog]([Date],[Description])
   VALUES (GETDATE() , 'Se ha realizado un DELETE al un registro en la tabla  - CourseTutor'     );
go

--------------------------------------------------