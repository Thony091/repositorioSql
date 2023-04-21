-- Ejercicio Grupal 5 Modulo 3 - Bases de datos relacionales – DDL

-- Creacion de Base de Datos y usuario con todos los privilegios.
CREATE DATABASE	tlv_new;
CREATE USER 'tlv_user'@'localhost' IDENTIFIED BY 'user123';
GRANT ALL PRIVILEGES ON tlv_new.* TO 'tlv_user'@'localhost';
FLUSH PRIVILEGES;
-- Fin de Creacion Base de Datos y usuario con privilegios

-- Creacion de tablas 
CREATE TABLE usuarios(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    zona_horaria VARCHAR(12) DEFAULT 'UTC-3',
    genero VARCHAR(10) NOT NULL,
    telefono_contacto VARCHAR(15) NOT NULL
);
CREATE TABLE ingresos (
	id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
DESCRIBE usuarios;
-- Fin de creacion de tablas

-- Cambiar zona horaria
ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(12) default 'UTC-2';
-- Fin de Cambiar zona horaria

/* ***IGNORAR ESTA SECCION ***
OBTENER ZONA HORARIA DE UN REGISTRO ESPECIFICO 
SELECT CONVERT_TZ((select fecha from transacciones where id = 3), '+00:00', '-03:00'); -- DE UN ATIRBUTO DE TABLA
SELECT TIMEDIFF(NOW(), UTC_TIMESTAMP); -- Zona horaria actual sistema
select timediff(now(),convert_tz(now(),@@session.time_zone,'+00:00')); -- zona horaria actual Sistema
***FIN IGNORAR ESTA SECCION IGNORAR****/

-- Creación de registros para las tablas
INSERT INTO usuarios (nombre, apellido, contraseña, genero, telefono_contacto) VALUES
('Juan', 'Pérez', 'abcd1234', 'Masculino', '555-1234'),
('María', 'González', 'xyz9876', 'Femenino', '555-5678'),
('Pedro', 'Rodríguez', '12345abc', 'Masculino', '555-9012'),
('Ana', 'Martínez', 'pqr6789', 'Femenino', '555-3456'),
('Jorge', 'Hernández', 'defg5678', 'Masculino', '555-7890'),
('Lucía', 'Sánchez', 'lmno2468', 'Femenino', '555-2345'),
('Diego', 'Fernández', 'wxyz1357', 'Masculino', '555-6789'),
('Sofía', 'López', 'jklm2468', 'Femenino', '555-0123');

INSERT INTO ingresos (id_usuario, fecha_hora) VALUES
(1, '2023-04-18 12:00:00'),
(2, '2023-04-18 13:00:00'),
(3, '2023-04-18 14:00:00'),
(4, '2023-04-18 15:00:00'),
(5, '2023-04-18 16:00:00'),
(6, '2023-04-18 17:00:00'),
(7, '2023-04-18 18:00:00'),
(8, '2023-04-18 19:00:00');
-- Fin de creación de registros

/* 
***justificación de tipos de datos utilizados en las tablas:***

En la tabla "usuarios_2":
    "id_usuario" se define como INT y se utiliza como clave primaria. Es el tipo de dato adecuado para un identificador único de un usuario.
    "nombre" y "apellido" se definen como VARCHAR(50). Se asume que los nombres y apellidos de los usuarios son cadenas de caracteres, por lo que VARCHAR es el tipo de dato adecuado. Se asigna una longitud máxima de 50 caracteres, lo cual puede ajustarse dependiendo de los requisitos del sistema.
    "contraseña" se define como VARCHAR(50). Se asume que las contraseñas son cadenas de caracteres, y VARCHAR es el tipo de dato adecuado para almacenarlas. Sin embargo, se debe tener en cuenta que almacenar contraseñas en texto plano en la base de datos no es seguro. Lo óptimo sería utilizar técnicas de encriptación o hash para proteger las contraseñas.
    "zona_horaria" se define como VARCHAR(12) y se establece un valor predeterminado. Es un tipo de dato adecuado para almacenar una cadena de caracteres que representa la zona horaria de un usuario, y el valor predeterminado proporciona una conveniencia adicional para el usuario.
    "genero" se define como VARCHAR(10) y se utiliza para almacenar el género de un usuario. Es un tipo de dato adecuado para representar una cadena de caracteres corta como el género. La longitud máxima de 10 caracteres puede ajustarse dependiendo de los requisitos del sistema.
    "telefono" se define como VARCHAR(15) y se establece como NOT NULL. Se asume que los números de teléfono de los usuarios son cadenas de caracteres, y VARCHAR es el tipo de dato adecuado. La longitud máxima de 15 caracteres puede ajustarse dependiendo de los requisitos del sistema. Establecerlo como NOT NULL garantiza que se ingrese un valor de teléfono para cada usuario.

En la tabla "ingresos":
    "id_ingreso" se define como INT y se utiliza como clave primaria. Es el tipo de dato adecuado para un identificador único de un ingreso.
    "id_usuario" se define como INT y se establece como NOT NULL. Se utiliza como clave foránea para relacionar los ingresos con los usuarios en la tabla "usuarios_2".
    "fecha_hora" se define como DATETIME. Es el tipo de dato adecuado para almacenar la fecha y hora de un ingreso. El tipo de dato proporciona mayor precisión que el tipo de dato VARCHAR y es compatible con funciones de fecha y hora.
*** fin de justificación de tipos de datos utilizados en las tablas***
*/

-- Creación de tabla Contacto
CREATE TABLE Contactos (
    id_contacto INT PRIMARY KEY,
    id_usuario INT NOT NULL,
    telefono VARCHAR(20),
    correo_electronico VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Modificacion de tabla usuario columna "telefono_contacto"
ALTER TABLE usuarios MODIFY telefono_contacto VARCHAR(15) UNIQUE;
ALTER TABLE contactos ADD FOREIGN KEY(telefono) REFERENCES usuarios(telefono_contacto);
DESCRIBE contactos;

-- Repositorio de github  https://github.com/KattaMP/ProyectoJavaFullStack/tree/main