CREATE DATABASE IF NOT EXISTS tienda_avanzada;


USE tienda_avanzada;


CREATE TABLE clientes (
 cliente_id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT UNIQUE,
 total_compras DECIMAL(10, 2) DEFAULT 0.00,
 categoria VARCHAR(20) DEFAULT 'BRONCE'
);

CREATE TABLE productos (
 producto_id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 precio DECIMAL(10, 2) NOT NULL,
 stock INT NOT NULL DEFAULT 0
);

CREATE TABLE ventas (
 venta_id INT AUTO_INCREMENT PRIMARY KEY,
 cliente_id INT NOT NULL,
 producto_id INT NOT NULL,
 cantidad INT NOT NULL,
 precio_unitario DECIMAL(10, 2) NOT NULL,
 descuento_aplicado DECIMAL(10, 2) DEFAULT 0.00,
 monto_total DECIMAL(10, 2) NOT NULL,
 fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
 FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

CREATE TABLE auditoria_ventas (
 auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
 venta_id INT NOT NULL,
 mensaje VARCHAR(255) NOT NULL,
 fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE historial_precios (
    historial_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    precio_anterior DECIMAL(10,2) NOT NULL,
    precio_nuevo DECIMAL(10,2) NOT NULL,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


-- Inserción de datos iniciales de prueba
INSERT INTO clientes (nombre, email, total_compras, categoria) VALUES
('Carlos Mendoza', 'carlos.mendoza@email.com', 450.00, 'BRONCE'),
('Ana María Gómez', 'ana.gomez@email.com', 1200.00, 'PLATA'),
('Roberto Silva', 'roberto.silva@email.com', 5500.00, 'ORO');
INSERT INTO productos (nombre, precio, stock) VALUES
('Laptop Pro 15', 1200.00, 10),
('Mouse Inalámbrico', 25.00, 50),
('Teclado Mecánico', 85.00, 5);