create database Habitapp_DB
go
use Habitapp_DB
go
Create table Tipo_Usuario(
	ID smallint not null identity(1,1) Primary Key,
	Nombre varchar(100) not null
)
go
Create table Usuarios(
	ID bigint not null identity(1,1) Primary key,
	IDTipo smallint not null foreign key references Tipo_Usuario(ID),
	Contraseña varchar(100) not null 
)
go
--Tipo de usuario lo usamos para definir si se trata de un inquilino o si se trata de algun empleado (administrador)


--El Sistema va a tener una seccion de reclamos donde el usuario dejara asentado su reclamo, cada reclamo tiene un estado correspondiente
Create table Estado_Reclamo(
	ID smallint not null identity(1,1) Primary key,
	Nombre varchar(100) not null 
)
go
Create table Reclamos(
	ID bigint not null identity(1,1) Primary key,
	IDEstado smallint not null foreign key references Estado_Reclamo(ID),
	IDUsuario bigint not null foreign key references Usuarios(ID),
	Asunto varchar(200) not null,
	Detalle varchar(MAX) not null,
	FechaHora datetime not null default(getdate())
)
go

--Los Inquilinos pueden publicar clasificados para ofrecer productos o servicios. 
Create table Clasificados(
	ID bigint not null identity(1,1) Primary Key,
	IDUsuario bigint not null Foreign key references Usuarios(ID),
	Titulo varchar(200) not null,
	Detalle varchar(MAX) not null,
	Imagen varchar(MAX) null, --No Tenemos idea de como guardar una imagen en la base de datos.
	FechaHora DateTime not null default (getdate())
)
go

--Los inquilinos pueden publicar servicio de carpooling especificando el dia y hora que salen del edificio y el destino del viaje 
Create table carpooling(
	ID bigint not null identity(1,1) Primary key,
	IDUsuario bigint not null Foreign Key references Usuarios(ID),
	FechaHora datetime null check(FechaHora>=getdate()),
	Destino varchar(200) null,
	Estado varchar(20) not null
)

go
Create table Invitaciones(
	ID bigint not null identity(1,1) Primary key,
	FechaHora datetime not null check(FechaHora>=getdate()),
	IDUsuario bigint not null foreign key references Usuarios(ID),
	DNI int not null,
	Nombre varchar(100) not null,
	Apellido varchar (100) not null
)
go

--Esta es la parte de datos personales
Create table Telefonos(
	IDUsuario bigint not null foreign key references Usuarios(ID),
	Telefono varchar(15) not null
)
go
Create table Datos_Personales(
	IDUsuario bigint not null foreign key references Usuarios(ID),
	Nombres varchar(100) not null,
	Apellidos varchar(100) not null,
	Genero char null,
	DNI int not null check(DNI>0),
	Mail varchar(140) null,
	Nacimiento datetime not null check(Year(Nacimiento)>1900),
)
go

-- Datos para los deptos o casas del complejo, Cada Unidad funcional tiene un tipo (depto, casa, etc.).
Create table Tipo_Unidad_Funcional(
	ID smallint not null identity(1,1) primary key,
	Nombre varchar(100) not null
)
go
Create table Unidad_Funcional(
	ID bigint not null identity(1,1) primary key,
	IDTipo smallint not null foreign key references Tipo_Unidad_Funcional(ID),
	IDUsuario bigint not null foreign key references Usuarios(ID), 
	Numero int not null check(Numero>0),
	Torre smallint null check(Torre>0),
	Piso smallint null check(Piso>0)
)
go

