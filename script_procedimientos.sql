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


