use Habitapp_DB
go
set dateformat 'DMY'
go
---------VISTAS
---GeneralUF
create VIEW vw_GeneralUF as
select distinct uf.ID, tp.id as ID_Tipo, tp.nombre, uf.numero,uf.piso,Torre,
	(
		select count(*) from Expensas_individuales as ei
		where uf.ID=ei.IDUnidadFuncional and ei.IDEstadoExpensa!=3	
	 ) as Impagas,
	 isnull((
		select sum(ei.Importe) from Expensas_individuales as ei
		where uf.id=ei.IDUnidadFuncional and ei.IDEstadoExpensa!=3 
	 ),0) as Saldo from Unidad_Funcional as uf
left join Expensas_individuales as ei on ei.IDUnidadFuncional=uf.ID
inner join Tipo_Unidad_Funcional as tp on tp.ID=uf.IDTipo
go

---GENERAL USUARIOS
Create view vw_Usuarios as
select distinct u.ID,dp.DNI,dp.Nombres,dp.Apellidos,uf.ID as ID_UF,uf.Torre,uf.Piso,uf.Numero,tu.Nombre as Tipo_Usuario,
	isnull((
	select count(ei.IDUnidadFuncional) from Expensas_individuales as ei
	where uf.id=ei.IDUnidadFuncional and ei.IDEstadoExpensa in (1,2)
	group by ei.IDUnidadFuncional) , 0
	) as Cant_Exp_Impagas,
	isnull((
	select sum(ei.importe) from Expensas_individuales as ei
	where uf.id=ei.IDUnidadFuncional and ei.IDEstadoExpensa in (1,2)
	group by ei.IDUnidadFuncional), 0
	) as Total_Adeudado, dp.Mail 
from usuarios as u
inner join datos_personales as dp on dp.IDUsuario=u.ID
Inner join usuarios_x_unidadFuncional as uxu on uxu.IDUsuario=u.ID
Inner join unidad_funcional as uf on uf.ID=uxu.IDUF
inner join tipo_Usuario as tu on tu.Id=u.IDtipo
inner join Expensas_Individuales as ei on ei.IDUnidadFuncional=uf.ID
where u.Alta=1
go

------------- General Pagos
Create view vw_GeneralPagos as
select p.ID as ID_Pago,p.Fecha as Fecha_Pago,ei.ID as ID_Exp_Indiv,ei.IDExpensa as ID_Exp_gral,ei.Fecha as Fecha_Exp,uf.Torre,uf.Piso,uf.Numero,ei.Importe from Pagos as p
inner join Expensas_individuales as ei on ei.id=p.IDExpensaIndividual
inner join Unidad_Funcional as uf on uf.id=ei.IDUnidadFuncional
go


-------------Expensas
Create view vw_GeneralExpensas as
select e.id as ID_Exp,e.Fecha as Fecha_Exp,g.Fecha as Fecha_Gasto ,tg.Nombre as Tipo_gasto,g.Importe as Importe,e.Importe as Total_Exp from Expensas as e
inner join gastos as g on g.IDExpensa=e.ID
inner join Tipo_Gasto as tg on tg.ID= g.IDTipo
go
----Reclamos
Create view vw_Reclamos as
select r.ID as ID_Reclamo,r.FechaHora,r.IDUsuario,dp.Nombres+' '+dp.Apellidos as 'Nombre y Apellido', r.Asunto,r.Detalle, er.Nombre from Datos_Personales as dp
inner join Reclamos as r on r.IDUsuario=dp.IDUsuario
inner join Estado_Reclamo as er on er.ID=r.IDEstado
go

----------- STORED PROCEDURES
Use habitapp_DB
go
------RECLAMOS
----- Insert Reclamos
create procedure sp_GuardarReclamo(
	@IDEstado int, 
	@IDUsuario bigint, 
	@Asunto varchar(200), 
	@Detalle varchar(MAX)
)
as
begin

begin try
	Insert into RECLAMOS(IDEstado, IDUsuario,Asunto, Detalle)values (@IDEstado, @IDUsuario, @Asunto, @Detalle)
end try
begin catch 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)end catch

