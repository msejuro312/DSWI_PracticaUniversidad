USE master
GO

IF DB_ID('BDUNIVERSIDAD2026') IS NOT NULL
BEGIN
	ALTER DATABASE BDUNIVERSIDAD2026 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE BDUNIVERSIDAD2026
END
GO

CREATE DATABASE BDUNIVERSIDAD2026
COLLATE MODERN_SPANISH_CI_AI
GO

SET NOCOUNT ON
GO

USE BDUNIVERSIDAD2026;
GO

CREATE TABLE Alumno(
codalu CHAR(5) PRIMARY KEY,
nomalu VARCHAR(60),
carrera VARCHAR(50),
semestre INT,
estado INT DEFAULT 1
)
GO

CREATE TABLE Profesor(
codprof CHAR(5) PRIMARY KEY,
nomprof VARCHAR(60),
especialidad VARCHAR(50),
grado VARCHAR(40),
estado INT DEFAULT 1
)
GO

CREATE TABLE Curso(
codcurso CHAR(5) PRIMARY KEY,
nomcurso VARCHAR(60),
creditos INT,
codprof CHAR(5) REFERENCES Profesor,
estado INT DEFAULT 1
)
GO

CREATE TABLE Matricula(
idmatricula INT PRIMARY KEY,
codalu CHAR(5) REFERENCES Alumno,
codcurso CHAR(5) REFERENCES Curso,
periodo VARCHAR(10)
)
GO

CREATE TABLE Notas(
idnota INT PRIMARY KEY,
idmatricula INT REFERENCES Matricula,
nota1 DECIMAL(5,2),
nota2 DECIMAL(5,2),
examen DECIMAL(5,2)
)
GO

