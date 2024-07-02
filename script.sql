-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS LibreriaDB;

-- Crear la base de datos
CREATE DATABASE LibreriaDB;

-- Usar la base de datos creada
USE LibreriaDB;

-- Crear la tabla Categorias
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear la tabla Editoriales
CREATE TABLE Editoriales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    pais VARCHAR(100)
);

-- Crear la tabla Autores
CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL
);

-- Crear la tabla Libros
CREATE TABLE Libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_categoria INT,
    id_editorial INT,
    fecha_publicacion DATE,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id),
    FOREIGN KEY (id_editorial) REFERENCES Editoriales(id)
);

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

-- Crear la tabla Ventas
CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

-- Crear la tabla intermedia Libros_Autores
CREATE TABLE Libros_Autores (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_autor) REFERENCES Autores(id)
);

-- Crear la tabla intermedia Ventas_Libros
CREATE TABLE Ventas_Libros (
    id_venta INT,
    id_libro INT,
    cantidad INT,
    PRIMARY KEY (id_venta, id_libro),
    FOREIGN KEY (id_venta) REFERENCES Ventas(id),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);