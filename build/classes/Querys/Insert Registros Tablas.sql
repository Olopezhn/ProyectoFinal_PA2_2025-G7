
/*INSERT PARA TABLA CATEGORIAS*/
INSERT INTO categorias (nombre_categoria) VALUES ('Literatura');
INSERT INTO categorias (nombre_categoria) VALUES ('Historia');
INSERT INTO categorias (nombre_categoria) VALUES ('Ciencia Ficción');
INSERT INTO categorias (nombre_categoria) VALUES ('Filosofía');
INSERT INTO categorias (nombre_categoria) VALUES ('Tecnología');

/*INSERT TABLA AUTORES*/
INSERT INTO autores (nombre_autor, telefono) VALUES ('Gabriel García Márquez', '87654321');
INSERT INTO autores (nombre_autor, telefono) VALUES ('Isabel Allende', '98765432');
INSERT INTO autores (nombre_autor, telefono) VALUES ('Jorge Luis Borges', NULL);
INSERT INTO autores (nombre_autor, telefono) VALUES ('Mario Vargas Llosa', '76543210');
INSERT INTO autores (nombre_autor, telefono) VALUES ('Octavio Paz', NULL);


/*INSERT TABLA LIBROS*/
INSERT INTO libros (titulo_libro, id_categoria, id_autor, edicion, editorial, fecha_publicacion)
VALUES ('Cien Años de Soledad', 1, 1, 2007, 'Editorial Sudamericana', '2007-05-30');

INSERT INTO libros (titulo_libro, id_categoria, id_autor, edicion, editorial, fecha_publicacion)
VALUES ('La Casa de los Espíritus', 2, 2, 2010, 'Plaza & Janés', '2010-09-15');

INSERT INTO libros (titulo_libro, id_categoria, id_autor, edicion, editorial, fecha_publicacion)
VALUES ('Ficciones', 3, 3, 1999, 'Emecé Editores', '1999-03-20');

INSERT INTO libros (titulo_libro, id_categoria, id_autor, edicion, editorial, fecha_publicacion)
VALUES ('La Fiesta del Chivo', 4, 4, 2005, 'Alfaguara', '2005-11-10');

INSERT INTO libros (titulo_libro, id_categoria, id_autor, edicion, editorial, fecha_publicacion)
VALUES ('El Laberinto de la Soledad', 5, 5, 2015, 'Fondo de Cultura Económica', '2015-01-05');



/*INSERT TABLA EJEMPLARES*/

INSERT INTO ejemplares (id_libro, piso, pasillo, existencia)
VALUES (1, 1, 5, 12);

INSERT INTO ejemplares (id_libro, piso, pasillo, existencia)
VALUES (2, 2, 3, 7);

INSERT INTO ejemplares (id_libro, piso, pasillo, existencia)
VALUES (3, 0, 1, 20);

INSERT INTO ejemplares (id_libro, piso, pasillo, existencia)
VALUES (4, 3, 7, 15);

INSERT INTO ejemplares (id_libro, piso, pasillo, existencia)
VALUES (5, 2, 9, 10);


/*INSERT TABLA TIPO USUARIOS */
INSERT INTO tipo_usuario (id_tipo_usuario, tipo_usuario)
VALUES (1001, 'Alumno');

INSERT INTO tipo_usuario (id_tipo_usuario, tipo_usuario)
VALUES (1002, 'Docente');

INSERT INTO tipo_usuario (id_tipo_usuario, tipo_usuario)
VALUES (1003, 'Empleado');




/*INSERT TABLA USUARIOS*/

INSERT INTO usuarios (dni_usuario, nombre_usuario, tipo_usuario, correo, telefono, contrasenia)
VALUES 
('0801199900013', 'Carlos Ramírez', 1000, 'carlos.ramirez@mail.com', '98765432', 'clave123'),
('0801200000026', 'María López',   2000, 'maria.lopez@mail.com',   '99887766', 'maria2024'),
('0801199800039', 'José Martínez', 1000, 'jose.martinez@mail.com', '92345678', 'josepass'),
('0801200100042', 'Lucía Torres',  2000, 'lucia.torres@mail.com',  '93456789', 'torres456'),
('0801200200055', 'Ana Gómez',     1000, 'ana.gomez@mail.com',     '94567890', 'gomez789');




/*INSERT TABLA PRESTAMOS*/

INSERT INTO prestamos (id_libro, cantidad, id_usuario, fecha_limite) VALUES
(1, 1, 1, '2025-08-15'),
(2, 2, 2, '2025-08-20'),
(3, 1, 3, '2025-08-18'),
(4, 3, 4, '2025-08-25'),
(5, 1, 5, '2025-08-22');





/*INSERT TABLA DEVOLUCIONES*/
INSERT INTO devolucion (id_prestamo, id_libro, fecha_devolucion) VALUES
(1, 1, '2025-08-16'),
(2, 2, '2025-08-21'),
(3, 3, '2025-08-19'),
(4, 4, '2025-08-26'),
(5, 5, '2025-08-23');





/*INSERT TABLAS TRANSACCIONES*/
INSERT INTO transacciones (id_usuario, monto, descripcion) VALUES
(1, 150.00, 'Pago por reposición de libro perdido'),
(2, 50.00, 'Multa por entrega tardía'),
(3, 200.00, 'Donación voluntaria a la biblioteca'),
(4, 75.50, 'Pago por servicios de impresión'),
(5, 120.00, 'Compra de membresía anual');