INSERT INTO Alumno VALUES('A0001','Juan Pérez García','Ingenieria de Sistemas',2,1);
INSERT INTO Alumno VALUES('A0002','Carlos Herrera Flores','Ingenieria de Sistemas',3,1);
INSERT INTO Alumno VALUES('A0003','Verónica Mendoza Flores','Ingenieria de Sistemas',4,1);
INSERT INTO Alumno VALUES('A0004','Omar Velásquez Flores','Ingenieria de Sistemas',5,1);
INSERT INTO Alumno VALUES('A0005','Claudia León Herrera','Ingenieria de Sistemas',6,1);
INSERT INTO Alumno VALUES('A0006','Alonso Ponce Vega','Ingenieria de Sistemas',7,1);
INSERT INTO Alumno VALUES('A0007','Diana Paredes Torres','Ingenieria de Sistemas',8,1);
INSERT INTO Alumno VALUES('A0008','Renzo Cueva Salinas','Ingenieria de Sistemas',9,1);
INSERT INTO Alumno VALUES('A0009','Natalia Cabrera Soto','Ingenieria de Sistemas',10,1);
INSERT INTO Alumno VALUES('A0010','Emilio Vargas Rojas','Ingenieria de Sistemas',1,1);
INSERT INTO Alumno VALUES('A0011','Tatiana Gutiérrez Medina','Ingenieria de Sistemas',2,1);
INSERT INTO Alumno VALUES('A0012','Ximena Flores Díaz','Ingenieria de Sistemas',3,1);
INSERT INTO Alumno VALUES('A0013','Joaquín Salinas Castro','Ingenieria de Sistemas',4,1);
INSERT INTO Alumno VALUES('A0014','María López Díaz','Ingenieria de Sistemas',5,1);
INSERT INTO Alumno VALUES('A0015','Bryan Torres Castillo','Ingenieria de Sistemas',6,1);
INSERT INTO Alumno VALUES('A0016','Milagros Rivera Quispe','Ingenieria de Sistemas',7,1);
INSERT INTO Alumno VALUES('A0017','Rosa Benites Ramos','Ingenieria de Sistemas',8,1);
INSERT INTO Alumno VALUES('A0018','Iván Delgado Quispe','Ingenieria de Sistemas',9,1);
INSERT INTO Alumno VALUES('A0019','Alejandra Rojas Peña','Ingenieria de Sistemas',10,1);
INSERT INTO Alumno VALUES('A0020','Ángel Guerrero Mendoza','Ingenieria de Sistemas',1,1);
INSERT INTO Alumno VALUES('A0021','Paola Reyes Flores','Ingenieria de Sistemas',2,1);
INSERT INTO Alumno VALUES('A0022','Gabriela Huamán León','Ingenieria de Sistemas',3,1);
INSERT INTO Alumno VALUES('A0023','Brenda Villanueva Soto','Ingenieria de Sistemas',4,1);
INSERT INTO Alumno VALUES('A0024','Cristian Valdez Ortiz','Ingenieria de Sistemas',5,1);
INSERT INTO Alumno VALUES('A0025','Sergio Medina Castro','Ingenieria de Sistemas',6,1);
INSERT INTO Alumno VALUES('A0026','Lucía Fernández Torres','Ingenieria de Sistemas',7,1);
INSERT INTO Alumno VALUES('A0027','Pedro Sánchez Rojas','Ingenieria de Sistemas',8,1);
INSERT INTO Alumno VALUES('A0028','Andrea Castillo Vega','Ingenieria de Sistemas',9,1);
INSERT INTO Alumno VALUES('A0029','Valeria Mendoza Ruiz','Ingenieria de Sistemas',10,1);
INSERT INTO Alumno VALUES('A0030','Diego Morales Castro','Ingenieria de Sistemas',1,1);
INSERT INTO Alumno VALUES('A0031','José Ramírez Salas','Ingenieria de Sistemas',2,1);
INSERT INTO Alumno VALUES('A0032','Sofía Navarro León','Ingenieria de Sistemas',3,1);
INSERT INTO Alumno VALUES('A0033','Fiorella Palacios Díaz','Ingenieria de Sistemas',4,1);
INSERT INTO Alumno VALUES('A0034','Héctor Lozano Ramos','Ingenieria de Sistemas',5,1);
INSERT INTO Alumno VALUES('A0035','Nicole Salazar Ponce','Ingenieria de Sistemas',6,1);
INSERT INTO Alumno VALUES('A0036','Melissa Acosta Pérez','Ingenieria de Sistemas',7,1);
INSERT INTO Alumno VALUES('A0037','Miguel Ortiz Paredes','Ingenieria de Sistemas',8,1);
INSERT INTO Alumno VALUES('A0038','Luis Cabrera Flores','Ingenieria de Sistemas',9,1);
INSERT INTO Alumno VALUES('A0039','Elena Vargas Medina','Ingenieria de Sistemas',10,1);
INSERT INTO Alumno VALUES('A0040','Camila Ríos Aguilar','Ingenieria de Sistemas',1,1);
INSERT INTO Alumno VALUES('A0041','Fernando Silva Quispe','Ingenieria de Sistemas',2,1);
INSERT INTO Alumno VALUES('A0042','Karla Espinoza Rojas','Ingenieria de Sistemas',3,1);
INSERT INTO Alumno VALUES('A0043','César Fuentes Gutiérrez','Ingenieria de Sistemas',4,1);
INSERT INTO Alumno VALUES('A0044','Daniela Chávez Soto','Ingenieria de Sistemas',5,1);
INSERT INTO Alumno VALUES('A0045','Ricardo Núñez Campos','Ingenieria de Sistemas',6,1);
INSERT INTO Alumno VALUES('A0046','Patricia Molina Díaz','Ingenieria de Sistemas',7,1);
INSERT INTO Alumno VALUES('A0047','Javier Cruz Herrera','Ingenieria de Sistemas',8,1);
INSERT INTO Alumno VALUES('A0048','Kevin Alarcón Vega','Ingenieria de Sistemas',9,1);
INSERT INTO Alumno VALUES('A0049','Marco Cárdenas Ruiz','Ingenieria de Sistemas',10,1);
INSERT INTO Alumno VALUES('A0050','Eduardo Campos Silva','Ingenieria de Sistemas',1,1);
GO

