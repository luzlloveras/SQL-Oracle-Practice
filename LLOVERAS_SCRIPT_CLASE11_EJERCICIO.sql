-- 1. Crear las tablas normalizada de acuerdo con el Modelo planteado.
-- CREACION TABLA PRODUCTOS
create table productos (
    cod_producto VARCHAR(5) PRIMARY KEY,
    descripcion VARCHAR(30) NOT NULL,
    precio_unitario NUMBER(9,2) NOT NULL
);

-- CREACION TABLA CLIENTES
create table clientes (
    cod_cliente VARCHAR(5) PRIMARY KEY,
    nombres VARCHAR(30) NOT NULL,
    distrito VARCHAR(30) NOT NULL,
    telefono VARCHAR(10) NOT NULL
);

-- CREACION TABLA FACTURAS
CREATE TABLE facturas (
    cod_factura VARCHAR(5) PRIMARY KEY,
    cod_cliente VARCHAR(5) NOT NULL,
    fecha_emision DATE NOT NULL,
    importe_total NUMBER(9,2) NOT NULL,
    FOREIGN KEY  (cod_cliente) REFERENCES clientes(cod_cliente)
);

-- CREACION TABLA DETALLE_FACTURAS
CREATE TABLE detalle_facturas(
    cod_factura VARCHAR(5) NOT NULL,
    cod_producto VARCHAR(5) NOT NULL,
    cantidad NUMBER(*,0) NOT NULL,
    subtotal NUMBER(9,2) NOT NULL,
    FOREIGN KEY (cod_factura) REFERENCES facturas(cod_factura),
    FOREIGN KEY (cod_producto) REFERENCES productos(cod_producto)
);

-- 2. Ejecutar el Script adjunto al trabajo práctico a fin de insertar los registros de cada tabla creada.
-- INSERTANDO REGISTROS A LA TABLA PRODUCTOS
 
INSERT INTO productos VALUES('P0001','Memoria DDR 256 Mb',120.00);
INSERT INTO productos VALUES('P0002','Memoria DDR 500 Mb',190.00);
INSERT INTO productos VALUES('P0003','Mainboard PcChip v25',280.00);
INSERT INTO productos VALUES('P0004','Mainboard Intel V101',320.00);
INSERT INTO productos VALUES('P0005','Procesador Intel 3.6',390.00);
INSERT INTO productos VALUES('P0006','Procesador Intel 2.6',340.00);
INSERT INTO productos VALUES('P0007','Procesador Celeron 3.2',320.00);
INSERT INTO productos VALUES('P0008','Disco Duro SATA 80 GB',180.00);
INSERT INTO productos VALUES('P0009','Disco Duro SATA 120 GB',220.00);
INSERT INTO productos VALUES('P0010','Case Prezcom 500 Wats',120.00);

-- INSERTANDO REGISTROS A LA TABLA CLIENTES
 
INSERT INTO clientes VALUES('C0001','Julian Perez','Lince','3214568');
INSERT INTO clientes VALUES('C0002','Maria Chavez','Jesus Maria','4215678');
INSERT INTO clientes VALUES('C0003','Juan Chacaltana','Comas','5416321');
INSERT INTO clientes VALUES('C0004','Guadalupe Fernandez','Cercado','5216364');
INSERT INTO clientes VALUES('C0005','Jose Gomez','Lince','3458974');
INSERT INTO clientes VALUES('C0006','Carlos Segura','Rimac','4562312');
INSERT INTO clientes VALUES('C0007','Javier Buleje','Lince','3218974');
INSERT INTO clientes VALUES('C0008','Mary Huaman','Cercado','5631278');
INSERT INTO clientes VALUES('C0009','Cristian Sanchez','Cercado','5410591');
INSERT INTO clientes VALUES('C0010','Flor Paz','Lince','3564165');

-- INSERTANDO REGISTROS A TABLA FACTURAS
INSERT INTO facturas VALUES('F0001','C0004',SYSDATE,0);
INSERT INTO facturas VALUES('F0002','C0006',SYSDATE,0);
INSERT INTO facturas VALUES('F0003','C0007',SYSDATE,0);
INSERT INTO facturas VALUES('F0004','C0004',SYSDATE,0);
INSERT INTO facturas VALUES('F0005','C0008',SYSDATE,0);
INSERT INTO facturas VALUES('F0006','C0002',SYSDATE,0);
INSERT INTO facturas VALUES('F0007','C0006',SYSDATE,0);
INSERT INTO facturas VALUES('F0008','C0009',SYSDATE,0);
INSERT INTO facturas VALUES('F0009','C0010',SYSDATE,0);
INSERT INTO facturas VALUES('F0010','C0004',SYSDATE,0);

