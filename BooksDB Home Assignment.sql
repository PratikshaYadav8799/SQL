create database BOOKSDB;
use BOOKSDB;
create table Books(
BookId int primary key,
Title varchar (100) not null,
Author varchar(50) not null,
Category varchar (30),
Price decimal (8,2), check (price>0),
Quantity int default '0',
PublishedYear int,
ISBN varchar (20) unique);
select * from Books;
create table Members(
MemberID int primary key,
MemberName varchar (50) not null,
Email varchar (100) unique,
Phone varchar (15),
City varchar (30) default 'Mumbai',
JoinDate Date not null);
select * from Members;
Insert into Books(BookID, Title, Author, Category, Price,Quantity, PublishedYear, ISBN) VALUES
(1, 'The Silent Forest', 'R.K. Sharma', 'Fiction', 450, 20, 2020, '9780000000001'),
(2, 'Learning SQL', 'John Smith', 'Education', 850, 15, 2021, '9780000000002'),
(3, 'The Space Journey', 'Emily Clark', 'Science', 1200, 10, 2019, '9780000000003'),
(4, 'Mystery House', 'David Brown', 'Fiction', 600, 25, 2018, '9780000000004'),
(5, 'Python Basics', 'Sarah Johnson', 'Education', 950, 18, 2022, '9780000000005'),
(6, 'Stars and Beyond', 'Michael Lee', 'Science', 1400, 12, 2023, '9780000000006'),
(7, 'Hidden Truth', 'Anita Desai', 'Fiction', 700, 30, 2021, '9780000000007'),
(8, 'Database Systems', 'Thomas Green', 'Education', 1100, 8, 2020, '9780000000008'),
(9, 'Nature Wonders', 'Priya Mehta', 'History', 500, 22, 2017, '9780000000009'),
(10, 'The Last Kingdom', 'Arun Patel', 'History', 1300, 14, 2024, '9780000000010');
insert into Members(MemberID, MemberName, Email, Phone, City, JoinDate) values
(1, 'Aarav Sharma', 'aarav.sharma@gmail.com', '9876543210', 'Mumbai', '2024-01-15'),
(2, 'Priya Mehta', 'priya.mehta@gmail.com', '9876543211', 'Pune', '2024-02-10'),
(3, 'Rohan Patel', 'rohan.patel@gmail.com', '9876543212', 'Ahmedabad', '2024-03-05'),
(4, 'Sneha Verma', 'sneha.verma@gmail.com', '9876543213', 'Delhi', '2024-04-20'),
(5, 'Vikram Singh', 'vikram.singh@gmail.com', '9876543214', 'Jaipur', '2024-05-12'),
(6, 'Neha Joshi', 'neha.joshi@gmail.com', '9876543215', 'Nagpur', '2024-06-08'),
(7, 'Karan Gupta', 'karan.gupta@gmail.com', '9876543216', 'Bengaluru', '2024-07-18'),
(8, 'Ananya Rao', 'ananya.rao@gmail.com', '9876543217', 'Hyderabad', '2024-08-25');
set sql_safe_updates=0;
update Books
set Price= Price*1.10 where category = 'Education';
update Books
set Quantity=5 where BookID=5;
update Books
set Quantity=50 where BookID=5;
update Members
set city='Pune' where MemberID=4;
update Members
set email ='priyam@gmail.com' where MemberID=2;
delete from Books 
where BookID=9;
delete from Books
where Quantity=0;
delete from Members
where JoinDate < '2022-01-01';
alter table Books
add Language varchar(20) after Category;
alter table Books
add Publisher varchar(50) after Quantity;
alter table Books
modify Title varchar(150);
alter table Books 
rename column Quantity to Stock;
alter table Books
drop column Language;
select * from LibraryBooks;
alter table Books
rename to LibraryBooks;
alter table LibraryBooks
rename to Books;
create table Employees(
Employee_ID int primary key,
Name varchar (50) not null,
Email varchar (100) unique,
Salary decimal (10,2) check (salary >=15000),
Department varchar (20) default 'HR',
Manager_ID int, 
constraint FK_Manager 
foreign key(Manager_ID) references Employees (Employee_ID));
select* from Books;
select count(*) as TotalBooks from Books;
select avg(Price) as Average_Price from Books;
select max(Price) as highest_price from Books;
select min(Price) as lowest_price from Books;
select sum(Stock) as Total_Stock from Books;
select sum(Price) as Total_Eduaction_Price from Books where category ='Education';
select category, count(*) as BookCount From Books Group by Category;
select category, avg (Price) as Average_Price from Books Group by Category;
select category, max(Price) as Highest_Price from Books Group by Category;
select category, count(*) as Book_Count from Books group by Category having count(*)>2;
select * from Books;
select Title from Books;
select Title, Price from Books;
select *from Books where Price >500;
select * from Books where Price between 500 and 1000;
select * from Books where category = 'Education';
select * from Books Order by Price desc;
select * from Books limit 5;
select * from Books where PublishedYear>2020;
select * from Books where Title Like 'J%';
select * from Books where Title Like 'T%';
select * from Books where Author Like '%Kumar';
select * from Books where Author Like '%Sharma';
select * from Books order by Price desc limit 1 offset 1;
select Category, Count(*) as TotalBooks from Books group by category having count(*)>1;
select * from Books order by Price desc limit 3;
select avg (Price) as Average_Price from Books where PublishedYear>2020;
select category, avg(Price) as Average_Price from Books group by category having avg(Price)>800;
select row_number() over (order by Price asc) as RowNum, BookID, Title, Price from Books;
select Category, Title, Price, row_number() over (partition by category order by Price desc) as Row_num from Books;
select BookID, Title, Category, Price, rank() over (order by Price desc) as Price_Rank from Books;
select BookID, Title, Category, Price, rank() over (partition by Category order by Price desc) as Price_Rank from Books;
With RankedBooks as (select BookID, Title, Category, Price, rank() over (order by  Price desc) as PriceRank
from Books )
select BookID, Title, Category, Price, PriceRank
from RankedBooks
where PriceRank <= 3;
With RankedBooks as (select BookID, Title, Category, Price, rank() over (partition by Category order by Price desc) as PriceRank
from Books )
select BookID, Title, Category, Price, PriceRank
from RankedBooks
where PriceRank <= 3;
With RankedBooks as (select BookID, Title, Category, Price, rank() over (partition by Category order by Price desc) as PriceRank
from Books )
select BookID, Title, Category, Price, PriceRank
from RankedBooks
where PriceRank = 2;
select BookID, Title, Category, Price, dense_rank () over (order by Price desc) as PriceRank from Books;
With RankedBooks as (select BookID, Title, Category, Price, dense_rank() over (order by Price desc) as PriceRank
from Books )
select BookID, Title, Category, Price
from RankedBooks
where PriceRank = 2;
with RankedBooks as ( select BookID, Title, Category, Price, dense_rank() over (partition by Category order by Price desc) as PriceRank
    from Books)
select BookID, Title, Category, Price, PriceRank
from RankedBooks
where PriceRank <= 2;
select BookID, Title, Price, rank() over (order by Price desc) as RankValue, dense_rank() over (order by Price desc) AS DenseRankValue
from Books;