--Las expensas esta compuestas por gastos (factura de luz,gas, etc) tiene fecha de confeccion e importe total que sera la suma de los gastos asociados.
-- Es decir, "factura de luz" corresponde a un "tipo de gasto", el cual tiene un ID y un nombre. Cuando se cargar los gastos al sistema para confeccionar
-- las expensas, se selecciona el tipo de gasto y en caso de no existir, se lo agregar. "Factura de gas" puede tener el ID=5, y arreglo del porton, puede
-- no estar registrado como tipo de gasto, entonces se deberia cargar en la tabla de Tipo de gasto y se le asignaria automaticamente el ID que le corresponde.
Create table Expensas(
	ID bigint not null identity(1,1) primary key,
	IDUnidadFuncional bigint not null foreign key references Unidad_Funcional(ID),
	Fecha date not null default(getdate()),
	Importe money not null check(Importe>=0),
)
go

Create table Tipo_Gasto(
	ID smallint not null identity(1,1) primary key,
	Nombre varchar(100) not null,
)
go
Create table Gastos(
	ID smallint not null identity(1,1) primary key,
	Importe money not null check (importe>=0),
	FechaHora datetime not null default (getdate()) check(FechaHora<=getdate()),
	IDExpensa bigint not null foreign key references Expensas(ID), 
	IDTipo smallint not null foreign key references Tipo_Gasto(ID)
)
go 
--Son los pagos realizados por los inquilinos
Create table Pagos(
	ID bigint not null identity(1,1) primary key,
	IDExpensas bigint not null foreign key references Expensas(ID),
	Importe money not null check (importe>0),
	Fecha date not null default(getdate()),
)
go

--Las instalaciones las pensamos como lugares a los cuales los vecinos pueden acceder para desempeñar alguna actividad (zoom,pileta, cancha de tenis, etc)
--Para accederlos se deberia realizar una reserva, para esto cada Instalacion tiene un estado (Alquilado, Reservado, Disponible, en refaccion, etc.)

Create table Estados_Instalacion(
	ID smallint not null identity(1,1) primary key,
	Nombre varchar(100) not null
)
go

--La instalacion tiene horarios disponibles (apertura y cierre), Horas Disponibles indica la cantidad de hs que se alquilan las instalaciones.
-- Una cancha de tenis puede reservarse por hora, asi que las HorasDisponibles seria 1, encambio en zoom ser suele alquilado por noche, en este caso 
-- HorasDisponibles deberia contener en horas el rango completo entre la apertura y el cierre.
Create table Instalaciones(
	ID smallint not null identity(1,1) primary key,
	Nombre varchar(100) not null,
	Apertura time null,
	Cierre time null,
	HorasDisponibles smallint null,
	IDEstado smallint not null foreign key references Estados_instalacion(ID), 
)
go
Create table Reservas(
	ID bigint not null identity(1,1) primary key,
	IDInstalacion smallint not null foreign key references Instalaciones(ID),
	IDUsuario bigint not null foreign key references Usuarios(ID),
	FechaHora datetime not null check(FechaHora>=getdate()),
)
go

-- ACA NOS EMPEZAMOS A HACER LIO
-- Dado que cada Unidad Funcional tiene un tipo (casa,depto,etc.), dependiendo de que tipo sea, esta puede tener instalaciones asociadas o no. Si vivis
-- en un depto, tenes asociado un zoom, sala de juegos, etc. Pero i vivis en una casa, tenes asociada una cancha de tenis, golf, quincho, etc. Hicimos
-- esta tabla intermedia para asentar estas asociaciones, pero no lo tenemos muy en claro aun.
Create table Instalaciones_X_Tipo(
	IDTipo smallint not null foreign key references Tipo_unidad_Funcional(ID),
	IDInstalacion smallint not null foreign key references Instalaciones(ID)
)
go

--Tablas sin relacionar
Create table Telefonos_Utiles(
	ID smallint not null identity(1,1) primary key,
	Nombre varchar(100) not null,
	Telefono varchar(15) not null
)
go
Create table Novedades(
	ID bigint not null identity (1,1) primary key,
	Detalle varchar(MAX) not null,
	FechaHora datetime not null default (getdate())
)
go
Create table Opciones(
	ID smallint not null identity(1,1) Primary key,
	Nombre varchar(50) not null,
	URLImagen varchar(MAX) not null
)
