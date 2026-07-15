-----------#subqueies-------------

use ITVedant;

---------#employes earning more than average salary-------------
select * FROM Employee_Info where salary>(select avg(salary) from Employee_Info);
select avg(salary) from Employee_Info;

--------#department having highest average salary----------
select * from(select department, avg(salary) as avg_salary from Employee_Info group by department) as dept order by avg_salary desc limit 1;
select * from(select department, avg(salary) as avg_salary from Employee_Info group by department) as dept order by avg_salary;

create table Department(
dept_id int,
dept_name varchar(20),
salary decimal(10,2));
insert into Department values(11, 'HR', '80000'), (12, 'Sales', '90000'), (13, 'Finance', '50000'), (14, 'HR', '75000'), (15, 'Sales', '80000');
update Employee_Info set salary=(select salary from Department where dept_id=12)where emp_id=3;

--------#correlatedquery------------------
----------#max salary from dept-------------
select max(salary) from Department where salary<(select max(salary) from Department);

----------#employess earning more than average salary of their department------------
select emp_name, department, salary from Employee_Info e1 where salary>(select avg(salary) from Employee_Info e2 where e2.department=e1.department);

---------#employess maximum salary department-wise---------
select emp_name, department, salary from Employee_Info e1 where salary>=(select max(salary) from Employee_Info e2 where e2.department=e1.department);

---------#employees minimum salary department-wise---------
select emp_name, department, salary from Employee_Info e1 where salary<=(select min(salary) from Employee_Info e2 where e2.department=e1.department);