-- INSERTANDO REGISTROS A LA TABLA DETALLE FACTURAS
INSERT INTO detalle_facturas VALUES('F0001','P0003',3,840.00);
INSERT INTO detalle_facturas VALUES('F0001','P0005',5,1950.00);
INSERT INTO detalle_facturas VALUES('F0001','P0006',2,680.00);
INSERT INTO detalle_facturas VALUES('F0001','P0009',1,220.00);
INSERT INTO detalle_facturas VALUES('F0002','P0009',3,660.00);
INSERT INTO detalle_facturas VALUES('F0002','P0005',8,3120.00);
INSERT INTO detalle_facturas VALUES('F0002','P0002',2,380.00);
INSERT INTO detalle_facturas VALUES('F0002','P0007',3,960.00);
INSERT INTO detalle_facturas VALUES('F0002','P0010',1,120.00);
INSERT INTO detalle_facturas VALUES('F0003','P0010',4,480.00);
INSERT INTO detalle_facturas VALUES('F0003','P0003',7,1960.00);
INSERT INTO detalle_facturas VALUES('F0003','P0006',2,680.00);
INSERT INTO detalle_facturas VALUES('F0003','P0009',1,220.00);
INSERT INTO detalle_facturas VALUES('F0004','P0005',3,1170.00);
INSERT INTO detalle_facturas VALUES('F0004','P0006',6,2040.00);
INSERT INTO detalle_facturas VALUES('F0004','P0007',8,2560.00);
INSERT INTO detalle_facturas VALUES('F0005','P0003',3,840.00);
INSERT INTO detalle_facturas VALUES('F0005','P0005',5,1950.00);
INSERT INTO detalle_facturas VALUES('F0005','P0002',1,190.00);
INSERT INTO detalle_facturas VALUES('F0006','P0007',3,960.00);
INSERT INTO detalle_facturas VALUES('F0006','P0002',2,380.00);
INSERT INTO detalle_facturas VALUES('F0007','P0003',3,840.00);
INSERT INTO detalle_facturas VALUES('F0007','P0008',4,720.00);
INSERT INTO detalle_facturas VALUES('F0008','P0003',3,840.00);
INSERT INTO detalle_facturas VALUES('F0008','P0006',1,340.00);
INSERT INTO detalle_facturas VALUES('F0009','P0003',3,840.00);
INSERT INTO detalle_facturas VALUES('F0010','P0009',5,1100.00);
 
-- 3. Agregar el artículo cuyo código sea el siguiente en la secuencia, el nombre es ALTAVOCES, su precio $7000.
-- Veo ultimo codigo
SELECT cod_producto FROM (SELECT * FROM productos ORDER BY cod_producto DESC) WHERE ROWNUM = 1;

--Inserto nuevo registro en productos
INSERT INTO productos VALUES(
    'P0011',
    'ALTAVOCES',
    7000.00
);

-- Verifico la insercion
SELECT * FROM productos;

-- 4. Cambiar el nombre del producto cuyo código termina en 8 por ‘Impresora Láser’.
UPDATE productos SET descripcion = 'Impresora Láser' WHERE cod_producto = 'P0008';

-- 5. Aplicar un 10 % de descuento a todos los precios de los productos.
SELECT 
precio_unitario + (precio_unitario * 10 / 100)
from productos;


UPDATE productos SET precio_unitario =  132 WHERE cod_producto = 'P0001';
UPDATE productos SET precio_unitario =  209 WHERE cod_producto = 'P0002';
UPDATE productos SET precio_unitario =  308 WHERE cod_producto = 'P0003';
UPDATE productos SET precio_unitario =  352 WHERE cod_producto = 'P0004';
UPDATE productos SET precio_unitario =  429 WHERE cod_producto = 'P0005';
UPDATE productos SET precio_unitario =  374 WHERE cod_producto = 'P0006';
UPDATE productos SET precio_unitario =  352 WHERE cod_producto = 'P0007';
UPDATE productos SET precio_unitario =  198 WHERE cod_producto = 'P0008';
UPDATE productos SET precio_unitario =  242 WHERE cod_producto = 'P0009';
UPDATE productos SET precio_unitario =  132 WHERE cod_producto = 'P0010';
UPDATE productos SET precio_unitario =  7700 WHERE cod_producto = 'P0011';

-- 6. Obtener la descripción de todos los productos de la tienda.
SELECT descripcion from productos;

-- 7. Obtener el código y descripción de los artículos de la tienda cuyo precio sea menor a $2000.
SELECT cod_producto,descripcion 
from productos
where precio_unitario < 2000;

-- 8. Obtener todos los datos de los productos de la tienda cuyo precio esté entre $600 y $1200.
SELECT * 
from productos
where precio_unitario >= 600 AND precio_unitario <= 1200;

-- 9. Aplicar un descuento de $150 a todos los productos cuyos precios no sean superiores o iguales a $1200.
SELECT precio_unitario - 150 
from productos
where precio_unitario < 1200;

UPDATE productos SET precio_unitario =  -18 WHERE cod_producto = 'P0001';
UPDATE productos SET precio_unitario =  59 WHERE cod_producto = 'P0002';
UPDATE productos SET precio_unitario =  158 WHERE cod_producto = 'P0003';
UPDATE productos SET precio_unitario =  202 WHERE cod_producto = 'P0004';
UPDATE productos SET precio_unitario =  279 WHERE cod_producto = 'P0005';
UPDATE productos SET precio_unitario =  224 WHERE cod_producto = 'P0006';
UPDATE productos SET precio_unitario =  202 WHERE cod_producto = 'P0007';
UPDATE productos SET precio_unitario =  48 WHERE cod_producto = 'P0008';
UPDATE productos SET precio_unitario =  92 WHERE cod_producto = 'P0009';
UPDATE productos SET precio_unitario =  -18 WHERE cod_producto = 'P0010';

-- 10. Obtener la descripción y el precio en dólares de todos los productos de la tienda (considere que el dólar está a $450).
select descripcion, 
precio_unitario * 450
from productos;

-- 11. Obtener la descripción y el precio en dólares de los productos de la tienda cuyo precio sea
-- superior o igual a $1800 ordenados en forma descendente por precio y ascendentemente por nombre.
SELECT precio_unitario * 450, descripcion 
from productos
where precio_unitario >= 10
ORDER BY precio_unitario DESC, descripcion ASC;

