-- Creación de base de datos supermercado

create table supermercado;
\c supermercado

-- Importando tablas y datos

\i unidad2.sql

-- Req. 2 - Realizar una compra

begin transaction;
insert into compra (cliente_id, fecha) values (1, now());
insert into detalle_compra (producto_id, compra_id, cantidad) values (9, (select id from compra order by fecha limit 1), 5);
update producto set stock = stock - 5 where id = 9;
commit;

-- Req. 3 - Realizar 3 compras

begin transaction;
insert into compra (cliente_id, fecha) values (2, now());
insert into detalle_compra (producto_id, compra_id, cantidad) values (1, (select id from compra order by fecha limit 1), 3);
update producto set stock = stock - 3 where id = 1;
insert into detalle_compra (producto_id, compra_id, cantidad) values (2, (select id from compra order by fecha limit 1), 3);
update producto set stock = stock - 3 where id = 2;
insert into detalle_compra (producto_id, compra_id, cantidad) values (8, (select id from compra order by fecha limit 1), 3);
update producto set stock = stock - 3 where id = 8;
commit;

-- Req. 4 - Realizar operaciones en una transacción

begin transaction;
\set AUTOCOMMIT off

insert into cliente (nombre, email) values ('usuario011', 'usuario011@gmail.com');
select * from cliente;
rollback;

select * from cliente;
\set AUTOCOMMIT on

commit;


