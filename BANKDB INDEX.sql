use BankDB;
show indexes from Customers;
create index idx_name on Customers(firstname);
create unique index idx_id on Customers(phone);
drop index idx_name on Customers;
show indexes from Accounts;
create unique index idx_name on Accounts(AccountType);
create unique index idx_name on Accounts(customer_id);
alter table Customers
add unique index idx(firstname);
explain select * from Customers where firstname ='Shyam';
alter table Customers
alter index idx invisible;
explain select * from Customers where firstname='Ram';