INSERT INTO Profesor VALUES('P0001','Fiorella Castro','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0002','Renzo Fernández','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0003','Yolanda Benavides','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0004','Armando Huamán','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0005','Natalia Molina','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0006','Sergio Núñez','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0007','Miriam Velásquez','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0008','Daniel Cruz','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0009','Susana Palacios','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0010','Lorena Salazar','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0011','Javier Ortega','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0012','Gustavo Alarcón','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0013','Alicia Peña','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0014','Beatriz Soto','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0015','Diana Ríos','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0016','Jaime Lozano','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0017','Karina Rivera','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0018','Marco Villanueva','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0019','Roberto Aguilar','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0020','Liliana Ponce','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0021','Óscar Guerrero','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0022','Raúl Valdez','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0023','Isabel Gutiérrez','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0024','Andrés Cárdenas','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0025','Paola Silva','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0026','Julio Benites','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0027','Teresa Acosta','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0028','Verónica Ruiz','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0029','Héctor Morales','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0030','Eduardo Campos','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0031','Gloria Chávez','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0032','Manuel Espinoza','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0033','Sonia Delgado','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0034','César Fuentes','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0035','Carlos Ramírez','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0036','Fernando Navarro','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0037','Claudia León','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0038','Alberto Medina','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0039','Mónica Cabrera','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0040','Silvia Paredes','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0041','Ricardo Flores','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0042','Carmen Quispe','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0043','Ana Torres','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0044','Luis Vargas','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0045','Patricia Gómez','Especialidad 1','Magister',1);
INSERT INTO Profesor VALUES('P0046','Jorge Castillo','Especialidad 2','Magister',1);
INSERT INTO Profesor VALUES('P0047','Elena Rojas','Especialidad 3','Magister',1);
INSERT INTO Profesor VALUES('P0048','Miguel Herrera','Especialidad 4','Magister',1);
INSERT INTO Profesor VALUES('P0049','Rosa Mendoza','Especialidad 5','Magister',1);
INSERT INTO Profesor VALUES('P0050','Víctor Salinas','Especialidad 1','Magister',1);
GO

