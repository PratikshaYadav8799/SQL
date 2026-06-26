create database BankingDB;
use BankingDB;
create table customers (
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
describe customers;
describe Accounts;
use BankingDB;
alter table customers
add DOB date;
alter table customers
change column lastname surname varchar (20);
describe customers;
alter table customers
drop column email;
alter table customers
rename to email;
alter table email
rename to customers;
alter table customers
modify phone varchar(20);
alter table customers
rename to custInfo;
describe custInfo;
alter table custInfo
add age int after surname;