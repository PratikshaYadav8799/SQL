CREATE database ITVedant;
Use ITVedant;
CREATE TABLE student (
    stud_id INT,
    stud_name VARCHAR(20),
    age INT,
    email VARCHAR(30)
);
Insert into student values (101,'Pratiksha',26,'pratikshayadav649@gmail.com');
Insert into student values (102,'Ajay',29,'ajayyadav01@gmail.com');
Insert into student values (103,'Jay',22,'jaykumar01@gmail.com');
Insert into student values (104,'Vijay',26,'vijaykumar01@gmail.com');
Insert into student values (105,'Seema',32,'seema01@gmail.com');
SELECT * FROM student;