INSERT INTO Curso VALUES('C0001','Investigación Operativa',3,'P0001',1);
INSERT INTO Curso VALUES('C0002','Ética Profesional',4,'P0002',1);
INSERT INTO Curso VALUES('C0003','Cálculo I',5,'P0003',1);
INSERT INTO Curso VALUES('C0004','Administración de Empresas',6,'P0004',1);
INSERT INTO Curso VALUES('C0005','Comercio Electrónico',2,'P0005',1);
INSERT INTO Curso VALUES('C0006','Contabilidad General',3,'P0006',1);
INSERT INTO Curso VALUES('C0007','Gestión Empresarial',4,'P0007',1);
INSERT INTO Curso VALUES('C0008','Economía',5,'P0008',1);
INSERT INTO Curso VALUES('C0009','Marketing Digital',6,'P0009',1);
INSERT INTO Curso VALUES('C0010','Desarrollo de Videojuegos',2,'P0010',1);
INSERT INTO Curso VALUES('C0011','Programación I',3,'P0011',1);
INSERT INTO Curso VALUES('C0012','Desarrollo Web Avanzado',4,'P0012',1);
INSERT INTO Curso VALUES('C0013','Ciberseguridad',5,'P0013',1);
INSERT INTO Curso VALUES('C0014','Programación II',6,'P0014',1);
INSERT INTO Curso VALUES('C0015','Base de Datos I',2,'P0015',1);
INSERT INTO Curso VALUES('C0016','Análisis de Sistemas',3,'P0016',1);
INSERT INTO Curso VALUES('C0017','Programación Web',4,'P0017',1);
INSERT INTO Curso VALUES('C0018','Base de Datos II',5,'P0018',1);
INSERT INTO Curso VALUES('C0019','Algoritmos',6,'P0019',1);
INSERT INTO Curso VALUES('C0020','Ingeniería de Software',2,'P0020',1);
INSERT INTO Curso VALUES('C0021','Estructura de Datos',3,'P0021',1);
INSERT INTO Curso VALUES('C0022','Redes de Computadoras',4,'P0022',1);
INSERT INTO Curso VALUES('C0023','Sistemas Operativos',5,'P0023',1);
INSERT INTO Curso VALUES('C0024','Arquitectura de Computadoras',6,'P0024',1);
INSERT INTO Curso VALUES('C0025','Inteligencia Artificial',2,'P0025',1);
INSERT INTO Curso VALUES('C0026','Aprendizaje Automático',3,'P0026',1);
INSERT INTO Curso VALUES('C0027','Ciencia de Datos',4,'P0027',1);
INSERT INTO Curso VALUES('C0028','Procesamiento Digital de Imágenes',5,'P0028',1);
INSERT INTO Curso VALUES('C0029','Internet de las Cosas',6,'P0029',1);
INSERT INTO Curso VALUES('C0030','Cálculo II',2,'P0030',1);
INSERT INTO Curso VALUES('C0031','Comunicación Oral y Escrita',3,'P0031',1);
INSERT INTO Curso VALUES('C0032','Taller de Tesis',4,'P0032',1);
INSERT INTO Curso VALUES('C0033','Minería de Datos',5,'P0033',1);
INSERT INTO Curso VALUES('C0034','Desarrollo Móvil',6,'P0034',1);
INSERT INTO Curso VALUES('C0035','Seguridad InformÉtica',2,'P0035',1);
INSERT INTO Curso VALUES('C0036','Computación en la Nube',3,'P0036',1);
INSERT INTO Curso VALUES('C0037','Programación Orientada a Objetos',4,'P0037',1);
INSERT INTO Curso VALUES('C0038','Diseño de Interfaces',5,'P0038',1);
INSERT INTO Curso VALUES('C0039','Gestión de Proyectos TI',6,'P0039',1);
INSERT INTO Curso VALUES('C0040','Experiencia de Usuario (UX)',2,'P0040',1);
INSERT INTO Curso VALUES('C0041','MatemÉtica Discreta',3,'P0041',1);
INSERT INTO Curso VALUES('C0042','Estadística',4,'P0042',1);
INSERT INTO Curso VALUES('C0043','Física General',5,'P0043',1);
INSERT INTO Curso VALUES('C0044','Sistemas Distribuidos',6,'P0044',1);
INSERT INTO Curso VALUES('C0045','Emprendimiento e Innovación',2,'P0045',1);
INSERT INTO Curso VALUES('C0046','RobÉtica',3,'P0046',1);
INSERT INTO Curso VALUES('C0047','Visión por Computadora',4,'P0047',1);
INSERT INTO Curso VALUES('C0048','Probabilidad',5,'P0048',1);
INSERT INTO Curso VALUES('C0049','Metodología de la Investigación',6,'P0049',1);
INSERT INTO Curso VALUES('C0050','Compiladores',2,'P0050',1);
GO

