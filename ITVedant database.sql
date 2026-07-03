Use ITVedant;
Select count(*) from student;
set sql_safe_updates=0;
update Student
set stud_name= 'Pratik'
where stud_id=101;
delete from student
where stud_id=101;
select sum(age)from student;
select max(age) from student;
select min(age) from student;
select avg(age) from student;
select count(age) from student;
select sum(age),max(age),min(age),avg(age),count(age) from student;
select * from student;
 update student set stud_name="Sonu" where stud_id=103;
 update student set stud_name="Ajju" where stud_id=102;
 update student set stud_name="Ajay" where stud_id=102;
 update student set stud_name="Pratiksha" where stud_id=104;
 Select count(*) from student;
 select * from student where age>20;
 select * from student where stud_id<106;
 select * from student where stud_id<=102;
 select * from student where stud_id<>103;
 select * from student where stud_id = 102 and stud_name="Ajay";
 select * from student where stud_id = 102 and stud_name="Pratiksha";
 select * from student where stud_name = "Ajay" or stud_name = "Seema";
 select * from student where not stud_name = "Ajay";
 select * from student where stud_id=100 or stud_id=101 or stud_id=102 or stud_id=103 or stud_id=104;
 select * from student where stud_id in (100,101,102,103);
 use ITVedant;
 create table Employee_Info (
 emp_id int primary key auto_increment,
 emp_name varchar(20) not null,
 email varchar(40) unique,
 salary int check (salary between 15000 and 800000),
 city varchar(20) check (city in ('Mumbai', 'Pune', 'Nagpur','Nashik')),
 state varchar(20) default 'Maharashtra',
 created_at datetime default current_timestamp);
  create table EmpInfo
 (emp_id int,
 emp_name varchar(20),
 email varchar(40),
 salary int,
 city varchar(20));
 desc Employee_Info;
 alter table EmpInfo
 add constraint pk_id primary key(emp_id);
 
 alter table EmpInfo
 add constraint uk_email unique(email);
 
 alter table EmpInfo
 modify emp_name varchar(20) not null;
 
 desc EmpInfo;
 select* from Employee_Info;
 insert into Employee_Info(emp_name, email, salary, city,department) values ('Ditya', 'ditya@gmail.com', '18000', 'Mumbai','IT');
 insert into Employee_Info(emp_name, email, salary, city,department) values ('Sanika', 'sanika@gmail.com', '20000', 'Nashik','HR');
 insert into Employee_Info(emp_name, email, salary, city,department) values ('Harshada' , 'harshada@gmail.com', '20000', 'Nagpur','IT');
 insert into Employee_Info(emp_name, email, salary, city,department) values ('Renu', 'renu@1gmail.com','30000','Mumbai','HR');
 insert into Employee_Info(emp_name, email, salary, city,department) values ('Pratiksha', 'pratiksha@hmail.com','50000','Mumbai','IT');
  insert into Employee_Info(emp_name, email, salary, city,department) values ('Pooja', 'pooja@gmail.com','40000','Nashik','HR');
insert into Employee_Info(emp_name, email, salary, city,department) values ('Sheetal', 'sheetal@gmail.com','42000','Mumbai','Finance');
 update Employee_Info
 set emp_name='Priya' where emp_id=2;
 update Employee_Info
 set salary='21000' where emp_id=2;
 update Employee_Info
 set city='Pune' where emp_id=2;
 delete from Employee_Info where emp_id=2;
 delete from Employee_Info;
 truncate table Employee_Info;
 use ITVedant;
 update Employee_Info
 set department='IT' where emp_id=1;
 
select department, sum(salary) as Total from Employee_Info group by department order by Total desc;
#what if we want employee name and department average together?
select emp_name, salary, avg(salary) over () as average_salary from Employee_Info;

#with order partition
select emp_name, department, salary, avg(salary) over (partition by department) as dept_avg from Employee_Info;

#ROW NUMBER
select emp_name, salary, Row_number() over (order by salary desc) as row_num from Employee_Info;

#rank (Asc and desc)
select emp_name, salary, rank() over (order by salary asc) as rank_num from Employee_Info;

#denserank
select emp_name, salary, dense_rank() over (order by salary asc) as denserank_num from Employee_Info;

--------------------------------------
create table posts(
user_id int (20),
post_id int(20),
likes int(20),
user_total_likes int (50));
desc posts;
select* from posts;
alter table posts
drop column user_total_likes;
insert into posts (user_id,post_id,likes) values (1001,1211,500);
 insert into posts (user_id,post_id,likes) values (1002,400,250);
 insert into posts (user_id,post_id,likes) values (1003,100,120);
 insert into posts (user_id,post_id,likes) values (1004,200,110);
 truncate table posts;
 insert into posts (user_id,post_id,likes) values (101,1,10);
 insert into posts (user_id,post_id,likes) values (101,2,20);
 insert into posts (user_id,post_id,likes) values (102,3,15);
 insert into posts (user_id,post_id,likes) values (102,4,25);
 select * from posts;
 select user_id,post_id,likes,
 sum(likes) over (partition by user_id) as user_total_likes from posts;
 use ITVedant;
 
 ------------#string functions----------------
 
 select upper ('yadav');
 select concat ('Pratiksha',' ','Yadav');
 select length ('pratiksha');
 select now();
 select current_timestamp();
 use ITVedant;
 select left ('Database',4);
 select right ('Database',4);
 select substring('Hello',1,4); #extracting no of characters
 select replace ('MYSQL', 'M','B');
 select reverse('Pratiksha');
 select trim('          Pratiksha       ');
 -----------#math function--------------
 select round( 545.675,-2);
 select round (555,-3);
 select round (128.78,-2);
 select truncate (45.456,1);
 select truncate (45.456,-1);
 
 select * from Employee_Info;
select emp_id,emp_name,salary,if(salary>25000,'Award','No Award') from Employee_Info;

select greatest(10,20,5);
select least(20,52,13);
------------#comparison fucntions-----------------
select ifnull(null,0);
select nullif(15,15);
select coalesce(null,null,null,null,30);
---------------#date & time---------------------
select now();
select current_date();
select current_timestamp();
select curdate();
select timestampdiff(YEAR,'1999-07-08',curdate()) as Age;
select date_add(curdate(),interval 5 day);
select date_add(curdate(),interval 10 day);
select date_sub(curdate(),interval 5 day);
select date_sub(curdate(),interval 5 month); 
select date_sub(curdate(),interval 5 year); 
select day('2026-07-08');
select month('2026-07-08');
select year ('2026-07-08');

#display total no of employees along with employee details
select * from Employee_Info;
select emp_id,emp_name,email,department,count(emp_id) over() as TotalEmp from Employee_Info;
use ITVedant;
select concat('Data','Base');
SELECT SUBSTRING('Function', 1, 3);