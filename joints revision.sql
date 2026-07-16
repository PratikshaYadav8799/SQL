create database STUDENTS;
use STUDENTS;
create table T1(
id int,
name varchar(20));
create table T2(
id int,
email varchar(50));
create table T3(
id int,
name varchar (30));
create table T4(
cid int,
tid int,
mark int);
insert into T1 (id, name) values (1, 'Ajay'), (2,'Bhavesh'), (3,'Chirag'), (4,'Deepak'), (5,'Eira'), (6,'Falak');
insert into T2 (id, email) values (1, 'ajay@gamil.com'), (2,'abc@gmail.com'), (3,'def@gmail.com'), (7,'ghi@gamil.com'), (8,'jkl@gmail.com');
insert into T3 (id, cname) values (1, 'Economics'), (2,'Sociology'), (3,'Economics'), (9,'Sociology'), (10,'Biology');
insert into T4 (cid, tid, mark) values (1, 11, 100), (2, 12, 101), (3, 13, 100), (11, 14, 104), (12, 15, 104);
alter table T3
rename column name to cname;
desc T3;
alter table T3
rename column id to cid;

----------#joints------------
select name, email, cname, mark from T1 join T2 on T1.id=T2.id join T3 on T2.id=T3.cid join T4 on T3.cid=T4.cid;
use STUDENTS;
select name, email, cname, mark from T1 left join T2 on T1.id=T2.id left join T3 on T2.id=T3.cid left join T4 on T3.cid=T4.cid;
select name, email, cname, mark from T1 right join T2 on T1.id=T2.id right join T3 on T2.id=T3.cid right join T4 on T3.cid=T4.cid;
select T3.cname, T4.mark from T3 cross join T4;
select T1.name, T2.email from T1 cross join T2;
select * from T1 natural join T2;