INSERT INTO Matricula VALUES(1,'A0001','C0002','2025-I');
INSERT INTO Matricula VALUES(2,'A0002','C0004','2025-I');
INSERT INTO Matricula VALUES(3,'A0003','C0006','2025-I');
INSERT INTO Matricula VALUES(4,'A0004','C0008','2025-I');
INSERT INTO Matricula VALUES(5,'A0005','C0010','2025-I');
INSERT INTO Matricula VALUES(6,'A0006','C0012','2025-I');
INSERT INTO Matricula VALUES(7,'A0007','C0014','2025-I');
INSERT INTO Matricula VALUES(8,'A0008','C0016','2025-I');
INSERT INTO Matricula VALUES(9,'A0009','C0018','2025-I');
INSERT INTO Matricula VALUES(10,'A0010','C0020','2025-I');
INSERT INTO Matricula VALUES(11,'A0011','C0022','2025-I');
INSERT INTO Matricula VALUES(12,'A0012','C0024','2025-I');
INSERT INTO Matricula VALUES(13,'A0013','C0026','2025-I');
INSERT INTO Matricula VALUES(14,'A0014','C0028','2025-I');
INSERT INTO Matricula VALUES(15,'A0015','C0030','2025-I');
INSERT INTO Matricula VALUES(16,'A0016','C0032','2025-I');
INSERT INTO Matricula VALUES(17,'A0017','C0034','2025-I');
INSERT INTO Matricula VALUES(18,'A0018','C0036','2025-I');
INSERT INTO Matricula VALUES(19,'A0019','C0038','2025-I');
INSERT INTO Matricula VALUES(20,'A0020','C0040','2025-I');
INSERT INTO Matricula VALUES(21,'A0021','C0042','2025-I');
INSERT INTO Matricula VALUES(22,'A0022','C0044','2025-I');
INSERT INTO Matricula VALUES(23,'A0023','C0046','2025-I');
INSERT INTO Matricula VALUES(24,'A0024','C0048','2025-I');
INSERT INTO Matricula VALUES(25,'A0025','C0050','2025-I');
INSERT INTO Matricula VALUES(26,'A0026','C0001','2025-I');
INSERT INTO Matricula VALUES(27,'A0027','C0003','2025-I');
INSERT INTO Matricula VALUES(28,'A0028','C0005','2025-I');
INSERT INTO Matricula VALUES(29,'A0029','C0007','2025-I');
INSERT INTO Matricula VALUES(30,'A0030','C0009','2025-I');
INSERT INTO Matricula VALUES(31,'A0031','C0011','2025-I');
INSERT INTO Matricula VALUES(32,'A0032','C0013','2025-I');
INSERT INTO Matricula VALUES(33,'A0033','C0015','2025-I');
INSERT INTO Matricula VALUES(34,'A0034','C0017','2025-I');
INSERT INTO Matricula VALUES(35,'A0035','C0019','2025-I');
INSERT INTO Matricula VALUES(36,'A0036','C0021','2025-I');
INSERT INTO Matricula VALUES(37,'A0037','C0023','2025-I');
INSERT INTO Matricula VALUES(38,'A0038','C0025','2025-I');
INSERT INTO Matricula VALUES(39,'A0039','C0027','2025-I');
INSERT INTO Matricula VALUES(40,'A0040','C0029','2025-I');
INSERT INTO Matricula VALUES(41,'A0041','C0031','2025-I');
INSERT INTO Matricula VALUES(42,'A0042','C0033','2025-I');
INSERT INTO Matricula VALUES(43,'A0043','C0035','2025-I');
INSERT INTO Matricula VALUES(44,'A0044','C0037','2025-I');
INSERT INTO Matricula VALUES(45,'A0045','C0039','2025-I');
INSERT INTO Matricula VALUES(46,'A0046','C0041','2025-I');
INSERT INTO Matricula VALUES(47,'A0047','C0043','2025-I');
INSERT INTO Matricula VALUES(48,'A0048','C0045','2025-I');
INSERT INTO Matricula VALUES(49,'A0049','C0047','2025-I');
INSERT INTO Matricula VALUES(50,'A0050','C0049','2025-I');
GO

