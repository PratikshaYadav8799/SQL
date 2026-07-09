USE ITVedant;
create table Employees(
emp_id int,
emp_name varchar(30),
dept_id int);
create table Departments(
dept_id int,
dept_name varchar(50));
select * FROM Employees;
insert into Employees (emp_id, emp_name, dept_id) values (101, 'Amit', 1);
insert into Employees (emp_id, emp_name, dept_id) values (102, 'Priya', 2);
insert into Employees (emp_id, emp_name, dept_id) values (103, 'Rahul', 2);
insert into Departments (dept_id, dept_name) values (1,'HR'), (2,'IT'), (3,'Sales'), (4,'Finance');
select d.dept_id, d.dept_name from Departments d left join Employees e on d.dept_id;

---------------#DEPARTMENTS that have no employees------------
select d.dept_id, d.dept_name from Departments d left join Employees e on d.dept_id=e.dept_id where e.emp_id is null;