end

go
--------------Eliminar Reclamo
create procedure sp_EliminarReclamo(
	@ID bigint
)
as
begin

begin try
	delete from RECLAMOS  where ID=@ID
end try
begin catch 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()	
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
end catch

end

go
---------- Modificar Reclamo
CREATE PROCEDURE sp_ModificarReclamo(
	@ID bigint,
	@IDEstado smallint
)
AS
BEGIN
BEGIN TRY
	Update Reclamos set IDEstado=@IDEstado where ID=@ID
	IF @@ROWCOUNT=0
	raiserror('No se pudo modificar ese registro',16,4)
END TRY
BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()	
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH
END
go
---------- NOVEDADES
create procedure sp_GuardarNovedades(
	@Detalle varchar(MAX),
	@FechaHora datetime
	)
as
begin

begin try
	Insert into Novedades(Detalle, FechaHora)values (@Detalle, @FechaHora)
end try
begin catch 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)end catch

end
go
----------Eliminar Novedades
CREATE PROCEDURE sp_EliminarNovedades(
	@ID bigint
	)
AS BEGIN

BEGIN TRY
	Update Novedades set Alta=1 where id=@ID
END TRY
BEGIN CATCH 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH

end
go
--------- GASTOS
----------Inserta Tipo de Gastos
create procedure sp_GuardarTipoGasto(
	@Nombre varchar(100)
)
AS
BEGIN
BEGIN TRY
	declare @contador tinyint
	
	select @Contador= count(*) from Tipo_gasto where Nombre Like @Nombre 
	IF @Contador= 0
	BEGIN
		Insert into Tipo_Gasto(Nombre)values (@Nombre)
	END
	ELSE
	BEGIN
		raiserror('Ese Tipo de gasto ya existe',16,3)
	END
END TRY
BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH

END

go
-----------Guardar Gasto
create procedure sp_GuardarGastos(
	@IDExpensa bigint,
	@Importe money,
	@Fecha date,
	@IDTipo smallint
	)
as
BEGIN
BEGIN TRY
	declare @CONTADOR tinyint
	IF (select count(*) from expensas where ID=@IDExpensa)=1
	BEGIN
		Insert into Gastos(IDExpensa,Importe, Fecha, IDTipo)values (@IDExpensa,@Importe, @Fecha,@IDTipo)
	END
	ELSE
	BEGIN
		raiserror('ID expensa Inexistente',16,3)
	END
END TRY
BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH

END
go

-----------Modificar Estado Expensa
CREATE PROCEDURE sp_ModificarEstadoExpensaIndividual(
	@ID int,
	@ESTADO varchar(100)
)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
		declare @CONTADOR int
		set @CONTADOR=0
		IF @ESTADO='informado'
		BEGIN
			set @CONTADOR=1
			update Expensas_individuales set IDEstadoExpensa=2 where id=@ID
			IF @@ROWCOUNT=0
			BEGIN
				raiserror('No se pudo cambiar el estado',16,3)
			END
		END
		IF @ESTADO='paga'
		BEGIN
			set @CONTADOR=1
			update Expensas_individuales set IDEstadoExpensa=3 where id=@ID
			IF @@ROWCOUNT=0
			BEGIN
				raiserror('No se pudo cambiar el estado',16,3)
			END
			declare @IMPORTE money
			select @IMPORTE= Importe from Expensas_individuales where ID=@ID
			insert into pagos (IDExpensaIndividual,Importe,Fecha) values(@ID,@IMPORTE,GETDATE())
		END
		IF @ESTADO='impaga'
		BEGIN
			set @CONTADOR=1
			update Expensas_individuales set IDEstadoExpensa=1, transaccion=null where id=@ID
			IF @@ROWCOUNT=0
			BEGIN
				raiserror('No se pudo cambiar el estado',16,3)
			END
			update Pagos set Alta=0 where IDExpensaIndividual=@ID -- BAJA UN PAGO EN CASO DE PASAR DE PAGADO A IMPAGO POR ERROR ADMINISTRATIVO, NO NECESITA ROWCOUNT POR SI PASA DE INFORMADO A IMPAGA
		END
		IF @CONTADOR=0
		BEGIN
			raiserror('Estado no valido',16,3)
		END
	COMMIT TRANSACTION
