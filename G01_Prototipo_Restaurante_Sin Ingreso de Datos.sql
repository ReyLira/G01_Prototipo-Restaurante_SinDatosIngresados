CREATE DATABASE Restaurante_Prototipo_G01
DEFAULT CHARACTER SET UTF8MB4;
/* Usando la base de datos */

USE Restaurante_Prototipo_G01;
/* Creando las tablas */
CREATE table Ubigeo(
	Cod_Ubigeo INT AUTO_INCREMENT,
	Departamento VARCHAR(70) NOT NULL,
	Provincia VARCHAR(70) NOT NULL,
    Distrito VARCHAR(70) NOT NULL,
	PRIMARY KEY (Cod_Ubigeo)
);

CREATE table Cliente(
	Id_Cliente INT AUTO_INCREMENT,
    Cod_Ubigeo INT,
	Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(40),
    Ap_Materno VARCHAR(40),
    Telefono char(9),
    Correo VARCHAR(50),
	PRIMARY KEY (Id_Cliente),
	foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo)
);




CREATE table Empleado(
	Id_Empleado INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Cod_Ubigeo INT,
    Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(30),
    Ap_Materno VARCHAR(30),
    Telefono char(9),
    Horario varchar(10),
	PRIMARY KEY (Id_Empleado),
    foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo),
    foreign key (Id_Cliente) references Cliente(Id_Cliente)
);



CREATE table Pedido(
	Id_Pedido INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Id_Empleado INT,
	Nombre VARCHAR(30),
    Cantidad int,
	PRIMARY KEY (Id_Pedido),
    foreign key (Id_Cliente) references Cliente(Id_Cliente),
    foreign key (Id_Empleado) references Empleado(Id_Empleado)
);

CREATE table Venta(
	Codigo_Venta INT AUTO_INCREMENT,
    Id_Pedido INT,
    Fecha DATE,
    Total float,
	PRIMARY KEY (Codigo_Venta),
    foreign key (Id_Pedido) references Pedido(Id_Pedido)
);



CREATE table Menu(
	Codigo_Menu INT AUTO_INCREMENT,
	Nombre VARCHAR (40),
	PRIMARY KEY (Codigo_Menu)
);


CREATE table Producto(
	Codigo_Producto INT AUTO_INCREMENT,
    Codigo_Menu INT,
    Descripcion text,
    Nombre VARCHAR (50),
    Precio float,
	PRIMARY KEY (Codigo_Producto),
    foreign key (Codigo_Menu) references Menu(Codigo_Menu)
);


CREATE table Venta_Detalle(
	Codigo_VentaDetalle INT AUTO_INCREMENT,
    Codigo_Venta INT,
    Codigo_Producto int,
    Cantidad int,
    Precio float,
    total float,
	PRIMARY KEY (Codigo_VentaDetalle),
    foreign key (Codigo_Venta) references Venta(Codigo_Venta),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);


CREATE table Menu_Producto(
	Codigo_MenuProducto INT AUTO_INCREMENT,
    Codigo_Menu INT,
	Codigo_Producto INT,
    Categoria varchar(20),
	PRIMARY KEY (Codigo_MenuProducto),
    foreign key (Codigo_Menu) references Menu(Codigo_Menu),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);


