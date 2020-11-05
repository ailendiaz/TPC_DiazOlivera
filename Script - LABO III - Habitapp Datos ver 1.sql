use Habitapp_DB
go
Set Dateformat 'DMY'
go
----------------TIPO DE USUARIO-------------------
insert into Tipo_Usuario (Nombre) values ('Master')
insert into Tipo_Usuario (Nombre) values ('Administrador')
insert into Tipo_Usuario (Nombre) values ('Inquilino')
go
---------------USUARIOS-------------------------
insert into Usuarios (Contraseña,IDTipo) values ('11222333',1)
insert into Usuarios (Contraseña,IDTipo) values ('22333444',1)
insert into Usuarios (Contraseña,IDTipo) values ('33444555',2)
insert into Usuarios (Contraseña,IDTipo) values ('44555666',2)
insert into Usuarios (Contraseña,IDTipo) values ('55666777',2)
insert into Usuarios (Contraseña,IDTipo) values ('66777888',2)
insert into Usuarios (Contraseña,IDTipo) values ('77888999',2)
insert into Usuarios (Contraseña,IDTipo) values ('12345678',2)
insert into Usuarios (Contraseña,IDTipo) values ('87654321',2)
insert into Usuarios (Contraseña,IDTipo) values ('22362236',2)
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
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(1,'Hans','Landa','11222333','3/1/1984','hanslanda@gmail.com','M')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(2,'Aldo','Raine','22333444','6/2/1985','aldoraine@hotmail.com','M')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(3,'Shosanna','Dreyfus','33444555','9/3/1986','shosannadreyfus@yahoo.com','F')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(4,'Bridget','Von Hammersmark','44555666','12/4/1987','bridgetvonhammersmark@gmail.com','F')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(5,'Marty','Mcfly','55666777','15/5/1988','backtothefuture@yahoo.com','M')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(6,'Emmet','Brown','66777888','18/6/1989','delorean1985@yahoo.com','M')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(7,'Ellen','Ripley','77888999','19/7/1990','nostromo1979@yahoo.com','F')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(8,'Dutch','Schaefer','12345678','18/8/1991','predator1987@yahoo.com','M')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(9,'Amy','Dunne','87654321','21/9/1992','gonegirl@yahoo.com','F')
insert into Datos_Personales(IDUsuario,Nombres,Apellidos,DNI,Nacimiento,Mail,Genero) values(10,'Martin','Brody','22342234','18/10/1993','jaws1975@yahoo.com','M')
go
---------------TELEFONOS-----------------------
insert into Telefonos (IDUsuario,Telefono)values(1,'1544555776')
insert into Telefonos (IDUsuario,Telefono)values(2,'1544337896')
insert into Telefonos (IDUsuario,Telefono)values(2,'47409976')
insert into Telefonos (IDUsuario,Telefono)values(3,'1533459854')
insert into Telefonos (IDUsuario,Telefono)values(4,'1578563412')
insert into Telefonos (IDUsuario,Telefono)values(4,'47406655')
insert into Telefonos (IDUsuario,Telefono)values(5,'1566775454')
insert into Telefonos (IDUsuario,Telefono)values(5,'47409753')
insert into Telefonos (IDUsuario,Telefono)values(6,'1567458967')
insert into Telefonos (IDUsuario,Telefono)values(7,'1544668834')
insert into Telefonos (IDUsuario,Telefono)values(8,'1534453434')
insert into Telefonos (IDUsuario,Telefono)values(8,'47407575')
insert into Telefonos (IDUsuario,Telefono)values(9,'1566772211')
insert into Telefonos (IDUsuario,Telefono)values(10,'1577552244')
go
--------------RECLAMOS---------------
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora) values(3,3,'Sin agua!','Hace 3 dias que no tengo agua en el depto, por favor envien alguien de mantenimiento.','3/3/2020')
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora) values(3,4,'Teclas del ascensor','Buenos, dias vivo en 2do piso y la tecla 2 del ascensor no funciona','13/4/2020')
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora) values(3,5,'No funciona el porton!','Estuve media hora para salir del garage porque el porton no funciona bien, arreglenlo por favor','23/5/2020')
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora) values(2,6,'Mala iluminacion','La entrada al edificio tiene mala iluminacion, ha varios focos quemados en los reflectores, por favor que alguien se ocupe','2/8/2020')
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora) values(2,7,'Baja tension','Tengo baja tension, no se si es del edificio o solo mi depto, por favor envien a alguien a revisar por favor','3/8/2020')
insert into Reclamos (IDEstado,IDUsuario,Asunto,Detalle,FechaHora) values(1,9,'Seguridad duerme!!','Anoche llegue a las 3 de la mañana al edificio y me encontre al señor de seguridad durmiendo, esto no puede volver a pasar','4/8/2020')
go
