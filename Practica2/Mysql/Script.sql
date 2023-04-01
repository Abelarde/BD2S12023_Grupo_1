CREATE DATABASE Practica2 DEFAULT CHARSET=utf8;
USE Practica2;

CREATE TABLE Habitacion(
	idHabitacion INT PRIMARY KEY NOT NULL,
    habitacion VARCHAR(100) NOT NULL
);

CREATE TABLE Paciente(
	idPaciente INT PRIMARY KEY NOT NULL,
    edad INT NOT NULL,
    genero VARCHAR(100) NOT NULL
);

CREATE TABLE LogHabitacion(
	idLogHabitacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idHabitacion INT NOT NULL,
    timestampx DATE NOT NULL,
    statusx VARCHAR(100) NOT NULL,
    FOREIGN KEY (idHabitacion) REFERENCES Habitacion (idHabitacion)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION       
);

CREATE TABLE Actividades(
	idActividades INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idHabitacion INT NOT NULL,
    idPaciente DATE NOT NULL,
    statusx VARCHAR(100) NOT NULL,
    FOREIGN KEY (idHabitacion) REFERENCES Habitacion (idHabitacion)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION     ,
    FOREIGN KEY (idPaciente) REFERENCES Paciente (idPaciente)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION    
);

CREATE TABLE Temp_LogHabitacion(
	idHabitacion INT NOT NULL,
    timestampx DATE NOT NULL,
    statusx VARCHAR(100) NOT NULL,
    habitacion VARCHAR(100) NOT NULL
);

CREATE TABLE LogActividades1(
	idLogActividades1 INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    timestampx DATE NOT NULL,
    actividad VARCHAR(100) NOT NULL,
	idHabitacion INT NOT NULL,
	idPaciente INT NOT NULL,
	edad INT NOT NULL,
    genero VARCHAR(100) NOT NULL,
    Habitacion VARCHAR(100) NOT NULL,
    FOREIGN KEY (idHabitacion) REFERENCES Habitacion (idHabitacion)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION   ,
    FOREIGN KEY (idPaciente) REFERENCES Paciente (idPaciente)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION   
);

CREATE TABLE LogActividades2(
	idLogActividades2 INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    timestampx DATE NOT NULL,
    actividad VARCHAR(100) NOT NULL,
	idHabitacion INT NOT NULL,
	idPaciente INT NOT NULL,
    FOREIGN KEY (idHabitacion) REFERENCES Habitacion (idHabitacion)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION   ,
    FOREIGN KEY (idPaciente) REFERENCES Paciente (idPaciente)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION   
);

SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE 'C:\\CSV\\Habitaciones.csv'
INTO TABLE HabitacioN
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\CSV\\Pacientes.csv'
INTO TABLE Paciente
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM Habitaciones;
SELECT * FROM Paciente;