INSERT INTO Matricula VALUES(51,'A0001','C0001','2026-I');
INSERT INTO Matricula VALUES(52,'A0002','C0002','2026-I');
INSERT INTO Matricula VALUES(53,'A0003','C0003','2026-I');
INSERT INTO Matricula VALUES(54,'A0004','C0004','2026-I');
INSERT INTO Matricula VALUES(55,'A0005','C0005','2026-I');
INSERT INTO Matricula VALUES(56,'A0006','C0006','2026-I');
INSERT INTO Matricula VALUES(57,'A0007','C0007','2026-I');
INSERT INTO Matricula VALUES(58,'A0008','C0008','2026-I');
INSERT INTO Matricula VALUES(59,'A0009','C0009','2026-I');
INSERT INTO Matricula VALUES(60,'A0010','C0010','2026-I');
INSERT INTO Matricula VALUES(61,'A0011','C0011','2026-I');
INSERT INTO Matricula VALUES(62,'A0012','C0012','2026-I');
INSERT INTO Matricula VALUES(63,'A0013','C0013','2026-I');
INSERT INTO Matricula VALUES(64,'A0014','C0014','2026-I');
INSERT INTO Matricula VALUES(65,'A0015','C0015','2026-I');
INSERT INTO Matricula VALUES(66,'A0016','C0016','2026-I');
INSERT INTO Matricula VALUES(67,'A0017','C0017','2026-I');
INSERT INTO Matricula VALUES(68,'A0018','C0018','2026-I');
INSERT INTO Matricula VALUES(69,'A0019','C0019','2026-I');
INSERT INTO Matricula VALUES(70,'A0020','C0020','2026-I');
INSERT INTO Matricula VALUES(71,'A0021','C0021','2026-I');
INSERT INTO Matricula VALUES(72,'A0022','C0022','2026-I');
INSERT INTO Matricula VALUES(73,'A0023','C0023','2026-I');
INSERT INTO Matricula VALUES(74,'A0024','C0024','2026-I');
INSERT INTO Matricula VALUES(75,'A0025','C0025','2026-I');
INSERT INTO Matricula VALUES(76,'A0026','C0026','2026-I');
INSERT INTO Matricula VALUES(77,'A0027','C0027','2026-I');
INSERT INTO Matricula VALUES(78,'A0028','C0028','2026-I');
INSERT INTO Matricula VALUES(79,'A0029','C0029','2026-I');
INSERT INTO Matricula VALUES(80,'A0030','C0030','2026-I');
INSERT INTO Matricula VALUES(81,'A0031','C0031','2026-I');
INSERT INTO Matricula VALUES(82,'A0032','C0032','2026-I');
INSERT INTO Matricula VALUES(83,'A0033','C0033','2026-I');
INSERT INTO Matricula VALUES(84,'A0034','C0034','2026-I');
INSERT INTO Matricula VALUES(85,'A0035','C0035','2026-I');
INSERT INTO Matricula VALUES(86,'A0036','C0036','2026-I');
INSERT INTO Matricula VALUES(87,'A0037','C0037','2026-I');
INSERT INTO Matricula VALUES(88,'A0038','C0038','2026-I');
INSERT INTO Matricula VALUES(89,'A0039','C0039','2026-I');
INSERT INTO Matricula VALUES(90,'A0040','C0040','2026-I');
INSERT INTO Matricula VALUES(91,'A0041','C0041','2026-I');
INSERT INTO Matricula VALUES(92,'A0042','C0042','2026-I');
INSERT INTO Matricula VALUES(93,'A0043','C0043','2026-I');
INSERT INTO Matricula VALUES(94,'A0044','C0044','2026-I');
INSERT INTO Matricula VALUES(95,'A0045','C0045','2026-I');
INSERT INTO Matricula VALUES(96,'A0046','C0046','2026-I');
INSERT INTO Matricula VALUES(97,'A0047','C0047','2026-I');
INSERT INTO Matricula VALUES(98,'A0048','C0048','2026-I');
INSERT INTO Matricula VALUES(99,'A0049','C0049','2026-I');
INSERT INTO Matricula VALUES(100,'A0050','C0050','2026-I');
GO

