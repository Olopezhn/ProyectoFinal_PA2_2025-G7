CREATE DATABASE biblioteca01;
USE biblioteca01;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(100) NOT NULL,
    telefono VARCHAR(8),
    CHECK (telefono REGEXP '^[0-9]{8}$' OR telefono IS NULL)/*asegura que el campo de telefono debe ser 8 digitos exactamente*/
);

CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo_libro VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    id_autor int NOT NULL,
    edicion INT CHECK (edicion BETWEEN 1000 AND 9999),
    editorial VARCHAR(100),
    fecha_publicacion DATE NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);




CREATE TABLE ejemplares (
    id_ejemplar INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    piso INT NOT NULL,
    pasillo INT NOT NULL,
    existencia INT NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    CHECK (piso BETWEEN 0 AND 99), /*restriccion para solo dos numeros*/
    CHECK (pasillo BETWEEN 0 AND 99),  /*restriccion para solo dos numeros*/
    CHECK (existencia >= 0 AND existencia <= 999999) /*restriccion para solo seis numeros*/
);


CREATE TABLE tipo_usuario (
    id_tipo_usuario INT NOT NULL PRIMARY KEY CHECK (id_tipo_usuario BETWEEN 1000 AND 9999),
    tipo_usuario VARCHAR(80) NOT NULL,
    CHECK (tipo_usuario IN ('Alumno', 'Docente','Empleado'))
);



CREATE TABLE usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    dni_usuario VARCHAR(13) NOT NULL,
    nombre_usuario VARCHAR(80) NOT NULL,
    tipo_usuario INT NOT NULL,
    correo VARCHAR(50),
    telefono VARCHAR(8),
    contrasenia varchar(255) NOT NULL,
    FOREIGN KEY (tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario),
    CHECK (tipo_usuario BETWEEN 1000 AND 9999),
    CHECK (telefono IS NULL OR telefono REGEXP '^[0-9]{8}$'),
    CHECK (dni_usuario REGEXP '^[0-9]{13}$')
);



CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad BETWEEN 1 AND 999),
    id_usuario int NOT NULL,    
    fecha_limite DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    
);

CREATE TABLE devolucion (
    id_devolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamo INT NOT NULL UNIQUE,
    id_libro INT NOT NULL,
    fecha_devolucion DATE NOT NULL,
    FOREIGN KEY (id_prestamo) REFERENCES prestamos(id_prestamo),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE transacciones (
    numero_recibo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    descripcion VARCHAR(120),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