END TRY
		
BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH
END
go

-----------Eliminar Gasto
create procedure sp_EliminarGasto(
	@ID bigint
)
as
begin
begin try
	delete from Gastos where IDexpensa=@ID
end try
begin catch
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)end catch
end
go

------------ EXPENSAS GENERALES E INDIVIDUALES
----------------Guardar expensa individual
Create procedure sp_GuardarExpensaIndividual(
	@IDEXPENSA bigint, 
	@FECHA date, 
	@IDUF bigint, 
	@TOTALEXPENSA money
)
as
begin
begin try
	declare @CANTUF int
	declare @TOTAL money
	IF (select count(*) from expensas where ID=@IDExpensa)=1
	BEGIN
		select @CANTUF = count(ID) from Unidad_Funcional
		set @TOTAL=(@TOTALEXPENSA/@CANTUF)
		Insert into Expensas_Individuales (IDExpensa, Fecha,IDUnidadFuncional,IDEstadoExpensa,importe) values (@IDEXPENSA,@FECHA,@IDUF,1,@TOTAL)
	END
	ELSE
	BEGIN
		raiserror('ID expensa Inexistente',16,3)
	END
end try
begin catch
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
end catch
end
go

----------Eliminar Expensa individual
create procedure sp_EliminarExpensaIndividual(
	@IDExpensa bigint
)
as
begin
begin try
	delete from expensas_individuales where IDexpensa=@IDExpensa
end try
begin catch
	raiserror('No se pudo eliminar la expensa',16,1)
end catch
end
go

-----------Guardar Expensa
CREATE PROCEDURE sp_GuardarExpensa(
	@FECHA date,
	@TOTAL money
)
AS
BEGIN
BEGIN TRY
	insert into Expensas (Fecha,Importe)values(@FECHA,@TOTAL)
END TRY
BEGIN CATCH
	raiserror('No se pudo guardar la expensa',16,1)
END CATCH
END
go

------------Eliminar Expensa
CREATE PROCEDURE sp_EliminarExpensa(
	@ID bigint
)
AS
BEGIN

BEGIN TRY
BEGIN TRANSACTION
	Exec sp_EliminarGasto @ID
	Exec sp_EliminarExpensaIndividual @ID
	delete from Expensas where ID=@ID
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH

END
go
---------------- Cargar Transaccion
create procedure sp_CargarTransaccion(
	@Numero varchar (50),
	@ID bigint
)
as
begin

begin try
	UPDATE  Expensas_individuales SET Transaccion = @Numero  WHERE ID =@ID
	IF @@rowcount =0
	BEGIN
		raiserror('No se pudo realizar la transaccion',16,3)
	END
end try
begin catch 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)end catch

end

go

--------------- alta usuario
CREATE PROCEDURE sp_AltaUsuario(
	@IDTipo smallint,
	@Mail varchar(100),
	@Nombre varchar(100),
	@Apellido varchar(100),
	@DNI varchar(8),
	@Genero varchar(100),
	@Nacimiento date,
	@Telefono varchar(15)
)
AS
BEGIN
	declare @IDAux bigint
	declare @Contador tinyInt

BEGIN TRY
BEGIN TRANSACTION
	select @Contador = count(*) from datos_personales where DNI=@DNI
	IF @Contador=1
	BEGIN
		Raiserror('Ya existe ese DNI en la DB',16,1)
	END
	ELSE
	BEGIN
		IF @Contador=0
		BEGIN
			insert into Usuarios (IDtipo,Contraseña,Alta) values(@IDTipo,@DNI,1)
			set @IDaux= @@IDENTITY
			insert into datos_personales (IDUsuario,Nombres,Apellidos,Genero,DNI,Mail,Nacimiento) values (@IDAux, @Nombre,@Apellido,@Genero,@DNI,@Mail,@Nacimiento)
			insert into Telefonos (IDUsuario,Telefono)values(@IDaux,@Telefono)
		END
	END