INSERT INTO Notas VALUES(1,1,11,12,13);
INSERT INTO Notas VALUES(2,2,12,13,14);
INSERT INTO Notas VALUES(3,3,13,14,15);
INSERT INTO Notas VALUES(4,4,14,15,16);
INSERT INTO Notas VALUES(5,5,15,16,17);
INSERT INTO Notas VALUES(6,6,16,17,18);
INSERT INTO Notas VALUES(7,7,17,18,19);
INSERT INTO Notas VALUES(8,8,18,19,12);
INSERT INTO Notas VALUES(9,9,19,11,13);
INSERT INTO Notas VALUES(10,10,10,12,14);
INSERT INTO Notas VALUES(11,11,11,13,15);
INSERT INTO Notas VALUES(12,12,12,14,16);
INSERT INTO Notas VALUES(13,13,13,15,17);
INSERT INTO Notas VALUES(14,14,14,16,18);
INSERT INTO Notas VALUES(15,15,15,17,19);
INSERT INTO Notas VALUES(16,16,16,18,12);
INSERT INTO Notas VALUES(17,17,17,19,13);
INSERT INTO Notas VALUES(18,18,18,11,14);
INSERT INTO Notas VALUES(19,19,19,12,15);
INSERT INTO Notas VALUES(20,20,10,13,16);
INSERT INTO Notas VALUES(21,21,11,14,17);
INSERT INTO Notas VALUES(22,22,12,15,18);
INSERT INTO Notas VALUES(23,23,13,16,19);
INSERT INTO Notas VALUES(24,24,14,17,12);
INSERT INTO Notas VALUES(25,25,15,18,13);
INSERT INTO Notas VALUES(26,26,16,19,14);
INSERT INTO Notas VALUES(27,27,17,11,15);
INSERT INTO Notas VALUES(28,28,18,12,16);
INSERT INTO Notas VALUES(29,29,19,13,17);
INSERT INTO Notas VALUES(30,30,10,14,18);
INSERT INTO Notas VALUES(31,31,11,15,19);
INSERT INTO Notas VALUES(32,32,12,16,12);
INSERT INTO Notas VALUES(33,33,13,17,13);
INSERT INTO Notas VALUES(34,34,14,18,14);
INSERT INTO Notas VALUES(35,35,15,19,15);
INSERT INTO Notas VALUES(36,36,16,11,16);
INSERT INTO Notas VALUES(37,37,17,12,17);
INSERT INTO Notas VALUES(38,38,18,13,18);
INSERT INTO Notas VALUES(39,39,19,14,19);
INSERT INTO Notas VALUES(40,40,10,15,12);
INSERT INTO Notas VALUES(41,41,11,16,13);
INSERT INTO Notas VALUES(42,42,12,17,14);
INSERT INTO Notas VALUES(43,43,13,18,15);
INSERT INTO Notas VALUES(44,44,14,19,16);
INSERT INTO Notas VALUES(45,45,15,11,17);
INSERT INTO Notas VALUES(46,46,16,12,18);
INSERT INTO Notas VALUES(47,47,17,13,19);
INSERT INTO Notas VALUES(48,48,18,14,12);
INSERT INTO Notas VALUES(49,49,19,15,13);
INSERT INTO Notas VALUES(50,50,10,16,14);
GO

INSERT INTO Notas VALUES(51,1,11,12,13);
INSERT INTO Notas VALUES(52,2,12,13,14);
INSERT INTO Notas VALUES(53,3,13,14,15);
INSERT INTO Notas VALUES(54,4,14,15,16);
INSERT INTO Notas VALUES(55,5,15,16,17);
INSERT INTO Notas VALUES(56,6,16,17,18);
INSERT INTO Notas VALUES(57,7,17,18,19);
INSERT INTO Notas VALUES(58,8,18,19,12);
INSERT INTO Notas VALUES(59,9,19,11,13);
INSERT INTO Notas VALUES(60,10,10,12,14);
INSERT INTO Notas VALUES(61,11,11,13,15);
INSERT INTO Notas VALUES(62,12,12,14,16);
INSERT INTO Notas VALUES(63,13,13,15,17);
INSERT INTO Notas VALUES(64,14,14,16,18);
INSERT INTO Notas VALUES(65,15,15,17,19);
INSERT INTO Notas VALUES(66,16,16,18,12);
INSERT INTO Notas VALUES(67,17,17,19,13);
INSERT INTO Notas VALUES(68,18,18,11,14);
INSERT INTO Notas VALUES(69,19,19,12,15);
INSERT INTO Notas VALUES(70,20,10,13,16);
INSERT INTO Notas VALUES(71,21,11,14,17);
INSERT INTO Notas VALUES(72,22,12,15,18);
INSERT INTO Notas VALUES(73,23,13,16,19);
INSERT INTO Notas VALUES(74,24,14,17,12);
INSERT INTO Notas VALUES(75,25,15,18,13);
INSERT INTO Notas VALUES(76,26,16,19,14);
INSERT INTO Notas VALUES(77,27,17,11,15);
INSERT INTO Notas VALUES(78,28,18,12,16);
INSERT INTO Notas VALUES(79,29,19,13,17);
INSERT INTO Notas VALUES(80,30,10,14,18);
INSERT INTO Notas VALUES(81,31,11,15,19);
INSERT INTO Notas VALUES(82,32,12,16,12);
INSERT INTO Notas VALUES(83,33,13,17,13);
INSERT INTO Notas VALUES(84,34,14,18,14);
INSERT INTO Notas VALUES(85,35,15,19,15);
INSERT INTO Notas VALUES(86,36,16,11,16);
INSERT INTO Notas VALUES(87,37,17,12,17);
INSERT INTO Notas VALUES(88,38,18,13,18);
INSERT INTO Notas VALUES(89,39,19,14,19);
INSERT INTO Notas VALUES(90,40,10,15,12);
INSERT INTO Notas VALUES(91,41,11,16,13);
INSERT INTO Notas VALUES(92,42,12,17,14);
INSERT INTO Notas VALUES(93,43,13,18,15);
INSERT INTO Notas VALUES(94,44,14,19,16);
INSERT INTO Notas VALUES(95,45,15,11,17);
INSERT INTO Notas VALUES(96,46,16,12,18);
INSERT INTO Notas VALUES(97,47,17,13,19);
INSERT INTO Notas VALUES(98,48,18,14,12);
INSERT INTO Notas VALUES(99,49,19,15,13);
INSERT INTO Notas VALUES(100,50,10,16,14);
GO

