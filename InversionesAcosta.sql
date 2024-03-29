create database Inversiones_Acosta
go
use Inversiones_Acosta
go
create table Marca(
[Codigo Marca] int identity(1,1) primary key,
Descripcion nvarchar(50) not null
)
go
create table Categoria(
[Codigo Categoria] int identity(1,1) primary key,
Descripcion nvarchar(50) not null
)
go
create table Proveedores(
[Codigo Proveedor] int identity(1,1) primary key,
Proveedor nvarchar(80) not null,
Telefono char(12) not null,
Direccion varchar(150),
Correo varchar(80) 
)
go
create table Roles(
[Codigo Rol] int identity(1,1) primary key,
Descripcion varchar(80) not null
)
go
create table Clientes(
[Codigo Cliente] int identity(1,1) primary key,
RTN varchar(14),
Nombre nvarchar(80) not null,
Apellido nvarchar(80) not null,
Sexo char(1),
Telefono char(12),
Direccion varchar(150),
Correo varchar(80),
[Tipo Cliente] varchar(9) not null,
Identidad nvarchar(13) not null
)
go
create table Empleados(
[Codigo Empleado] int identity(1,1) primary key,
Nombre varchar(80) not null,
Apellido varchar(80) not null,
Telefono char(12) not null,
Direccion varchar(150),
Correo varchar(80),
Identidad nvarchar(13) not null
)
go
create table Ordenes(
[Codigo Orden] int identity(1,1) primary key,
Descripcion nvarchar(80) not null,
[Fecha Orden] datetime not null,
[Cantidad Orden] bigint not null,
Estado varchar(20) not null,
[Codigo Proveedor] int foreign key references Proveedores([Codigo Proveedor])
)
go
create table Subcategoria(
[Codigo SubCategoria] int identity(1,1) primary key,
Descripcion nvarchar(50) not null,
[Codigo Categoria] int foreign key references Categoria([Codigo Categoria])
)
go
create table Compras(
[Codigo Compra] int identity(1,1) primary key,
[Fecha Compra] datetime not null,
[Metodo Embalaje] varchar(50) not null,
[Codigo Orden] int foreign key references Ordenes([Codigo Orden])
)
go
create table [Detalle Compra]
(
[Codigo Compra] int foreign key references Compras([Codigo Compra]),
Descripcion nvarchar(80) not null,
[Precio Compra] float not null,
Cantidad bigint not null,
Subtotal decimal(10,2) not null,
[Impuesto Portuario] float not null
)
go
create table Usuarios(
[Codigo Usuario] int identity(1,1) primary key,
Usuario nvarchar(80) not null,
Contraseņa varbinary(max) not null,
Correo nvarchar(80),
Estado varchar(8) not null,
[Codigo Empleado] int foreign key references Empleados([Codigo Empleado]),
[Codigo Rol] int foreign key references Roles([Codigo Rol])
)
go
create table Ventas(
[Codigo Venta] int identity(1,1) primary key,
Fecha datetime not null,
[Codigo Cliente] int foreign key references Clientes([Codigo Cliente]),
[Codigo Empleado] int foreign key references Empleados([Codigo Empleado])
)
go
create table [Productos Inventario](
[Codigo Producto] int identity(1,1) primary key,
Descripcion nvarchar(80) not null,
[Precio Unitario] float not null,
Existencia bigint not null,
[Codigo Compra] int foreign key references Compras([Codigo Compra]),
[Codigo Marca] int foreign key references Marca([Codigo Marca]),
[Codigo Categoria] int foreign key references Categoria([Codigo Categoria]),
[Codigo Subcategoria] int foreign key references Subcategoria([Codigo Subcategoria])
)
go
create table [Detalle Venta](
[Codigo Venta] int foreign key references Ventas([Codigo Venta]),
[Codigo Producto] int foreign key references [Productos Inventario]([Codigo Producto]),
Precio float not null,
Cantidad bigint not null,
Subtotal decimal(10,2) not null,
ISV float not null
)