COMMIT TRANSACTION
END TRY

BEGIN CATCH
	Rollback Transaction 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)	
END CATCH
END
go
-------------------- Modificar Usuario
Create Procedure sp_ModificarUsuario(
	@Mail varchar(100),
	@Nombre varchar(100),
	@Apellido varchar(100),
	@DNI varchar(8),
	@Genero varchar(100),
	@Nacimiento date
)
AS
BEGIN
BEGIN TRY
	update datos_personales set Mail=@Mail,Nombres=@Nombre,Apellidos=@Apellido,Genero=@Genero,Nacimiento=@Nacimiento where DNI=@DNI
	IF @@rowcount = 0
	BEGIN
		Raiserror ('No se pudo modificar el usuario en Datos Personales',16,1)
	END
END TRY

BEGIN CATCH 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH
END
go

-------------------- Modificar Contraseña
Create Procedure sp_ModificarContraseña(
	@DNI varchar(8),
	@CONTRASEÑA varchar(100)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @ID bigint
		select @ID= IDUsuario from Datos_Personales where DNI=@DNI
		Update Usuarios set Contraseña=@CONTRASEÑA where ID=@ID
		IF @@Rowcount=0
		BEGIN
			raiserror('No se pudo modificar la contraseña',16,1)
		END
	END TRY
	BEGIN CATCH
		declare @ERRORMESS varchar(max)
		declare @ERRORSEV int
		declare @ERROREST int

		set @ERRORMESS= ERROR_MESSAGE()
		set @ERRORSEV=ERROR_SEVERITY()
		set @ERROREST= ERROR_STATE()
		raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)

	END CATCH
END
-------------------- Asignar Unidad Funcional

CREATE PROCEDURE sp_AsignarDepto(
	@DNI varchar(8),
	@TORRE smallint,
	@PISO smallint,
	@NUMERO int
)
AS
BEGIN
	BEGIN TRY
		declare @IDUSUARIO bigint
		declare @IDUF bigint
		select @IDUSUARIO= IDUsuario from Datos_Personales where DNI= @DNI
		select @IDUF= ID from Unidad_Funcional where Torre=@TORRE and Piso=@Piso and Numero=@NUMERO
		
		IF(select IDTipo from Usuarios where ID=@IDUSUARIO)=1
		BEGIN
			Raiserror('No se puso Asignar esa UF a ese Usuario',16,1)
		END
		insert into Usuarios_x_UnidadFuncional (IDUsuario,IDUF)values(@IDUSUARIO,@IDUF)
	END TRY
	BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
	END CATCH
END
go
-------------------- Desasignar Unidad Funcional
CREATE PROCEDURE sp_DesasignarDepto(
	@DNI varchar(8),
	@TORRE smallint,
	@PISO smallint,
	@NUMERO int
)
AS
BEGIN
BEGIN TRY
	declare @IDUSUARIO bigint
	declare @IDUF bigint

	select @IDUSUARIO= IDUsuario from Datos_Personales where DNI= @DNI
	select @IDUF= ID from Unidad_Funcional where Torre=@TORRE and piso=@PISO and @NUMERO=Numero
	delete from Usuarios_x_UnidadFuncional where IDUsuario=@IDUSUARIO and IDUF= @IDUF

END TRY
BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)	END CATCH
END
go


------------------ baja usuario

CREATE PROCEDURE sp_BajaUsuario(
	@DNI varchar(8)
)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
	declare @IDAux bigint
	select @IDaux = IDUsuario from Datos_Personales where DNI=@DNI
	update datos_personales set Alta=0 where DNI=@DNI
	IF @@rowcount = 0
	BEGIN
		Raiserror ('No se pudo modificar el usuario en Datos Personales',16,1)
	END
	update Usuarios set Alta=0 where ID=@IDAux
	IF @@rowcount = 0
	BEGIN
		Raiserror ('No se pudo modificar el usuario en Usuario',16,1)
	END
COMMIT TRANSACTION
END TRY

BEGIN CATCH
	Rollback Transaction 
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)	
END CATCH
END
go


