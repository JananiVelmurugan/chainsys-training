-- 23) Write a query which will display the customer id, customer name, account number, account type, interest, initial deposit;
-- check the initial deposit, if initial deposit is 20000 then display ""high"",if initial deposit is 16000 display 'moderate', 
-- if initial deposit is 10000 display 'average', if initial deposit is 5000 display 'low', if initial deposit is 0 display
-- 'very low' otherwise display 'invalid' and sort by interest in descending order.Hint: Name the column as ""Deposit_Status"" (alias). 
-- Strictly follow the lower case for strings in this query."
SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,INTEREST,INITIAL_DEPOSIT,
CASE
WHEN A.INITIAL_DEPOSIT=20000 THEN 'HIGH'
WHEN A.INITIAL_DEPOSIT=10000 THEN 'MODERATE'
ELSE 'INVALID'
END AS Deposit_Status
FROM ACCOUNT_INFO A,CUSTOMER_PERSONAL_INFO C
WHERE A.CUSTOMER_ID = C.CUSTOMER_ID
ORDER BY INTEREST DESC;
-- Write a query which will display customer id, customer name,  account number, account type, bank name, ifsc code, 
-- initial deposit amountand new interest amount for the customers whose name starts with ""J"". 
-- Hint:  Formula for calculating ""new interest amount"" is 
-- if customers account type is savings then add 10 % on current interest amount to interest amount else display the current interest amount.
-- Round the new interest amount to 2 decimals.<br/> 
-- Use ""NEW_INTEREST"" as alias name for displaying the new interest amount.
SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,BANK_NAME,A.IFSC_CODE,
INTEREST, INTEREST + (INTEREST*10/100) AS NEW_INTEREST
FROM ACCOUNT_INFO A,BANK_INFO B,CUSTOMER_PERSONAL_INFO C
WHERE A.IFSC_CODE=B.IFSC_CODE
AND A.CUSTOMER_ID=C.CUSTOMER_ID
AND CUSTOMER_NAME LIKE 'J%'
AND ACCOUNT_TYPE = 'SAVINGS';
-- Write a query which will display customer id, account number and passcode.
-- Hint:  To generate passcode, join the last three digits of customer id 
-- and last four digit of account number.
--#Example: C-001     1234567898765432     0015432. Use ""PASSCODE"" as alias name for displaying the passcode. 
SELECT CUSTOMER_ID,ACCOUNT_NO,
SUBSTR(CUSTOMER_ID,(LENGTH(CUSTOMER_ID)-2))
||
SUBSTR(ACCOUNT_NO,(LENGTH(ACCOUNT_NO)-3)) AS PASSCODE
FROM ACCOUNT_INFO;

-- MERGE
CREATE TABLE people_source ( 
  person_id  INTEGER NOT NULL PRIMARY KEY, 
  first_name VARCHAR2(20) NOT NULL, 
  last_name  VARCHAR2(20) NOT NULL, 
  title      VARCHAR2(10) NOT NULL 
);

CREATE TABLE people_target ( 
  person_id  INTEGER NOT NULL PRIMARY KEY, 
  first_name VARCHAR2(20) NOT NULL, 
  last_name  VARCHAR2(20) NOT NULL, 
  title      VARCHAR2(10) NOT NULL 
);

INSERT INTO people_target VALUES (1, 'John', 'Smith', 'Mr');
INSERT INTO people_target VALUES (2, 'alice', 'jones', 'Mrs');
INSERT INTO people_source VALUES (2, 'Alice', 'Jones', 'Mrs.');
INSERT INTO people_source VALUES (3, 'Jane', 'Doe', 'Miss');
INSERT INTO people_source VALUES (4, 'Dave', 'Brown', 'Mr');

COMMIT;
ROLLBACK;
MERGE INTO people_target pt 
USING people_source ps 
ON    (pt.person_id = ps.person_id) 
WHEN matched THEN UPDATE 
  SET pt.first_name = ps.first_name, 
      pt.last_name = ps.last_name, 
      pt.title = ps.title
WHEN NOT matched THEN INSERT 
  (pt.person_id, pt.first_name, pt.last_name, pt.title) 
  VALUES (ps.person_id, ps.first_name, ps.last_name, ps.title);
-------------------------------------------------------------------
-- WHO - RECORD HISTORY
CREATE TABLE WORKERS(
ID NUMBER(15),
NAME VARCHAR2(50),
CREATED_BY NUMBER(15) DEFAULT sys_context('userenv','session_USERID'),
CREATION_DATE DATE DEFAULT SYSDATE,
LAST_UPDATED_BY NUMBER(15) DEFAULT sys_context('userenv','session_USERID'),
LAST_UPDATE_DATE DATE DEFAULT SYSDATE,
LAST_UPDATE_LOGIN NUMBER(15) DEFAULT sys_context('userenv','sessionid')
);
INSERT INTO WORKERS(ID,NAME)
VALUES(1,'CHAINSYS');
UPDATE WORKERS
SET NAME='CHAINSYS CHN', LAST_UPDATE_DATE=SYSDATE+1
WHERE ID =1;
SELECT * FROM ALL_USERS;
SELECT * FROM USER_USERS;
SELECT SYSDATE FROM DUAL;
SELECT sys_context('userenv','session_USERID')
FROM DUAL;
SELECT sys_context('userenv','sessionid')
FROM DUAL;
----------------------------------------------------------
-- CALCULATE AVG INTEREST FOR EACH BANK - SUBQUERY IN SELECT
SELECT IFSC_CODE,
(SELECT AVG(INTEREST)
FROM ACCOUNT_INFO A1
WHERE A1.IFSC_CODE = A2.IFSC_CODE) AVG_INTEREST
FROM ACCOUNT_INFO A2
GROUP BY IFSC_CODE;
-- SUBQUERY IN FROM
SELECT IFSC_CODE,AVG_INTEREST
FROM
(
SELECT IFSC_CODE, (SELECT AVG(INTEREST)
FROM ACCOUNT_INFO A1
WHERE A1.IFSC_CODE = A2.IFSC_CODE) AVG_INTEREST
FROM ACCOUNT_INFO A2
GROUP BY IFSC_CODE
);
-- DISPLAY INTEREST RATE - SUBQUERY >
SELECT IFSC_CODE,INTEREST
FROM ACCOUNT_INFO
WHERE INTEREST > ANY
(
SELECT AVG(INTEREST) FROM ACCOUNT_INFO
GROUP BY IFSC_CODE
HAVING IFSC_CODE='HDVL0012'
);
-- SUBQUERY USING EXIST 
SELECT IFSC_CODE
FROM BANK_INFO B
WHERE EXISTS
(
SELECT * FROM ACCOUNT_INFO A 
WHERE A.IFSC_CODE = B.IFSC_CODE
)

-- =(SUBQUERY-> 1 VALUE)
-- >,<,>ANY,<ANY,>ALL,<ALL(SUBQUEY-> MORE THAN 1 VALUE)

