-- table creation
create table employee(id number(10),name varchar2(40));
-- record insertion
insert into employee
values (1,'Sugirtha');
insert into employee
values (2,'Roahinth');
insert into employee
values (3,'Ajith');
-- permanent save
commit;
drop table employee;
select * from employee;
