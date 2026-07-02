CREATE database BANKDB;
Use BANKDB;
CREATE TABLE CUSTOMERS(
customer_id int primary KEY,
firstname varchar (50),
lastname varchar (50),
email varchar (100),
phone varchar(15),
accountcreationdate date);
Create Table Accounts (
AccountID INT primary KEY,
customer_id int,
AccountType varchar(20),
Balance Decimal (10,2),
foreign key (customer_id) references Customers (customer_id) );
create table transactions (
Transaction_ID int primary key,
AccountID int,
Transaction_Date date,
Amount Decimal (10,2),
Transaction_Type varchar (20),
foreign key (AccountID) references Accounts (AccountID) );
create table branches (
Branch_ID int PRIMARY KEY,
Branch_Name varchar (100),
Branch_Address varchar (200),
Branch_Phone varchar(15) );
create table accountbranches (
AccountID int,
Branch_ID int,
Assignment_Date date,
foreign key (AccountID) references Accounts(AccountID),
foreign key (Branch_ID) references Branches(Branch_ID) );
create table loans (
Loan_ID int PRIMARY KEY,
customer_id int,
Loanamount decimal(10,2),
Interestrate Decimal(5,2),
Startdate date,
Enddate date,
foreign key (customer_id) references customers (customer_id) );
desc CUSTOMERS;
desc accounts;
use BANKDB;
alter table customers
add DOB DATE;
alter table customers
change column lastname surname varchar (20);
alter table customers
drop column accountcreationdate;
alter table customers
add  accountcreationdate date;
alter table customers
rename to cust;
alter table cust
rename to customers;
alter table customers
modify phone varchar (20);
alter table customers
add age int after surname;
use BANKDB;
desc customers;
create table c_info (
cust_id int,
cust_name varchar (20) not null,
email varchar (50) unique,
amount_dep decimal check (amount_dep between 10000 and 100000),
branch varchar (20) check (branch in ('Kalyan','Goregaon','Malad','Naigaon','Andheri')),
state varchar (30) default 'Maharashtra',
created_at datetime default current_timestamp);
desc c_info;
create table cust_info(
cust_id int auto_increment primary key,
cust_name  varchar(30),
email varchar (40),
amount_dep decimal (10,2),
branch varchar (20));
alter table cust_info
add constraint uk_email unique (email);
alter table cust_info
modify cust_name varchar (30) not null;
select * from CUSTOMERS;
insert into CUSTOMERS values(101,'Ram','Singh',28,'ram@gmail.com',9090909090,'1999-08-13','2020-01-19');
insert into CUSTOMERS values(102,'Shyam','Sharma',21,'shyam@gmail.com',8080808080,'2000-02-14','2011-10-01');
insert into CUSTOMERS values(103,'Karan','Kappor',35,'karan@gmail.com',7070707070,'1996-05-11','2008-01-15');
insert into CUSTOMERS values(104,'Arjun','Shinde',31,'arjun@gmail.com',6060606060,'1999-07-08','2020-02-12');
insert into CUSTOMERS values(105,'Sneha','Kadam',21,'sneha@gmail.com',5050505050,'2022-02-12','2023-01-01');
insert into CUSTOMERS values(106,'Kajal','Yadav',24,'kajal@gmail.com',4040404040,'2023-03-17','2009-11-11');
insert into CUSTOMERS values(107,'Sejal','Shrivastava',29,'sejal@gmail.com',3030303030,'1997-06-13','2008-07-06');
select *from Accounts;
insert into Accounts values (201,101,'Savings','30000');insert into Accounts values (202,102,'Current','15000');
insert into Accounts values (203,103,'Savings','2000');insert into Accounts values (204,104,'Current','12000');
insert into Accounts values (205,105,'Current','9090');insert into Accounts values (206,106,'Savings','1202');
insert into Accounts values (207,107,'Current','25000');
select * from transactions;
insert into transactions values (301,201,'2026-02-12','1200','Withdrawal');
insert into transactions values (302,202,'2026-06-29','5000','Deposit'),(303,203,'2025-11-12','500','Withdrawal'),
(304,204,'2026-05-05','700','Withdrawal'),(305,205,'2025-12-12','10000','Deposit'),(306,206,'2025-08-08','1500','Withdrawal'),
(307,207,'2026-07-01','6000','Deposit');
select * from branches;
insert into branches values (501,'Kalyan','Kalyan East',50505050),(502,'Ulhasnagar','Ulhasnagar West',20202020),
(503,'Kalyan','Kalyan East',50505050),(525,'Goregaon','Goregaon East',10101010),(526,'','Malad East',30303030);
select * from accountbranches;
insert into accountbranches values (201,501,'2026-02-12');
insert into accountbranches values (202,502,'2021-01-17'),(203,503,'2020-12-12'),(204,525,'2020-11-11'),(205,526,'2022-12-12'),
(206,525,'2025-12-11'),(207,501,'2023-09-12');
select * from loans;
insert into loans values (701,101,150000,15, '2025-12-12','2050-12-12');
insert into loans values (702,102,200000,7, '2021-10-15','2050-10-15'),(703,104,500000,10, '2026-02-02','2052-02-02'),(704,105,100000,12, '2020-11-12','2030-11-12'),(705,106,150000,11, '2018-05-05','2028-05-05'),
(706,106,250000,9, '2025-12-10','2050-12-10'), (107,107,300000,7, '2024-12-12','2048-12-12');

# write a query to display specific column name from customers
select customer_id,age from CUSTOMERS;

#ORDER BY CLAUSE
select * from CUSTOMERS
order by firstname;
select * from CUSTOMERS
order by firstname asc;
desc CUSTOMERS;
show columns from customers;
select* from cust_Info;

#group by clause
select AccountType, SUM(balance)as Total from Accounts
group by AccountType;

# write a query to view only (limit)not whole table
select* from CUSTOMERS limit 3;

#--offset------
select * from CUSTOMERS limit 3 offset 2;

#having clause
select branch, sum(amount_dep) as Total from CUSTOMERS
group by branch having sum(amount_dep)>=100000;

#like (wildcard)
select* from CUSTOMERS
where firstname like 'K%';

select* from CUSTOMERS
where firstname like '%N';

# LETTER CAN BE ANYWHERE
select* from CUSTOMERS
where firstname like '%H%';

# start with any single character at 2nd place must be 'a' and end with any letter
select* from CUSTOMERS
where firstname like '_a%';

desc cust_info;
insert into cust_info(cust_id,cust_name,email) values (111,'Sanika','sanika@gmail.com');
select* from cust_info;

# find customers without and with email address
select* from cust_info where email is null;
select* from cust_info where email is not null;

#display all accounts where balance info is available
insert into Accounts (AccountID,customer_id,AccountType) values (211,111,'Savings');
select * from Accounts where balance is not null;

#display customers sorted by lastname
select* from CUSTOMERS order by surname;

# retrieve top 5 transactions with highest amount
select * from transactions;
select * from transactions order by Amount desc limit 5;

# display unique transaction types
select distinct Transaction_Type from transactions;

#skip the 3 transactions records and display other next 4 records
select * from transactions limit 4 offset 3;

