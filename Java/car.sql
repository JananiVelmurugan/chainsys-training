-- table creation
create table CARS(id number(10),name varchar2(40));
-- record insertion
insert into CARS
values (1,'Benz');
insert into CARS
values (2,'BMW');
insert into CARS
values (3,'Audi');
-- permanent save
commit;
drop table cars;
select * from CARS;


-- table creation
create table CARS(speed number(10),model varchar2(40));
-- record insertion
insert into CARS
values (100,'Benz');
insert into CARS
values (200,'BMW');
insert into CARS
values (300,'Audi');
-- permanent save
commit;
drop table cars;
select * from CARS;
