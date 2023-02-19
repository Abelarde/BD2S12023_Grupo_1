

INSERT INTO [practica1].[Usuarios] ([Id],[Firstname],[Lastname],[Email],[DateOfBirth],[Password],[LastChanges],[EmailConfirmed])
VALUES('11111111-1AFC-1F11-11F1-40BB5E7C7E29','Mynor','Perez','perez@hotmail.es','2000-08-12 19:01:27.6700000','1234',GETDATE(),1)
--select * from [practica1].[Usuarios]


insert into [practica1].[Roles]
(Id,RoleName)Values ('69121893-3AFC-4F92-85F3-40BB5E7C7E29','Estudiante')
--select * from [practica1].[Roles]

INSERT INTO [practica1].[UsuarioRole]([RoleId],[UserId],[IsLatestVersion])
VALUES('F4E6D8FB-DF45-4C91-9794-38E043FD5ACD','11111111-1AFC-1F11-11F1-40BB5E7C7E29',1)
--select * from [practica1].[UsuarioRole]

INSERT INTO [practica1].[TutorProfile]([UserId],[TutorCode])
VALUES('11111111-1AFC-1F11-11F1-40BB5E7C7E29'
           ,'502')
-- select * from [practica1].[TutorProfile]

INSERT INTO [practica1].[Notification] ([UserId],[Message],[Date])
VALUES('11111111-1AFC-1F11-11F1-40BB5E7C7E29'
           ,'Correo Enviado'
           ,GETDATE())

-- select * from [practica1].[Notification]


INSERT INTO [practica1].[HistoryLog] ([Date],[Description])
VALUES (GETDATE()
           ,'primer log en history')
-- select * from [practica1].[HistoryLog]


--------------  TABLA ROLES
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


------- TABLA USUARIOROLE
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



------- TABLA NOTIFICACION
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


------- TABLA TUTORPROFILE
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


