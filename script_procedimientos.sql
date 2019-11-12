/*create procedure InsertarCliente(
@RTN int,
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
declare @auto int
if not exists(select [Codigo Cliente] from Clientes where [Codigo Cliente] = @auto)
insert into Clientes values(@RTN,@Nombre,@Apellido,@Sexo,@Telefono,@Direccion,@Correo,@TipoCliente,@Identidad)
else
print 'ya existe ese cliente'
end
*/




/*create procedure InsertarProveedor(
@Proveedor nvarchar(80),
@Telefono char(12),
@Direccion varchar(150),
@Correo varchar(80)
)
as
begin
declare @id int
if not exists(select [Codigo Cliente] from Clientes where [Codigo Cliente] = @id)
insert into Proveedores values(@Proveedor,@Telefono,@Direccion,@Correo)
else
print 'ya existe ese proveedor'
end
*/

/*create procedure CargarClientes(
@RTN int
)
as
begin
select * from Clientes where RTN = @RTN
end
*/


/*create procedure CargarProveedor(
@Proveedor nvarchar(80)
)
as
begin
select * from Proveedores where Proveedor = @Proveedor
end

*/

/*create procedure EliminarProveedor(
@Proveedor nvarchar(80)
)
as
begin
delete from Proveedores where Proveedor = @Proveedor
end*/



/*create procedure Actualizar(
/*Parametros*/
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
*/

/*create procedure Eliminar(
@RTN varchar(14)
)
as
begin
delete from Clientes where RTN=@RTN
end
*/



/*
create procedure InsertarCompra
(
@codigo int ,
@fecha datetime,
@embalaje varchar(50),
@codproveedor int,
@codorden int
)
as
begin
declare @auto int
if not exists(select [Codigo Compra] from Compras where [Codigo Compra] = @auto)
insert into Compras values(@fecha,@embalaje,@codproveedor,@codorden)
else
print 'ya se habia realizado esa compra'
end
*/


/*
create procedure InsertarDetalleCompra
(
@cod int,
@desc nvarchar(80),
@precio float,
@cant bigint,
@subtotal decimal(10,2),
@isvportuario float
)
as
begin
declare @auto int
if not exists(select [Codigo Compra] from [Detalle Compra] where [Codigo Compra] = @auto)
insert into [Detalle Compra] values(@cod,@desc,@precio,@cant,@subtotal,@isvportuario)
else
print 'no se puede ingresar la compra repetida'
end
*/