SET NOCOUNT OFF
GO

SELECT 'Base de Datos BDUNIVERSIDAD2026 creada de forma correcta' AS MENSAJE
GO

-- =============================================
-- STORED PROCEDURES PARA EL PROYECTO ASP.NET
-- =============================================

-- SP para listar cursos (usado en DropDownList)
create or alter procedure sp_list_cursos
as
begin
    select codcurso, nomcurso from Curso where estado = 1
end
go

-- SP para listar periodos academicos (usado en DropDownList)
create or alter procedure sp_list_periodos
as
begin
    select distinct periodo from Matricula order by periodo
end
go

-- SP Pregunta 1: Consulta de Notas por Periodo Academico
create or alter procedure NotasPeriodo
@periodo varchar(10)
as
begin
    select a.codalu, a.nomalu, c.nomcurso, p.nomprof,
           n.nota1, n.nota2, n.examen,
           round((n.nota1 + n.nota2 + n.examen) / 3.0, 2) as promedio
    from Notas n
    inner join Matricula m on n.idmatricula = m.idmatricula
    inner join Alumno a on m.codalu = a.codalu
    inner join Curso c on m.codcurso = c.codcurso
    inner join Profesor p on c.codprof = p.codprof
    where m.periodo = @periodo
end
go

-- SP Pregunta 2: Reporte de Rendimiento Academico por Curso
create or alter procedure ReporteRendimientoCurso
@codCurso char(5)
as
begin
    select a.codalu, a.nomalu,
           n.nota1, n.nota2, n.examen,
           round((n.nota1 + n.nota2 + n.examen) / 3.0, 2) as promedio,
           iif((n.nota1 + n.nota2 + n.examen) / 3.0 >= 10.5, 'Aprobado', 'Desaprobado') as estado
    from Notas n
    inner join Matricula m on n.idmatricula = m.idmatricula
    inner join Alumno a on m.codalu = a.codalu
     where m.codcurso = @codCurso
end
go

-- SP para Resumen de Rendimiento Academico por Curso
create or alter procedure ResumenRendimientoCurso
@codCurso char(5)
as
begin
    select 
        c.codcurso, c.nomcurso, p.nomprof,
        count(distinct m.codalu) as cantAlumnos,
        round(avg((n.nota1 + n.nota2 + n.examen) / 3.0), 2) as promGeneral,
        sum(iif((n.nota1 + n.nota2 + n.examen) / 3.0 >= 11, 1, 0)) as aprobados,
        sum(iif((n.nota1 + n.nota2 + n.examen) / 3.0 < 11, 1, 0)) as desaprobados
    from Notas n
    inner join Matricula m on n.idmatricula = m.idmatricula
    inner join Curso c on m.codcurso = c.codcurso
    inner join Profesor p on c.codprof = p.codprof
    where m.codcurso = @codCurso
    group by c.codcurso, c.nomcurso, p.nomprof
end
go
