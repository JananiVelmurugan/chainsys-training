use bms_db;
select * from account_info;
select * from bank_info;
select * from customer_personal_info;
select * from customer_reference_info;
#1) Write a query which will display the customer id, account type they hold, their account number and bank name.
select a.customer_id,a.account_type,a.account_no,b.bank_name from account_info a,bank_info b where a.ifsc_code=b.ifsc_code;
# 2) Write a query which will display the customer id, account type and the account number of HDFC customers who registered after 12-JAN-2012 and before 04-APR-2012.
select customer_id,account_type,account_no,registration_date from account_info where ifsc_code=(select ifsc_code from bank_info where bank_name='HDFC') and registration_date>'2012-01-12' and registration_date<'2012-04-04';
# 3) Write a query which will display the customer id, customer name, account no, account type and bank name where the customers hold the account.
select a.customer_id,b.customer_name,a.account_no,a.account_type,c.bank_name from account_info a,customer_personal_info b,bank_info c where a.customer_id=b.customer_id and a.ifsc_code=c.ifsc_code;
# 4)Write a query which will display the customer id, customer name, gender, marital status along with the unique reference string and sort the records based on customer id in descending order.
#Hint:Generate unique reference string as mentioned below.CustomerName_Gender_MaritalStatus. Use ""UNIQUE_REF_STRING"" as alias name for displaying the unique reference string."
select customer_id,customer_name,gender,marital_status,concat(customer_name,'_',gender,'_',marital_status) as UNIQUE_REF_STRING from customer_personal_info;
# 5) Write a query which will display the account number, customer id, registration date, initial deposit amount of the customer whose initial deposit amount is within the range of Rs.15000 to Rs.25000.
select account_no,customer_id,registration_date,initial_deposit from account_info where initial_deposit between 15000 and 25000;
#6) Write a query which will display customer id, customer name, date of birth, guardian name of the customers whose name starts with 'J'.
select a.customer_id,b.customer_name,b.date_of_birth,b.guardian_name from account_info a,customer_personal_info b where a.customer_id=b.customer_id and b.customer_name like 'J%';
#7) Write a query which will display customer id, account number and passcode. Hint:  To generate passcode, join the last three digits of customer id and last four digit of account number.
#Example: C-001     1234567898765432     0015432. Use ""PASSCODE"" as alias name for displaying the passcode."
select customer_id,account_no,concat(substring(customer_id,(length(customer_id)-2)),substring(cast(account_no as char),length(cast(account_no as char))-3)) as PASSCODE from account_info;
#8) Write a query which will display the customer id, customer name, date of birth, Marital Status, Gender, Guardian name, contact no and email id of the customers whose gender is male 'M' and marital status is MARRIED.
select customer_id,customer_name,date_of_birth,marital_status,gender,guardian_name,contact_no,mail_id from customer_personal_info where gender='M' and marital_status='MARRIED';
#9) Write a query which will display the customer id, customer name, guardian name, reference account holders name of the customers who are referenced / referred by their 'FRIEND'.
select a.customer_id,a.customer_name,a.guardian_name,b.reference_acc_name from customer_personal_info a,customer_reference_info b where a.customer_id=b.customer_id and b.relation='FRIEND';
#10) Write a query to display the customer id, account number and interest amount in the below format with INTEREST_AMT as alias name.Sort the result based on the INTEREST_AMT in ascending order.
#Hint: Need to prefix $ to interest amount and round the result without decimals.
select customer_id,account_no,concat('$',cast(round(interest) as char)) as INTEREST_AMT from account_info order by INTEREST_AMT;
#11) Write a query which will display the customer id, customer name, account no, account type, activation date,bank name whose account will be activated on '10-APR-2012'
select a.customer_id,b.customer_name,a.account_no,a.account_type,a.activation_date,c.bank_name from account_info a,customer_personal_info b,bank_info c where a.customer_id=b.customer_id and a.ifsc_code=c.ifsc_code and a.activation_date='2012-04-10';
#12) Write a query which will display account number, customer id, customer name, bank name, branch name, ifsc code,citizenship, interest and initial deposit amount of all the customers.
select a.account_no,a.customer_id,b.customer_name,c.bank_name,c.branch_name,a.ifsc_code,b.citizenship,a.interest,a.initial_deposit from account_info a,customer_personal_info b,bank_info c where a.customer_id=b.customer_id and a.ifsc_code=c.ifsc_code;
#13) Write a query which will display customer id, customer name, date of birth, guardian name, contact number,mail id and reference account holder's name of the customers who has submitted the passport as an identification document.
select a.customer_id,a.customer_name,a.date_of_birth,a.guardian_name,a.contact_no,a.mail_id,b.reference_acc_name from customer_personal_info a,customer_reference_info b where a.customer_id=b.customer_id and a.identification_doc_type='PASSPORT';
#14) Write a query to display the customer id, customer name, account number, account type, initial deposit,interest who have deposited maximum amount in the bank.
select a.customer_id,b.customer_name,a.account_no,a.account_type,a.initial_deposit,a.interest from account_info a,customer_personal_info b where a.customer_id=b.customer_id and a.initial_deposit=(select max(initial_deposit) from account_info);
#15) Write a query to display the customer id, customer name, account number, account type, interest, bank name and initial deposit amount of the customers who are getting maximum interest rate.
select a.customer_id,b.customer_name,a.account_no,a.account_type,a.interest,c.bank_name,a.initial_deposit from account_info a,customer_personal_info b,bank_info c where a.customer_id=b.customer_id and a.ifsc_code=c.ifsc_code and interest=(select max(interest) from account_info);
#16) Write a query to display the customer id, customer name, account no, bank name, contact no and mail id of the customers who are from BANGALORE.
select a.customer_id,b.customer_name,a.account_no,c.bank_name,b.contact_no,b.mail_id from account_info a,customer_personal_info b,bank_info c where a.customer_id=b.customer_id and a.ifsc_code=c.ifsc_code and b.address like '%BANGALORE';
#17) Write a query which will display customer id, bank name, branch name, ifsc code, registration date,activation date of the customers whose activation date is in the month of march (March 1'st to March 31'st).
select a.customer_id,b.bank_name,b.branch_name,b.ifsc_code,a.registration_date,a.activation_date from account_info a,bank_info b where a.ifsc_code=b.ifsc_code and extract(month from a.activation_date)=03;
#18) Write a query which will calculate the interest amount and display it along with customer id, customer name, account number, account type, interest, and initial deposit amount.
#calculate: ((interest/100) * initial deposit amt) with column name 'interest_amt' (alias)
select a.customer_id,b.customer_name,a.account_no,a.account_type,a.interest,a.initial_deposit,((a.interest/100)*a.initial_deposit) as interest_amt from account_info a,customer_personal_info b where a.customer_id=b.customer_id;
#19) Write a query to display the customer id, customer name, date of birth, guardian name, contact number, mail id, reference name who has been referenced by 'RAGHUL'.
select a.customer_id,a.customer_name,a.date_of_birth,a.guardian_name,a.contact_no,a.mail_id,b.reference_acc_name from customer_personal_info a,customer_reference_info b where a.customer_id=b.customer_id and b.reference_acc_name='RAGHUL';
#20) Write a query which will display the customer id, customer name and contact number with ISD code of all customers in below mentioned format.  Sort the result based on the customer id in descending order. 
#Format for contact number is :  ""+91-3digits-3digits-4digits""Example: +91-924-234-2312Use ""CONTACT_ISD"" as alias name."
select a.customer_id,b.customer_name,concat('+91-',substring(cast(b.contact_no as char),1,3),'-',substring(cast(b.contact_no as char),4,3),'-',substring(cast(b.contact_no as char),7)) as CONTACT_ISD from account_info a,customer_personal_info b where a.customer_id=b.customer_id;
#21) Write a query which will display account number, account type, customer id, customer name, date of birth, guardian name,contact no, mail id , gender, reference account holders name, reference account holders account number, registration date, 
#activation date, number of days between the registration date and activation date with alias name "NoofdaysforActivation", bank name, branch name and initial deposit for all the customers.
select a.account_no,a.account_type,a.customer_id,b.customer_name,b.date_of_birth,b.guardian_name,b.contact_no,b.mail_id,b.gender,c.reference_acc_name,c.reference_acc_no,a.registration_date,a.activation_date,
datediff(a.activation_date,a.registration_date) as NoofdaysforActivation,d.bank_name,d.branch_name,a.initial_deposit from account_info a,customer_personal_info b,customer_reference_info c,bank_info d where
a.customer_id=b.customer_id and b.customer_id=c.customer_id and a.ifsc_code=d.ifsc_code;
#22) Write a query which will display customer id, customer name,  guardian name, identification doc type,reference account holders name, account type, ifsc code, bank name and current balance for the customers who has only the savings account. 
#Hint:  Formula for calculating current balance is add the intital deposit amount and interest and display without any decimals. Use ""CURRENT_BALANCE"" as alias name."
select a.customer_id,b.customer_name,b.guardian_name,b.identification_doc_type,c.reference_acc_name,a.account_type,a.ifsc_code,d.bank_name,a.interest+a.initial_deposit as CURRENT_BALANCE from account_info a,customer_personal_info b,customer_reference_info c,bank_info d where a.customer_id=b.customer_id and a.customer_id=c.customer_id and a.ifsc_code=d.ifsc_code and a.account_type='SAVINGS';
#23) Write a query which will display the customer id, customer name, account number, account type, interest, initial deposit;check the initial deposit, if initial deposit is 20000 then display ""high"",if initial deposit is 16000 display 'moderate', if initial deposit is 10000 display 'average', if initial deposit is 5000 display 'low', if initial deposit is 0 display
#'very low' otherwise display 'invalid' and sort by interest in descending order.Hint: Name the column as ""Deposit_Status"" (alias). 
#Strictly follow the lower case for strings in this query."
select a.customer_id,b.customer_name,a.account_no,a.account_type,a.interest,a.initial_deposit,
case
when a.initial_deposit=20000 then 'High'
when a.initial_deposit=16000 then 'Moderate'
when a.initial_deposit=10000 then 'Average'
when a.initial_deposit=16000 then 'Low'
when a.initial_deposit=20000 then 'Very Low'
else 'invalid'
end
as Deposit_status from account_info a,customer_personal_info b where a.customer_id=b.customer_id;
#24) Write a query which will display customer id, customer name,  account number, account type, bank name, ifsc code, initial deposit amountand new interest amount for the customers whose name starts with ""J"". Hint:  Formula for calculating ""new interest amount"" is 
#if customers account type is savings then add 10 % on current interest amount to interest amount else display the current interest amount.Round the new interest amount to 2 decimals.<br/> Use ""NEW_INTEREST"" as alias name for displaying the new interest amount.
select a.customer_id,b.customer_name,a.account_no,a.account_type,c.bank_name,a.ifsc_code,a.initial_deposit,a.interest+(a.interest*10/100) as NEW_INTEREST from account_info a,customer_personal_info b,bank_info c where a.customer_id=b.customer_id and a.ifsc_code=c.ifsc_code and b.customer_name like 'J%' and a.account_type='SAVINGS';
#25) Write query to display the customer id, customer name, account no, initial deposit, tax percentage as calculated below.
#Hint:If initial deposit = 0 then tax is '0%'.If initial deposit <= 10000 then tax is '3%' 
#If initial deposit > 10000 and initial deposit < 20000 then tax is '5%'.If initial deposit >= 20000 andinitial deposit <=30000 then tax is '7%'.If initial deposit > 30000 then tax is '10%'.Use the alias name 'taxPercentage'
select a.customer_id,b.customer_name,a.account_no,a.initial_deposit,
case
when a.initial_deposit=0 then 0
when a.initial_deposit<=10000 then a.initial_deposit*3/100
when a.initial_deposit>10000 and a.initial_deposit<20000 then a.initial_deposit*5/100
when a.initial_deposit>=20000 and a.initial_deposit<=30000 then a.initial_deposit*7/100
else a.initial_deposit*10/100
end
as taxpercentage from account_info a,customer_personal_info b where a.customer_id=b.customer_id;
