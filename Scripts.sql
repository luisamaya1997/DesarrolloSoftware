CREATE procedure [dbo].[VerificarAcceso]
(
@Usuario nvarchar(80),
@Pass nvarchar(300),
@Rol varchar(80)
)
as
begin
select us.Usuario , us.Contraseña from Usuarios us
inner join Roles r on r.[Codigo Rol] = us.[Codigo Rol]
where us.Usuario=@Usuario and  DECRYPTBYPASSPHRASE('54321',us.Contraseña) = @Pass and r.Descripcion=@Rol
end
GO

CREATE procedure [dbo].[InsertarUsuario]
(
@Usuario nvarchar(80),
@Contra nvarchar(300),
@Estado varchar(8),
@CodigoEmp int,
@CodigoRol int
)
as
begin
--declare @auto int
--if not exists(select [Codigo Usuario] from Usuarios where [Codigo Usuario] = @auto)
insert into Usuarios values(@Usuario,  ENCRYPTBYPASSPHRASE('54321',@Contra),@Estado,@CodigoEmp,@CodigoRol)
--else
--print 'ya existe ese usuario'
end
GO

CREATE procedure [dbo].[InsertarSubcategoria]
(
@SubCategoria nvarchar(50) ,
@CodCategoria int
)
as
begin
--declare @cod int
--if not exists(select [Codigo SubCategoria] from  Subcategoria where [Codigo SubCategoria]=@cod)
insert into Subcategoria values(@SubCategoria,@CodCategoria)
--else
--print 'ya existe esa marca'
end
GO

CREATE procedure [dbo].[InsertarProveedor]
(
@Proveedor nvarchar(80),
@Telefono char(12),
@Direccion varchar(150),
@Correo varchar(80)
)
as
begin
--declare @var int
--if not exists(select [Codigo Proveedor] from Proveedores where [Codigo Proveedor] = @var)
insert into Proveedores values(@Proveedor,@Telefono,@Direccion,@Correo)
--else
--print 'error ya existe ese proveedor'
end
GO

CREATE procedure [dbo].[InsertarOrden]
(
@Descripcion nvarchar(80),
@Fecha datetime,
@Cantidad int,
@Estado varchar(20),
@CodProv int
)
as
begin
--declare @auto int
--if not exists(select [Codigo Orden] from Ordenes where [Codigo Orden]=@auto)
insert into Ordenes values(@Descripcion,@Fecha,@Cantidad,@Estado,@CodProv)
--else
--print 'ya existe esa orden'
end
GO

CREATE procedure [dbo].[InsertarMarca]
(
@Marca nvarchar(50) 
)
as
begin
--declare @cod int
--if not exists(select [Codigo Marca] from Marca where [Codigo Marca]=@cod)
insert into Marca values(@Marca)
--else
--print 'ya existe esa marca'
end
GO


CREATE procedure [dbo].[InsertarEmpleados]
(
@Nombre varchar(80),
@Apellido varchar(80),
@Telefono char(12),
@Direccion varchar(150),
@Correo varchar(80),
@Identidad nvarchar(13)
)
as
begin
--declare @auto int
--if not exists(select [Codigo Empleado] from Empleados where [Codigo Empleado] = @auto)
insert into Empleados values(@Nombre,@Apellido,@Telefono,@Direccion,@Correo,@Identidad)
--else
--print 'ya existe ese empleado'
end

GO


create procedure [dbo].[InsertarDetalleCompra]
(
@CodigoCo int,
@Descripcion nvarchar(80),
@Precio float,
@Cantidad bigint,
@Subtotal decimal(10,2),
@Portuario float
)
as
begin
insert into [Detalle Compra] values(@CodigoCo,@Descripcion,@Precio,@Cantidad,@Subtotal,@Portuario)
end
GO


CREATE procedure [dbo].[InsertarCompra]
(
@Fecha datetime,
@Embalaje varchar(50),
@CodOrd int
)
as
begin
--declare @cod int
--if not exists(select [Codigo Compra] from Compras where [Codigo Compra]=@cod)
insert into Compras values(@Fecha,@Embalaje,@CodOrd)
--else
--print 'compra repetida error'
end
GO


CREATE procedure [dbo].[InsertarClienteComun]
(
@Nombre nvarchar(80),
@Apellido nvarchar(80),
@TipoCliente varchar(9),
@Identidad nvarchar(13)
)
as
begin
--declare @c int
--if not exists(select [Codigo Cliente] from Clientes where [Codigo Cliente]=@c)
insert into Clientes(Nombre,Apellido,[Tipo Cliente],Identidad) values(@Nombre,@Apellido,@TipoCliente,@Identidad)
--else
--print 'ya existe ese cliente comun'
end
GO


CREATE procedure [dbo].[InsertarCliente](
@RTN varchar(14),
@Nombre nvarchar(80),
@Apellido nvarchar(80),
@Sexo char(1),
@Telefono char(12),
@Direccion varchar(150),
@Correo varchar(80),
@TipoCliente varchar(9),
@Identidad nvarchar(13)
)
as
begin
--declare @auto int
--if not exists(select [Codigo Cliente] from Clientes where [Codigo Cliente]=@auto)
insert into Clientes values(@RTN,@Nombre,@Apellido,@Sexo,@Telefono,@Direccion,@Correo,@TipoCliente,@Identidad)
--else
--print 'ya existe ese cliente mayorista'
end
GO


CREATE procedure [dbo].[InsertarCategoria]
(
@Categoria nvarchar(50) 
)
as
begin
--declare @cod int
--if not exists(select [Codigo Categoria] from  Categoria where [Codigo Categoria]=@cod)
insert into Categoria values(@Categoria)
--else
--print 'ya existe esa marca'
end
GO


create procedure [dbo].[EliminarProveedor](
@Proveedor nvarchar(80)
)
as
begin
delete from Proveedores where Proveedor = @Proveedor
end
GO

create procedure [dbo].[EliminarCliente](
@RTN varchar(14)
)
as
begin
delete from Clientes where RTN=@RTN
end
GO

create procedure [dbo].[EditarCliente](
@codigo int,
@RTN varchar(14),
@Nombre nvarchar(80),
@Apellido nvarchar(80),
@Sexo char(1),
@Telefono char(12),
@Direccion varchar(150),
@Correo varchar(80),
@Tipo varchar(9),
@Identidad nvarchar(13)
)
as
begin
update Clientes set RTN=@RTN , Nombre =@Nombre , Apellido=@Apellido , Sexo=@Sexo,
Telefono=@Telefono , Direccion=@Direccion , Correo=@Correo , [Tipo Cliente] = @Tipo,
Identidad = @Identidad where [Codigo Cliente] = @codigo
end
GO

create procedure [dbo].[CargarProveedor](
@Proveedor nvarchar(80)
)
as
begin
select * from Proveedores where Proveedor = @Proveedor
end
GO


create procedure [dbo].[CargarClientes](
@RTN int
)
as
begin
select * from Clientes where RTN = @RTN
end



GO