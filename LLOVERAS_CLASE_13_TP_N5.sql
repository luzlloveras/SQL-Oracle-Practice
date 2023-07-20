-- 2. Mediante una unión natural realizar las siguientes consultas:
-- a. Hacer un listado de todos los empleados mostrando su apellido, su nombre y la tarea que desempeña.
select e.apellido||', '||e.nombre empleado, t.titulo tarea
from empleados e
join tareas t
using(tarea_id);

-- b. Hacer un listado de todos los empleados mostrando su apellido, su nombre y el departamento en donde trabaja.
select e.apellido||', '||e.nombre empleado, d.nombre departamento
from empleados e
join departamentos d
using(dpto_id);

-- 3. Mediante un Inner Join realizar las siguientes consultas:
-- a. Hacer un listado de todos los empleados mostrando su apellido, su nombre y la tarea que desempeña.
select e.apellido||', '||e.nombre empleado, t.titulo tarea
from empleados e
join tareas t
on e.tarea_id = t.tarea_id;

-- b. Hacer un listado de todos los empleados mostrando su apellido, su nombre y el nombre del departamento en donde trabaja.
select e.apellido||', '||e.nombre empleado, d.nombre departamento
from empleados e
join departamentos d
on e.dpto_id = d.dpto_id;

-- 4. Realizar la Unión de las consultas de las Tablas protocolos e históricos.
select * from protocolos join historicos using(id); -- muestra todos los datos de ambas tablas

select id from protocolos union select id from historicos; -- muestra solo los id de ambas tablas

-- 5. Realizar la Intersección de las consultas de las Tablas protocolos e históricos.
select id from protocolos intersect select id from historicos;

-- 6. Realizar la consulta de sólo los elementos de A teniendo las consultas de las Tablas protocolos e históricos.
select id from protocolos minus select id from historicos;

-- 7. Realizar la consulta de sólo los elementos de B teniendo las consultas de las Tablas protocolos e históricos.
select id from historicos minus select id from protocolos;
-- 8. Armar un listado de cada uno de los empleados indicando cual es el gerente al cual responde.
select a.apellido||', '||a.nombre empleado, b.apellido||', '||b.nombre "Gerente" 
from empleados a 
join empleados b 
on a.gerente_id=b.id;

-- 9. Armar el listado jerárquico de cada uno de los empleados de la empresa.
select lpad(apellido||', '||nombre,length(apellido||', '||nombre)+(level*2)-2,'_') "GRAFICO" from empleados
start with id=100
connect by prior id = gerente_id;

-- 10. Armar el listado jerárquico de los empleados del departamento son código 90.
select lpad(apellido||', '||nombre,length(apellido||', '||nombre)+(level*2)-2,'_') "GRAFICO" from empleados
where dpto_id = 90
start with id=100
connect by prior id = gerente_id;

-- 11. Armar el listado jerárquico de los empleados del departamento de ‘IT’.
select lpad(e.apellido||', '||e.nombre,length(e.apellido||', '||e.nombre)+(level*2)-2,'_') "GRAFICO" from empleados e join departamentos d on e.dpto_id = d.dpto_id
where d.nombre = 'IT'
start with id=100
connect by prior id = gerente_id;

-- 12. Hacer un listado de los empleados de cada departamento indicando la tarea que cumple ordenado por Nombre del departamento.
select e.apellido||', '||e.nombre empleado, d.nombre departamento, t.titulo tarea
from empleados e 
join departamentos d
on e.dpto_id = d.dpto_id
join tareas t
on e.tarea_id = t.tarea_id
order by d.nombre;

-- 13. Crear una vista que permita listar los nombres y apellidos de cada uno de los empleados ordenados por departamentos y apellido, 
-- indicando el sueldo promedio que le corresponde a su tarea y el salario que recibe.
create or replace view w_lista_de_empleados_salarios as
select e.apellido||', '||e.nombre empleado, d.nombre departamento, t.titulo tarea, (t.salario_max + t.salario_min) / 2 sueldo_promedio, e.salario salario
from empleados e 
join departamentos d
on e.dpto_id = d.dpto_id
join tareas t
on e.tarea_id = t.tarea_id
order by d.nombre, e.apellido;

-- 14. Crear una vista que permita listar los nombres de cada uno de los departamentos con la cantidad de empleados que en ellos trabajan y el sueldo promedio de los empleados.
create or replace view w_lista_de_departamentos_salarios as
select d.nombre departamento, count(e.id) cantidad_empleados, avg(e.salario) salario_promedio
from departamentos d
join empleados e
on e.dpto_id = d.dpto_id
group by d.nombre;

-- 15. Crear una vista que permita listar los apellidos y nombres de cada uno de los empleados de la empresa indicando el nombre del departamento en el que trabajan y la tarea que allí desempeñan.
create or replace view w_lista_de_departamentos_tareas as
select e.apellido||', '||e.nombre empleado, d.nombre departamento, t.titulo tarea
from empleados e 
join departamentos d
on e.dpto_id = d.dpto_id
join tareas t
on e.tarea_id = t.tarea_id;