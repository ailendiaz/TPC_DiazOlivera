use Habitapp_DB
go
Set Dateformat 'DMY'
go
----------------TIPO DE USUARIO-------------------
insert into Tipo_Usuario (Nombre) values ('Administrador')
insert into Tipo_Usuario (Nombre) values ('Inquilino')
insert into Tipo_Usuario (Nombre) values ('Master')
go
---------------USUARIOS-------------------------
insert into Usuarios (Contraseña,IDTipo,Alta) values ('11222333',1,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('22333444',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('33444555',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('44555666',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('55666777',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('66777888',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('77888999',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('12345678',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('87654321',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('22362236',2,1)
insert into Usuarios (Contraseña,IDTipo,Alta) values ('11111111',3,1)
go
 
-------------ESTADO DE RECLAMO-----------------
insert into Estado_Reclamo (Nombre) values('Sin revisar')
insert into Estado_Reclamo (Nombre) values('En proceso')
insert into Estado_Reclamo (Nombre) values('Solucionado')
go
------------ESTADO DE INSTALACION--------------
insert into Estados_Instalacion (Nombre) values ('Disponible')
insert into Estados_Instalacion (Nombre) values ('No disponible')
insert into Estados_Instalacion (Nombre) values ('En reparacion')
go
----------------DATOS PERSONALES---------------
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(1,'Hans','Landa','11222333','3/1/1984','hanslanda@gmail.com','Masculino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(2,'Aldo','Raine','22333444','6/2/1985','aldoraine@hotmail.com','Masculino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(3,'Shosanna','Dreyfus','33444555','9/3/1986','shosannadreyfus@yahoo.com','Femenino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(4,'Bridget','Von Hammersmark','44555666','12/4/1987','bridgetvonhammersmark@gmail.com','Femenino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(5,'Marty','Mcfly','55666777','15/5/1988','backtothefuture@yahoo.com','Masculino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(6,'Emmet','Brown','66777888','18/6/1989','delorean1985@yahoo.com','Masculino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(7,'Ellen','Ripley','77888999','19/7/1990','nostromo1979@yahoo.com','Femenino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(8,'Dutch','Schaefer','12345678','18/8/1991','predator1987@yahoo.com','Masculino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(9,'Amy','Dunne','87654321','21/9/1992','gonegirl@yahoo.com','Femenino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(10,'Martin','Brody','22342234','18/10/1993','jaws1975@yahoo.com','Masculino',1)
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero,Alta) values(11,'Ailen','Diaz','11111111','6/6/1991','diazzailen@gmail.com','Femenino',1)
go

---------------TELEFONOS-----------------------
insert into Telefonos (IDUsuario,Telefono,Alta)values(1,'1544555776',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(2,'1544337896',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(2,'47409976',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(3,'1533459854',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(4,'1578563412',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(4,'47406655',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(5,'1566775454',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(5,'47409753',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(6,'1567458967',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(7,'1544668834',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(8,'1534453434',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(8,'47407575',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(9,'1566772211',1)
insert into Telefonos (IDUsuario,Telefono,Alta)values(10,'1577552244',1)
go
--------------RECLAMOS---------------
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora,Alta) values(3,3,'Sin agua!','Hace 3 dias que no tengo agua en el depto, por favor envien alguien de mantenimiento.','3/3/2020',1)
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora,Alta) values(3,4,'Teclas del ascensor','Buenos, dias vivo en 2do piso y la tecla 2 del ascensor no funciona','13/4/2020',1)
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora,Alta) values(3,5,'No funciona el porton!','Estuve media hora para salir del garage porque el porton no funciona bien, arreglenlo por favor','23/5/2020',1)
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora,Alta) values(2,6,'Mala iluminacion','La entrada al edificio tiene mala iluminacion, ha varios focos quemados en los reflectores, por favor que alguien se ocupe','2/8/2020',1)
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora,Alta) values(2,7,'Baja tension','Tengo baja tension, no se si es del edificio o solo mi depto, por favor envien a alguien a revisar por favor','3/8/2020',1)
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora,Alta) values(1,9,'Seguridad duerme!!','Anoche llegue a las 3 de la mañana al edificio y me encontre al señor de seguridad durmiendo, esto no puede volver a pasar','4/8/2020',1)
go
-------------TIPO_UNIDAD_FUNCIONAL--------
insert into Tipo_Unidad_Funcional (Nombre) values('Departamento')
insert into Tipo_Unidad_Funcional (Nombre) values('Casa')
go
-------------UNIDAD FUNCIONAL------------
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,5,1,9,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,4,1,7,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,3,1,5,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,2,2,8,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,1,2,6,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,5,2,7,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,4,1,8,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,3,1,6,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,2,2,9,1)
insert into Unidad_Funcional(IDTipo,Numero,Torre,Piso,Alta) values(1,1,2,7,1)
go

----------USUARIOS x UNIDAD FUNCIONAL--------
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(1,1)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(2,2)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(3,3)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(4,4)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(5,5)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(6,6)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(7,7)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(8,8)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(9,9)
insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(10,10)

-----------------INSTALACIONES------------
insert into Instalaciones (Nombre,Apertura,Cierre,HorasDisponibles,IDEstado,Alta) values('Zoom','18:00','23:00',5,1,1)
insert into Instalaciones (Nombre,Apertura,Cierre,HorasDisponibles,IDEstado,Alta) values('Cancha de Tenis','8:00','20:00',1,1,1)
insert into Instalaciones (Nombre,Apertura,Cierre,HorasDisponibles,IDEstado,Alta) values('Pileta','10:00','20:00',5,3,1)
go

-----------------RESERVAS------------------
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(1,1,'2/1/2021 18:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(1,2,'5/1/2021 18:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(1,3,'7/1/2021 18:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(1,4,'9/1/2021 18:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(1,5,'11/1/2021 18:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(2,6,'2/1/2021 12:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(2,7,'2/1/2021 13:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(2,8,'2/1/2021 15:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(2,9,'3/1/2021 19:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(2,10,'3/1/2021 18:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(2,1,'3/1/2021 17:00',1)
insert into Reservas (IDInstalacion,IDUsuario,FechaHora,Alta) values(2,2,'3/1/2021 15:00',1)
go

--------------ESTADO EXPENSAS------------
insert into Estado_Expensas (Nombre) values ('Impaga')
insert into Estado_Expensas (Nombre) values ('Informada')
insert into Estado_Expensas (Nombre) values ('Paga')

--------------EXPENSAS-------------------
insert into Expensas (Fecha,Importe,Alta)values('5-8-2020',55000,1)
insert into Expensas (Fecha,Importe,Alta)values('5-9-2020',51000,1)
insert into Expensas (Fecha,Importe,Alta)values('5-10-2020',65000,1)
go
-------------EXPENSAS INDIVIDUALES----------
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,1,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,2,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,3,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,4,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,5,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,6,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,7,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,8,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,9,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(1,3,10,'5/8/2020',5500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,1,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,2,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,3,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,4,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,5,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,6,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,7,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,8,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,9,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(2,3,10,'5/9/2020',5100,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,1,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,2,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,3,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,4,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,5,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,6,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,7,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta)values(3,3,8,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,9,'5/10/2020',6500,1)
insert into Expensas_individuales(IDExpensa, IDEstadoExpensa,IDUnidadFuncional, Fecha,Importe,Alta )values(3,3,10,'5/10/2020',6500,1)
go
-------------- PAGOS ---------------------
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(1,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(2,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(3,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(4,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(5,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(6,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(7,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(8,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(9,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(10,5500,'5/8/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(11,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(12,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(13,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(14,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(15,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(16,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(17,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(18,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(19,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(20,5100,'5/9/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(21,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(22,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(23,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(24,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(25,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(26,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(27,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(28,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(29,6500,'5/10/2020',1)
insert into Pagos(IDExpensaIndividual,Importe,Fecha,Alta)values(30,6500,'5/10/2020',1)
go

--------------TIPO DE GASTO-------------------
insert into Tipo_Gasto (Nombre) values('Luz')
insert into Tipo_Gasto (Nombre) values('Gas')
insert into Tipo_Gasto (Nombre) values('Agua')
insert into Tipo_Gasto (Nombre) values('Mantenimiento del Asensor')
insert into Tipo_Gasto (Nombre) values('Arreglo de Porton')
go

---------------GASTOS-----------------
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(20000,'3-08-2020',1,1,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(18000,'1-08-2020',1,2,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(12000,'2-08-2020',1,3,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(5000,'4-08-2020',1,4,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(22000,'1-09-2020',2,1,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(15000,'2-09-2020',2,2,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(14000,'3-09-2020',2,3,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(24000,'1-10-2020',3,1,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(19000,'3-10-2020',3,2,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(14000,'4-10-2020',3,3,1)
insert into Gastos (Importe,Fecha,IDExpensa,IDTipo,Alta) values(8000,'2-10-2020',3,5,1)
go
-------------TELEFONOS_UTILES--------
insert into Telefonos_Utiles(Nombre,Telefono,Alta) values('Comisaria','4512-9763',1)
insert into Telefonos_Utiles(Nombre,Telefono,Alta) values('Bomberos','4749-2222',1)
insert into Telefonos_Utiles(Nombre,Telefono,Alta) values('Comisaria de la mujer','4740-1934',1)
insert into Telefonos_Utiles(Nombre,Telefono,Alta) values('SET Ambulacia','4512-9999',1)
go

---------------NOVEDADES-------------
insert into Novedades(Detalle,FechaHora,Alta) values('El proximo lunes 9/11/20, El ascensor no estara disponible durante la mañana para realizar el mantenimiento mensual. Disculpe las molestias ocacionadas',Getdate(),1)
insert into Novedades(Detalle,FechaHora,Alta) values('El zoom abrira sus puertas el proximo viernes 13 a las 18hs para celebrar el aniversario de apertura del complejo. Queda usted cordialmente invitado a la celebracion.',Getdate(),1)
insert into Novedades(Detalle,FechaHora,Alta) values('Las canchas de tenis permanceran cerradas durante el proximo fin de semana para realizar mantenimiento. Disculpe las molestias',Getdate(),1)
insert into Novedades(Detalle,FechaHora,Alta) values('El proximo jueves 12, se cambiara la cerradura de la puerta principal, pida su llave en el puesto de vigilancia presentando su documento. Muchas gracias',Getdate(),1)
insert into Novedades(Detalle,FechaHora,Alta) values('Se habilitaran 10 nuevos espacios para estacionar en el garage, en caso de requerirlos comuniquese con administracion. Muchas gracias!',Getdate(),1)
insert into Novedades(Detalle,FechaHora,Alta) values('El sabado 14 y domingo 15, se realizara el torneo de tenis de fin de año. Las inscripciones se realizaran hasta el viernes 14 inclusive en las oficinas de administracion.',Getdate(),1)
go
---INSERT PARA OPCIONES

insert into Opciones(Nombre, IDTipoUsuario) values ('Novedades', 2 )
insert into Opciones(Nombre, IDTipoUsuario) values ('Estado de Cuenta', 2)
insert into Opciones(Nombre, IDTipoUsuario) values ('Reclamos', 2)
insert into Opciones(Nombre, IDTipoUsuario) values ('Datos Utiles', 2)
insert into Opciones(Nombre, IDTipoUsuario) values ('Invitados', 2)
insert into Opciones(Nombre, IDTipoUsuario) values ('Reservas', 2)
insert into Opciones(Nombre, IDTipoUsuario) values ('Clasificados', 2)
insert into Opciones(Nombre, IDTipoUsuario) values ('Carpooling', 2)
insert into Opciones(Nombre, IDTipoUsuario) values ('Novedades', 1)
insert into Opciones(Nombre, IDTipoUsuario) values ('Gastion de Cuentas', 1)
insert into Opciones(Nombre, IDTipoUsuario) values ('ABM Usuarios', 1)
insert into Opciones(Nombre, IDTipoUsuario) values ('Reclamos', 1)
insert into Opciones(Nombre, IDTipoUsuario) values ('AMB Datos Utiles', 1)
insert into Opciones(Nombre, IDTipoUsuario) values ('Reservas', 1)

---- INSERT TIPO OPERACION
insert into Tipo_Operacion (Nombre) values('Alta')
insert into Tipo_Operacion (Nombre) values('Baja')
insert into Tipo_Operacion (Nombre) values('Modificacion')
go