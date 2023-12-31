-- 1. Crear la tabla de ARTICULO como la indicada y plantear la relaci�n pedida. 
-- Tener en cuenta los datos que se importar�n y los c�digos de Art�culos son autonum�ricos.
CREATE TABLE fabricante (
    codigo NUMBER(10) PRIMARY KEY,
    razon_social VARCHAR2(50)
);
    
CREATE TABLE articulo (
    codigo NUMBER GENERATED BY DEFAULT AS IDENTITY,
    descripcion VARCHAR2(40) NOT NULL,
    precio NUMBER,
    fabricante_codigo NUMBER NOT NULL,
    CONSTRAINT fk_fabricante FOREIGN KEY (fabricante_codigo) REFERENCES fabricante(codigo)
);

-- 2. Dar de alta los registros de la tabla ARTICULO import�ndolos de la planilla Excel que se adjunta.

-- Insertar datos en la tabla Fabricante
INSERT INTO fabricante (codigo, razon_social) VALUES (1, 'Fabricante 1');
INSERT INTO fabricante (codigo, razon_social) VALUES (2, 'Fabricante 2');
INSERT INTO fabricante (codigo, razon_social) VALUES (3, 'Fabricante 3');
INSERT INTO fabricante (codigo, razon_social) VALUES (4, 'Fabricante 4');
INSERT INTO fabricante (codigo, razon_social) VALUES (5, 'Fabricante 5');
INSERT INTO fabricante (codigo, razon_social) VALUES (6, 'Fabricante 6');
INSERT INTO fabricante (codigo, razon_social) VALUES (7, 'Fabricante 7');
INSERT INTO fabricante (codigo, razon_social) VALUES (8, 'Fabricante 8');
INSERT INTO fabricante (codigo, razon_social) VALUES (9, 'Fabricante 9');
INSERT INTO fabricante (codigo, razon_social) VALUES (10, 'Fabricante 10');
INSERT INTO fabricante (codigo, razon_social) VALUES (11, 'Fabricante 11');
INSERT INTO fabricante (codigo, razon_social) VALUES (12, 'Fabricante 12');
INSERT INTO fabricante (codigo, razon_social) VALUES (13, 'Fabricante 13');
INSERT INTO fabricante (codigo, razon_social) VALUES (14, 'Fabricante 14');

-- Insertar datos en la tabla Articulo
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'LAVARROPAS AUTOMATICO', 25000, 1);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'COCINA A GAS', 12800, 2);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'HELADERA', 35800, 6);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'TELEVISOR', 65820, 1);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'HORNO MICROONDAS', 23600, 4);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'HORNO ELECTRICO', 14500, 6);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'LAVARROPAS', 65400, 6);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'EQUIPO DE SONIDO', 98500, 1);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'LICUADORA', 65700, 2);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'PLANCHA', 45600, 4);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'SPLIT', 65400, 4);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'VENTILADOR DE TECHO', 98700, 4);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'VENTILADOR DE PIE', 121000, 6);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'LAVARROPAS SEMIAUTOMATICO', 65400, 1);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'FREEZER', 25800, 7);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'SECADORA DE ROPA', 36900, 7);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'SECADORA DE CABELLO', 74100, 9);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'COMPUTADORA PORTATIL', 85200, 1);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'LAVAVAJILLAS', 14500, 10);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'BATIDORA MANUAL', 65400, 11);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'BATIDORA DE MESA', 98500, 12);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'MULTIPROCESADORA', 65700, 1);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'COMPUTADORA DE ESCRITORIO', 45600, 4);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'VENTILADOR DE MESA', 25000, 13);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'RADIO', 12800, 13);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'ACONDICIONADOR DE AIRE', 35800, 1);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'CALEFACTOR ELECTRICO', 65820, 2);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'HOGAR A LENIA', 23600, 4);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'ESTUFAS A LENIA', 121000, 14);
INSERT INTO articulo ( descripcion, precio, fabricante_codigo) VALUES ( 'PLACAS ELECTRICAS CALEFACTORAS', 65400, 14);


-- 3. Actualizar los precios de los art�culos que tengan un precio entre $12500 y $ 38000 a $ 56000.
update articulo set precio = 56000 where precio >= 12500 AND precio <= 38000;

-- 4. Listar los datos art�culos cuyos precios sean menores de $15000.
select * from articulo where precio < 15000;

-- 5. Eliminar todos los art�culos con precios mayores a $ 2.000.000 y del fabricante con c�digo 4.
delete from articulo where precio < 2000000 and fabricante_codigo = 4;

-- 6. Listar todos los art�culos con una descripci�n que contenga la palabra �ropa�.
select * from articulo where descripcion LIKE '%ROPA%';

-- 7. Listar los fabricantes cuya raz�n social comience con �FR�.
select * from fabricante where razon_social LIKE 'Fa%';

-- 8. Aumentar los precios de todos los art�culos en un 5%.
update articulo set precio = precio + ( precio * 0.05);

-- 9. Realizar un aumento de un 15% en aquellos productos que sean de los fabricantes con c�digos 2 y 3.
update articulo set precio = precio + ( precio * 0.15) where fabricante_codigo = 2 or fabricante_codigo = 3;

-- 10. Indicar cual es el mayor precio que tiene cada fabricante.
select fabricante_codigo, max(precio)
from articulo
group by fabricante_codigo
order by fabricante_codigo;

-- 11. Obtener los nombres de los fabricantes que ofrezcan productos con precio medio mayor a $8500.
select f.razon_social
from  fabricante f
inner join articulo a
on a.fabricante_codigo = f.codigo
group by f.razon_social
having avg(a.precio)>8500;

-- 12. Mostrar el promedio de precios de todos los art�culos de cada uno de los fabricantes.
select f.razon_social fabricante,avg(a.precio) promedio_precio
from articulo a
inner join fabricante f
on a.fabricante_codigo = f.codigo
group by f.razon_social;

-- 13. Obtener el precio medio de los productos de cada fabricante mostrando el nombre del fabricante.
select f.razon_social fabricante , avg(a.precio) precio_medio
from articulo a
inner join fabricante f
on a.fabricante_codigo = f.codigo
group by f.razon_social;

-- 14. Mostrar cu�l es la cantidad de proveedores, fabricantes, que tiene la empresa.
select count(codigo) from fabricante cantidad_fabricante;

-- 15. Se necesita saber cu�ntos productos provee cada fabricante.
select fabricante_codigo, count(codigo) cantidad_productos
from articulo
group by fabricante_codigo
order by fabricante_codigo;

-- 16. Listar nombres y precios de los art�culos m�s caros de cada fabricante con el nombre de �ste.
select f.razon_social, max(a.precio) mas_caro
from articulo a 
inner join fabricante f
on a.fabricante_codigo = f.codigo
group by  f.razon_social;

-- 17. Listar la Raz�n Social de los Fabricantes que no nos proveen art�culos actualmente.
select f.razon_social
from fabricante f
left join articulo a
on f.codigo = a.fabricante_codigo
where a.fabricante_codigo is null;

-- 18. Listar los Fabricantes que nos proveen m�s de tres art�culos.
select f.razon_social
from  fabricante f
inner join articulo a
on a.fabricante_codigo = f.codigo
group by f.razon_social
having count(a.codigo)>3;

-- 19. Obtener los nombres de los productos que nos proveen el fabricante �Kerflex�
select a.descripcion
from  articulo a
inner join fabricante f
on a.fabricante_codigo = f.codigo
where f.razon_social = 'Kerflex';

-- 20. Agregar en el Script del trabajo pr�ctico todas las sentencias que se vayan a ejecutar.
