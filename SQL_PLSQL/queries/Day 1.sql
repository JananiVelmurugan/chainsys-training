-- Get User Name
SELECT USER FROM DUAL;

-- Create Table 

CREATE TABLE CUSTOMERS
(
ID NUMBER(10) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
LOCATION_ID NUMBER(10) NOT NULL,
CONSTRAINT CUSTOMERS_PK PRIMARY KEY(ID),
CONSTRAINT CUSTOMERS_FK FOREIGN KEY(LOCATION_ID) REFERENCES LOCATIONS(ID)
);

CREATE TABLE LOCATIONS
(
ID NUMBER(10) NOT NULL,
STREET VARCHAR2(50) NOT NULL,
CITY VARCHAR2(50) NOT NULL,
PINCODE NUMBER(6) NOT NULL,
CONSTRAINT LOCATIONS_PK PRIMARY KEY(ID)
);

DROP TABLE CUSTOMERS;


-- Get Database Name
select * from global_name;
select sys_context('userenv','db_name') from dual;
select ora_database_name from dual;