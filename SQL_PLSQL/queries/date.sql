drop table table_dt;
CREATE TABLE table_dt (c_id NUMBER, c_dt DATE);
INSERT INTO table_dt VALUES(1, '01-JAN-2003');
INSERT INTO table_dt VALUES(2, DATE '2003-01-01');
INSERT INTO table_dt VALUES(3, TIMESTAMP '2003-01-01 10:03:05 US/Pacific');
INSERT INTO table_dt VALUES(4, TO_DATE('01-JAN-2003', 'DD-MON-YYYY'));
SELECT * FROM table_dt;


drop table table_ts;
CREATE TABLE table_ts(c_id NUMBER, c_ts TIMESTAMP);
INSERT INTO table_ts VALUES(1, '01-JAN-2003 2:00:00');
INSERT INTO table_ts VALUES(2, TIMESTAMP '2003-01-01 2:00:00');
INSERT INTO table_ts VALUES(5, TIMESTAMP '2003-01-01 23:00:00');
INSERT INTO table_ts VALUES(5, TIMESTAMP '2003-01-01 13:00:00');
select * from table_ts;
create table dummy
(id number,
d_date date,
d_time timestamp
);
insert into dummy values(1,'01-JAN-2003','01-JAN-2021 10:00:00');
select * from dummy;
commit;