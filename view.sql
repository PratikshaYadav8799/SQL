use BANKDB;
create view vw_CUSTOMERS as select customer_id, firstname, surname, email from CUSTOMERS;
select * from vw_CUSTOMERS;
insert into vw_CUSTOMERS values (108, 'Pooja', 'Mishra', 'pooja@gamil.com');
update vw_CUSTOMERS
set firstname='Manisha', surname='Yadav' where customer_id=108;
delete from vw_CUSTOMERS where customer_id='108';

-----------#concat------------
create view vw1_CUSTOMERS as
select customer_id, concat (firstname,' ', surname) as name, age, email from CUSTOMERS;
select * from vw1_CUSTOMERS;
insert into vw1_CUSTOMERS values (108, 'Adarsh Singh', 26, 'adarsh@gmail.com');
update vw1_CUSTOMERS
set email='ssr@gmail.com' where customer_id=107;
delete from vw1_CUSTOMERS where customer_id=107;

------------#modification of existingname-----------
alter view vw1_CUSTOMERS as
select customer_id, firstname, email from CUSTOMERS;

create or replace view vw1_CUSTOMERS as
select customer_id, firstname, email, age, phone, DOB from CUSTOMERS;

use BANKDB;
select*from Transactions;
create or replace view vw_transactions as
select Transaction_Type, sum(Amount) as Total from Transactions group by Transaction_Type order by sum(Amount);
select * from vw_Transactions;

select * from Loans;
create or replace VIEW vw_Loans as
select Loan_ID, Loanamount, Interestrate, Startdate from Loans where Loan_ID>704;
select * from vw_Loans;

use ITVedant;
create or replace view vw_Employees as select d.dept_id, d.dept_name from Departments d left join Employees e on d.dept_id;
select * from vw_Employees;

update vw_Employees
set dept_name='Sales' where dept_id='1';

create or replace VIEW vw_Loans as
select Loan_ID, Loanamount, Interestrate, Startdate from Loans where Loan_ID>702 with check option;

create or replace VIEW vw_Loans as
select Loan_ID, Loanamount, Interestrate, Startdate from Loans where Loan_ID>702;
insert into vw_Loans values (700, 1000000, 8.00,'2021-01-01');
