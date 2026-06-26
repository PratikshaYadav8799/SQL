create database flipkart_db;
use flipkart_db;
create table customers(
customer_id int primary key auto_increment,
customer_name varchar(100) not null,
email varchar(100) unique,
phone varchar(15),
city varchar(50),
state varchar(50) );
create table categories (
category_id int primary key auto_increment,
category_name varchar(50) not null);
create table sellers(
seller_id int primary key auto_increment,
seller_name varchar(100) not null,
seller_rating decimal (3,2) );
create table products(
product_id int primary key auto_increment,
product_name varchar(100) not null,
category_id int,
seller_id int,
price decimal(10,2),
stock_quantity int,
foreign key(category_id)references categories(category_id),
foreign key(seller_id)references sellers(seller_id) );
create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
total_amount decimal(10,2),
order_status varchar(30),
foreign key (customer_id)references customers(customer_id) );
create table payments (
payment_id int primary key auto_increment,
order_id int,
payment_method varchar(50),
payment_status varchar(30),
payment_date date,
foreign key (order_id) references orders(order_id) );
create table order_items(
order_item_id int primary key auto_increment,
order_id int,
product_id int,
quantity int,
unit_price decimal(10,2),
foreign key(order_id) references orders (order_id),
foreign key(product_id) references products (product_id) );
describe order_items;