------------------- Restaurar contraseña
CREATE PROCEDURE sp_RestaurarContraseña(
	@DNI varchar (8)
)
AS
BEGIN
BEGIN TRY
		Declare @ID bigint
		select @ID = IDUsuario from datos_personales where DNI=@DNI
		update Usuarios set Contraseña = @DNI where ID=@ID
		IF @@Rowcount =0
		BEGIN
			Raiserror ('No se pudo restaurar la contraseña',16,1)
		END
END TRY
BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH
END
go
---------------Alta UnidadFuncional
alter PROCEDURE sp_AltaDepto(
	@TORRE smallint,
	@PISO smallint,
	@NUMERO int
)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
	IF(select count(*) from Unidad_Funcional where Torre=@TORRE and piso=@PISO and numero=@NUMERO)=1
	BEGIN
		raiserror('Ya existe esa Unidad Funcional',16,2) 
	END
	ELSE
	BEGIN
		insert into Unidad_Funcional(torre,piso,numero,IDTipo)values(@TORRE,@PISO,@NUMERO,1)
	END
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
END CATCH
END
GO
--CREATE PROCEDURE sp_AltaDepto(
--	@TORRE smallint,
--	@PISO smallint,
--	@NUMERO int,
--	@DNI varchar(8)
--)
--AS
--BEGIN
--BEGIN TRY
--BEGIN TRANSACTION
--	IF(select count(*) from Unidad_Funcional where Torre=@TORRE and piso=@PISO and numero=@NUMERO)=1
--	BEGIN
--		raiserror('Ya existe esa Unidad Funcional',16,2) 
--	END
--	ELSE
--	BEGIN
--		insert into Unidad_Funcional(torre,piso,numero,IDTipo)values(@TORRE,@PISO,@NUMERO,1)
--		exec sp_AsignarDepto @DNI,@TORRE,@PISO,@NUMERO
--	END
--COMMIT TRANSACTION
--END TRY
--BEGIN CATCH
--	declare @ERRORMESS varchar(MAX)
--	declare @ERRORSEV int
--	declare @ERROREST int

--	set @ERRORMESS=ERROR_MESSAGE()
--	set @ERRORSEV=ERROR_SEVERITY()
--	set @ERROREST=ERROR_STATE()

--	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)
--END CATCH
--END
--GO
---------------Baja Unidad Funcional


CREATE PROCEDURE sp_BajaDepto(
	@TORRE smallint,
	@PISO smallint,
	@NUMERO int
)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
	declare @IDUF bigint
	select @IDUF = ID from Unidad_Funcional where Torre=@TORRE and piso=@PISO and numero=@NUMERO
	delete from Usuarios_x_UnidadFuncional where IDUF=@IDUF
	Update Unidad_Funcional set Alta=0 where Torre=@TORRE and piso=@PISO and numero=@NUMERO
	IF @@Rowcount=0
	BEGIN
		raiserror ('No se encontro esa unidad funcional',16,2)
	END
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	rollback transaction
	declare @ERRORMESS varchar(MAX)
	declare @ERRORSEV int
	declare @ERROREST int

	set @ERRORMESS=ERROR_MESSAGE()
	set @ERRORSEV=ERROR_SEVERITY()
	set @ERROREST=ERROR_STATE()

	raiserror(@ERRORMESS,@ERRORSEV,@ERROREST)END CATCH
END
GO
-------------Mensajeria
-----------Guardar Mensaje
create PROCEDURE sp_GuardarMensaje(
	@ASUNTO varchar(200),
	@DETALLE varchar(max),
	@IDEMISOR bigint,
	@IDRECEPTOR bigint,
	@IDRECLAMO bigint,
	@FECHAHORA datetime
)
AS
BEGIN
BEGIN TRY
	insert into Mensajes (Asunto,Detalle,IDEmisor,IDReceptor,IDReclamo,FechaHora) values(@ASUNTO,@DETALLE,@IDEMISOR,@IDRECEPTOR,@IDRECLAMO,@FECHAHORA)
END TRY
BEGIN CATCH
	raiserror('No se pudo guardar el mensaje',16,1)
END CATCH
END
go
------------Triggers

