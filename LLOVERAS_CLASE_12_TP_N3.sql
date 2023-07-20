-- 2. En la Tabla Libro agregar dos columnas: Fecha_Alta cuyo valor predeterminado sea ‘01/04/2010’ y Cantidad.
ALTER TABLE libro ADD Fecha_alta VARCHAR2(255) DEFAULT '01/04/2010';
ALTER TABLE libro ADD Cantidad NUMBER(4);

-- 3. En la tabla de CARRERAS se han encontrado que la carrera de ‘INGENIERIA QUIMICA’ está repetida, identificar el código de una de ellas para luego eliminar uno de los registros en función de su código.
SELECT id from CARRERA where nombre = 'INGENIERIA QUIMICA';
DELETE from CARRERA where id = 6;

-- 4. Eliminar de la tabla de materias la que lleva como nombre ‘INGLES III’ por no existir.
DELETE from materia where nombre = 'INGLES III';

-- 5. La carrera ingeniería Civil lleva por error el nombre de ingeniería CIVICA, realizar el cambio de nombre.
UPDATE carrera SET nombre = 'INGENIERIA CIVIL' where nombre = 'INGENIERIA CIVICA';

-- 6. Indicar cuántos alumnos hay inscriptos en cada uno de los cursos activos.
select ma.curso, count(ma.alumno)
from matricula ma
inner join curso c
on ma.curso = c.id
inner join alumno a
on ma.alumno = a.legajo
group by c.id;

-- 7. Listar todos los datos del alumno junto con el nombre de la carrera que sigue.
select a.legajo, a.apellido, a.nombre, a.fecha_nacimiento, a.mail, c.nombre carrera
from alumno a
inner join carrera c
on a.carrera = c.id;

-- 8. Listar los datos de los alumnos que no están inscriptos en ninguna materia.
select distinct a.legajo, a.apellido, a.nombre, a.fecha_nacimiento, a.mail
from alumno a
left join matricula m
on a.legajo = m.alumno
where m.alumno is null
order by a.legajo;

-- 9. Listar los nombres de las materias que no tienen alumnos inscriptos.
select nombre
from materia
where id IN (select c.materia 
            from curso c
            left join matricula m
            on c.id = m.curso
            where m.curso is null);

-- 10. Armar un listado de cada curso mostrando el nombre de la materia y los alumnos con su apellido, nombre, legajo, 
-- y condición ante la materia: P – ‘PROMOCIONADO’, R – ‘REGULAR’, L – ‘LIBRE’, A – ‘ABANDONO’.
select m.nombre, a.apellido, a.nombre, a.legajo,
case
    when PROMOCIONA = 'P' then 'PROMOCIONADO'
    when PROMOCIONA = 'R' then 'REGULAR'
    when PROMOCIONA = 'L' then 'LIBRE'
    when PROMOCIONA = 'A' then 'ABANDONO'
    else 'ERROR INGRESO'
end
promociona from matricula ma
inner join alumno a
on ma.alumno = a.legajo
inner join  curso c
on ma.curso = c.id
inner join materia m
on c.materia = m.id;

-- 11. No debe existir ningún libro cuyo precio supere los $13500. Controlarlos y si es necesario modificar esos registros.
update libro set precio = 13500 where precio > 13500;

-- 12. Aumentar $1000 el precio de cada libro y luego, los que sean inferiores a la media, aumentarlos en $1200.
update libro set precio = precio + 1000;
-- y luego, los que sean inferiores a la media, aumentarlos en $1200.
update libro set precio = precio + 1200 where precio < ( select avg(precio)from libro);

-- 13. Armar un listado de docentes indicando de cada uno su antigüedad.
select apellido, nombre, FLOOR(MONTHS_BETWEEN(SYSDATE,FECHA_ALTA)/12)
from profesor;

-- 14. Listar de cada docente la cantidad de cursos en los que está dictando clase.
select p.nombre, p.apellido, count(c.curso) cantidad_cursos
from profesor p
inner join cat_doc c
on p.id = c.docente
group by p.nombre, p.apellido;

-- 15. Listar los nombres de todos los profesores de cada curso, indicando el cargo que cada uno ejerce allí 
--ordenado por curso y dentro de cada curso por profesor.
select c.id curso_id, p.apellido apellido_profesor, p.nombre nombre_profesor, cat.descripcion categoria
from curso c
inner join cat_doc cd
on c.id = cd.curso
inner join profesor p 
on p.id = cd.docente
inner join categoria cat 
on cd.categoria = cat.codigo
order by c.id, p.apellido, p.nombre;

-- 16. Armar un listado de profesores en los que figuren los sueldos de cada docente existente, ordenados por Apellido. 
-- Tener en cuenta que el sueldo estará dado por el básico de cada categoría y la cantidad de cargos que cada profesor tenga asignados en la actualidad.
select p.apellido apellido_profesor, p.nombre nombre_profesor, SUM(cat.sueldo)
from curso c
inner join cat_doc cd
on c.id = cd.curso
inner join profesor p 
on p.id = cd.docente
inner join categoria cat 
on cd.categoria = cat.codigo
group by p.apellido, p.nombre
order by p.apellido;

