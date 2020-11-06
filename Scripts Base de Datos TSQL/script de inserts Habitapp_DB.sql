use Habitapp_DB
go
set dateformat 'DMY'
-----------------TIPO_USUARIO---------------
insert into Tipo_Usuario (Nombre) values('Master')
insert into Tipo_Usuario (Nombre) values('Administrator')
insert into Tipo_Usuario (Nombre) values('Inquilino')
go

-----------------USUARIOS------------------
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')
insert into Usuarios (Nombre,Contraseña) values('','')

---------------DATOS_PERSONALES-----------
insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')

insert into Datos_Personales
(IDUsuario,Nombres,Apellidos,DNI,Mail,Nacimiento,IDInvitado) 
values('','','','DNI','','','Nacimiento','IDInvitado')
go
-----------------TELEFONOS----------------
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)
insert into Telefonos (IDUsuario,Telefono) values(,)

-------------TIPO_UNIDAD_FUNCIONAL--------
insert into Tipo_Unidad_Funcional (Nombre) values('Departamento')
insert into Tipo_Unidad_Funcional (Nombre) values('Casa')


--------------UNIDAD FUNCIONAL------------
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
insert into Unidad_Funcional(IDTipo, IDUsuario,Numero,Torre,Piso) values(,,,,)
go

--------------ESTADOS INSTALACION--------
insert into Estados_Instalacion (Nombre) values('Disponible')
insert into Estados_Instalacion (Nombre) values('No Disponible')
insert into Estados_Instalacion (Nombre) values('En refaccion')


-----------------INSTALACIONES------------
insert into Instalaciones (Nombre,Apertura,Cierre,HorasDisponibles,IDEstado) values('Zoom','18:00','23:00',5,1)
insert into Instalaciones (Nombre,Apertura,Cierre,HorasDisponibles,IDEstado) values('Cancha de Tenis','8:00','20:00',1,1)
insert into Instalaciones (Nombre,Apertura,Cierre,HorasDisponibles,IDEstado) values('Pileta','10:00','20:00',5,3)


----------------RESERVAS------------------
insert into Reservas (IDInstalacion,FechaHora) values(1,'')
insert into Reservas (IDInstalacion,FechaHora) values(1,'')
insert into Reservas (IDInstalacion,FechaHora) values(1,'')
insert into Reservas (IDInstalacion,FechaHora) values(1,'')
insert into Reservas (IDInstalacion,FechaHora) values(1,'')
insert into Reservas (IDInstalacion,FechaHora) values(2,'')
insert into Reservas (IDInstalacion,FechaHora) values(2,'')
insert into Reservas (IDInstalacion,FechaHora) values(2,'')
insert into Reservas (IDInstalacion,FechaHora) values(2,'')
insert into Reservas (IDInstalacion,FechaHora) values(2,'')
insert into Reservas (IDInstalacion,FechaHora) values(2,'')
insert into Reservas (IDInstalacion,FechaHora) values(2,'')
go
-----------------TIPO_GASTO---------------
insert into Tipo_Gasto (Nombre) values('Luz')
insert into Tipo_Gasto (Nombre) values('Gas')
insert into Tipo_Gasto (Nombre) values('Agua')
insert into Tipo_Gasto (Nombre) values('Mantenimiento del Asensor')
insert into Tipo_Gasto (Nombre) values('Arreglo de Porton')
go

---------------GASTOS-----------------
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(20000,'3-08-2020',1,1)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(18000,'1-08-2020',1,2)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(12000,'2-08-2020',1,3)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(5000,'4-08-2020',1,4)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(22000,'1-09-2020',2,1)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(15000,'2-09-2020',2,2)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(14000,'3-09-2020',2,3)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(24000,'1-10-2020',3,1)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(19000,'3-10-2020',3,2)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(14000,'4-10-2020',3,3)
insert into Gastos (Importe,FechaHora,IDExpensa,IDTipo) values(8000,'2-10-2020',3,5)
go
---------------PAGOS-------------------
--insert into pagos (IDExpensas,Importe,Fecha) values (,,'')
--go
---------------EXPENSAS------------------------- 
--insert into Expensas (IDUnidadFuncional,Fecha,Importe) values(,'',)
--go

-------------ESTADO RECLAMO---------------
insert into Estado_Reclamo (Nombre) values ('Sin revisar')
insert into Estado_Reclamo (Nombre) values ('En proceso')
insert into Estado_Reclamo (Nombre) values ('Solucionado')
go

----------------- RECLAMOS---------------
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
insert into Reclamos (IDEstado,Asunto,Detalle,Fecha) values (,'','','')
go

-------------TELEFONOS_UTILES--------
insert into Telefonos_Utiles(Nombre,Telefono) values('Comisaria','4512-9763')
insert into Telefonos_Utiles(Nombre,Telefono) values('Bomberos','4749-2222')
insert into Telefonos_Utiles(Nombre,Telefono) values('Comisaria de la mujer','4740-1934')
insert into Telefonos_Utiles(Nombre,Telefono) values('SET Ambulacia','4512-9999')

---------------NOVEDADES-------------
insert into Novedades(Detalle,FechaHora) values('',Getdate())
insert into Novedades(Detalle,FechaHora) values('',Getdate())
insert into Novedades(Detalle,FechaHora) values('',Getdate())
insert into Novedades(Detalle,FechaHora) values('',Getdate())
insert into Novedades(Detalle,FechaHora) values('',Getdate())
insert into Novedades(Detalle,FechaHora) values('',Getdate())

