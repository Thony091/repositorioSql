-- Parte 1 - Creacion de Base de Datos y usuario con todos los privilegios.
CREATE DATABASE	telovendo_new;
CREATE USER 'tlv_user'@'localhost' IDENTIFIED BY 'user123';
GRANT ALL PRIVILEGES ON telovendo_new.* TO 'tlv_user'@'localhost';
FLUSH PRIVILEGES;
-- Parte 1 - Fin de Creacion Base de Datos y usuario con privilegios


-- Parte 2 - Creación de tablas e inserción de datos en tablas
	-- Tabla categorias con 2 atributos
CREATE TABLE Categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30)
);
	-- Fin de creacion de tabla categoria
    
	-- Insertando datos a tabla "Categorias"
INSERT INTO categorias VALUES(1,'Electrónica'),(2,'Deporte');
	-- Fin de Insertando datos a tabla "Categorias"
    
    SELECT * FROM categorias; -- SELECT para confirmar inserciones en la tabla
    
    -- Tabla "Proveedores" con 8 atributos
CREATE TABLE Proveedores (
  id_Proveedor INT PRIMARY KEY AUTO_INCREMENT, -- Atributo de tipo INT(números), como "Primary Key" (Llave primaria) y con "AUTO_INCREMENT"(asigna un valor nuevo, distinto al anterior de forma automatica al insertarse información nueva)
  representante_legal VARCHAR(100) NOT NULL, -- Atributo de tipo "VARCHAR(100)" (se utiliza para almacenar datos de tipo cadena con una extension de 100 caracteres), con la restricción "NOT NULL"(Obliga a este atributo no quedar vacio)
  nombre_corporativo VARCHAR(70) NOT NULL UNIQUE, /* Atributo de tipo "VARCHAR(70)" (se utiliza para almacenar datos de tipo cadena con una extension de 70 caracteres),
													con la restricción "NOT NULL"(Obliga a este atributo no quedar vacio) y UNIQUE(obliga a este atributo ser unico y que no se pueda repetir nuevamente) */
  telefono_1 VARCHAR(20) NOT NULL, -- Atributo de tipo "VARCHAR(100)" (se utiliza para almacenar datos de tipo cadena con una extension de 20 caracteres), con la restricción "NOT NULL"(Obliga a este atributo no quedar vacio)
  contacto_1 VARCHAR(50) NOT NULL,-- Atributo de tipo "VARCHAR(100)" (se utiliza para almacenar datos de tipo cadena con una extension de 50 caracteres), con la restricción "NOT NULL"(Obliga a este atributo no quedar vacio)
  telefono_2 VARCHAR(20) NOT NULL,-- Atributo de tipo "VARCHAR(100)" (se utiliza para almacenar datos de tipo cadena con una extension de 20 caracteres), con la restricción "NOT NULL"(Obliga a este atributo no quedar vacio)
  contacto_2 VARCHAR(50) NOT NULL,-- Atributo de tipo "VARCHAR(100)" (se utiliza para almacenar datos de tipo cadena con una extension de 50 caracteres), con la restricción "NOT NULL"(Obliga a este atributo no quedar vacio)
  correo_electronico VARCHAR(70) UNIQUE NOT NULL /* Atributo de tipo "VARCHAR(70)" (se utiliza para almacenar datos de tipo cadena con una extension de 70 caracteres),
													con la restricción "NOT NULL"(Obliga a este atributo no quedar vacio) y UNIQUE(obliga a este atributo ser unico y que no se pueda repetir nuevamente) */
);
	-- Fin de creación de Tabla "Proveedores" 
  
	-- Insertando datos a tabla "Proveedores"
INSERT INTO Proveedores (representante_legal, nombre_corporativo, telefono_1, contacto_1, telefono_2, contacto_2, correo_electronico)
VALUES
    ('Juan Perez', 'ElectroMundo', '555-1234', 'Recepción', '5555-5678', 'Ventas',  'juan@electromundo.com'),
    ('María Rodriguez', 'Tecnología Total', '555-2345', 'Compras', '5555-6789', 'Soporte', 'maria@tecnologiatotal.com'),
    ('Pedro Gómez', 'Innovación en Electrónica', '555-3456', 'Ventas', '5555-6547', 'Soporte', 'pedro@innovacionelectronic.com'),
    ('Lucía Fernández', 'ElectroVisión', '555-4567', 'Recepción', '5555-7890', 'Compras', 'lucia@electrovision.com'),
    ('Jorge Castillo', 'ElecTech', '555-5678', 'Soporte', '5555-8901', 'Ventas', 'jorge@electech.com'),
    ('Luisito Rey', 'ElecTricaSalsa', '523-5118', 'Soporte', '5555-8901', 'Ventas', 'jfk@electech.com');
	-- Fin Insertando datos a tabla Proveedores
    
    SELECT * FROM Proveedores; -- SELECT para confirmar inserciones en la tabla
    
     -- Tabla "Clientes" con 4 atributos
CREATE TABLE Clientes (
  id_Cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL
);
	-- Fin de creación de Tabla "Clientes" 

-- Insertando datos a tabla Clientes
INSERT INTO Clientes (nombre, apellido, direccion) VALUES
    ('Juan', 'Pérez', 'Calle 123'),
    ('María', 'Gómez', 'Avenida 456'),
    ('Pedro', 'Martínez', 'Calle 789'),
    ('Lucía', 'Hernández', 'Avenida 012'),
    ('Jorge', 'García', 'Calle 345');
-- Fin Insertando datos a tabla Clientes
SELECT * FROM Clientes; -- SELECT para confirmar inserciones en la tabla

	-- Tabla "Productos" con 4 atributos
CREATE TABLE Productos (
  id_Producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,  
  color VARCHAR(45) NOT NULL,
  stock INT NOT NULL,
  id_categoria INT NOT NULL,
FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);
	-- Fin de creación de Tabla "Productos" 
    
-- Insertando datos a tabla "Productos"
INSERT INTO Productos (nombre, precio, color, stock, id_categoria) VALUES
    ('Mouse Gamer', 100.50, 'Rojo', 10, 1),
    ('HUB usb', 75.99, 'Azul', 15, 1),
    ('Disco Duro 1 tb', 50.00, 'Verde', 20, 1),
    ('Web Cam', 120.25, 'Negro', 8, 1),
    ('Teclado', 80.00, 'Blanco', 12, 1),
    ('Teclado RGB', 150.00, 'Gris', 6, 1),
    ('Joystick', 45.75, 'Negro', 18, 1),
    ('Monitor 27 Pulgadas', 90.50, 'Negro', 7, 1),
    ('Disipador CPU', 60.00, 'Gris', 9, 1),
    ('Calcetines', 35.25, 'Blanco', 14, 2);
-- Fin de insertando datos a tabla "Productos"

	-- Tabla "Detalle" con 3 atributos
CREATE TABLE detalle_Prod_prove (
  id_detalle INT PRIMARY KEY AUTO_INCREMENT,  
  id_proveedor INT NOT NULL,
  id_producto INT NOT NULL,
  FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_Proveedor),
  FOREIGN KEY (id_producto) REFERENCES Productos (id_Producto)
);
	-- Fin de creación de tabla "Detalle" 
    
-- Insertando datos a tabla "Productos"
INSERT INTO detalle_Prod_prove (id_proveedor, id_producto) VALUES 
(1,1),  (2,2),  (3,3),  (4,5), (5,5), (6,7), 
(1,2),  (2,3),  (3,1),  (4,7), (5,9), (6,10), 
(1,10), (2,7),  (3,8),  (4,8), (5,2), (6,1), 
(1,3),  (2,2),  (3,10), (4,7), (5,8), (6,9), 
(1,8),  (2,1),  (3,3),  (4,4), (5,3), (6,8), 
(1,9),  (2,10), (3,5),  (4,5), (5,4), (6,2);
-- Fin de Insertando datos a tabla "Productos"
SELECT * FROM detalle_Prod_prove; -- SELECT para confirmar inserciones en la tabla

-- Fin Parte 2 - Creación de tablas e inserción de datos en tablas


-- Parte 3 - Consultas y Update´s
-- CONSULTA 1 Entre los proveedores la categoria que más se repite es "Electrónica"
SELECT c.nombre,
	   COUNT(*) AS id_producto
FROM productos p JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY p.id_categoria 
ORDER BY 2 DESC
LIMIT 1;
					
-- CONSULTA 2 Productos con mayor stock. Respuesta:"Disco duro 1 tb" con 20 unidades
SELECT nombre, stock FROM productos GROUP BY nombre ORDER BY 2 desc;

-- CONSULTA 3 Color de pruducto más común en tienda. Respuesta: Color negro con 33 unidades
SELECT color, COUNT(color) AS "Cantidad" 
FROM proveedores pr LEFT JOIN detalle_prod_prove dpp ON pr.id_proveedor = dpp.id_proveedor
LEFT JOIN productos p ON dpp.id_producto = p.id_producto
GROUP BY p.color 
ORDER BY 2 DESC 
LIMIT 1;


-- CONSULTA 4 Proveedores con menos stock. Respuesta: proveedor con menor stock es "ElecTech" con 213 unidades de stock
SELECT pr.nombre_corporativo AS "Nombre Empresa", 
		sum(p.stock) AS stock_Total
FROM proveedores pr 
JOIN detalle_prod_prove dpp ON pr.id_proveedor = dpp.id_proveedor
INNER JOIN productos p ON dpp.id_producto = p.id_producto
GROUP BY pr.id_proveedor
ORDER BY stock_Total ASC;



/* Cambiando categoria de producto mas popular por "Electrónica y computacion"
Esto se logra empleado un UPDATE en el atributo nombre donde el "id_categoria" que presente mayor stock global */
UPDATE categorias set nombre = 'Electrónica y computación'  WHERE id_categoria in (SELECT t.id_categoria FROM( select p.id_categoria, sum(P.stock) 
																												FROM categorias c JOIN productos p ON c.id_categoria = p.id_categoria
																												GROUP BY p.id_categoria ORDER BY 1 LIMIT 1) as t);
SELECT * FROM categorias; -- SELECT para comprobar cambio de nombre de categoria

-- Fin Parte 3 - Consultas y Update´s