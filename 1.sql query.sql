create database Employee;
use Employee;
create table employees(emp_no int not null auto_increment,
birth_date date not null,first_name varchar(14) not null, 
last_name varchar(16) not null,gender enum('M','F') not null,
hire_date date not null,primary key (emp_no));

create table salaries(emp_no int not null,
salary int not null,from_date date not null,
to_date date not null,key (emp_no),
foreign key (emp_no) references employees (emp_no),
primary key(emp_no,from_date));

create table departments(dept_no char(4) not null,
dept_name varchar(10) not null,primary key(dept_no),
unique key(dept_name));

create table dept_emp(emp_no int not null,
dept_no char(4) not null,from_date date not null,
to_date date not null,key(emp_no),
key(emp_no),key(dept_no),
foreign key(emp_no) references employees(emp_no),
foreign key(dept_no) references departments(dept_no),
primary key(emp_no,dept_no));

CREATE TABLE dept_manager (
   dept_no      CHAR(4)  NOT NULL,
   emp_no       INT      NOT NULL,
   from_date    DATE     NOT NULL,
   to_date      DATE     NOT NULL,
   KEY         (emp_no),
   KEY         (dept_no),
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no) ,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ,
   PRIMARY KEY (emp_no, dept_no) 
	);
    
create table titles(emp_no int not null,title
varchar(50) not null,from_date date not null,
to_date date not null,key(emp_no),foreign key (emp_no)
references employees(emp_no),primary key(emp_no,
title,from_date));

insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date) values (0001, '19-03-18', 'naveen', 'karthik', 'M', '13-12-23');
insert into departments values(1, 'Civil');
insert into dept_emp values(1,1, '13-12-23', '13-12-25');
insert into dept_manager values(1, 1, '13-12-23', '13-12-25');
insert into titles values(1, 'Manager','13-12-23', '13-12-25');
insert into salaries values(1, 50000, '13-12-23', '13-12-25');
insert into salaries values(2, 60000, '14-12-23', '15-12-25');
update employees set first_name='kavin' where emp_no=1;
insert into employees values(0002,'12-04-12','raj','kumar','M','13-02-21');
update employees set hire_date='15-02-21' where emp_no=2;
select * from employees;
delete from employees where emp_no=2;
delete from employees;
drop table employees;
select first_name,gender,emp_no from employees;
insert into employees values(0003,'14-02-15','kavin','karthik','M','15-02-28');
insert into employees values(0002,'12-04-12','raj','kumar','M','13-02-21');
select distinct first_name from employees;
select distinct title from titles;
select distinct dept_name from departments;
select * from employees order by hire_date desc;
select * from salaries order by salary;
select * from employees where first_name='kavin' and emp_no=1;
select * from salaries where not salary=60000;
select * from employees limit 2;

select max(salary) from salaries;
select min(salary) from salaries;
select min(salary) as lowersalary from salaries;
select count(*) from employees;
select count(*) from employees where gender='M';
select sum(salary) from salaries;
select * from salaries;
insert into salaries values(3,45000,'15-02-12','16-03-29');
insert into salaries values(999,15000,'16-02-12','16-03-29');
select sum(salary) from salaries where from_date between '13-02-20' and '18-09-08';
select avg(salary) from salaries;
select avg(salary) from salaries where to_date='16-03-29';
SELECT * FROM employees WHERE first_name LIKE 'k%'; -- starts with k
SELECT * FROM employees WHERE first_name LIKE '%k%'; -- anywhere contain k
select * from employees where first_name like '%j'; -- ends with j
select * from employees where first_name like 'ka__%'; -- starts with ka follows exact 2 letters then any number of letters
select * from employees where first_name like '%__in'; -- any number of char followed by 2 letters and ends with in
select * from salaries where salary in (50000,60000);
select * from salaries where salary not in (50000);
select * from salaries where salary not between 10000 and 50000;
select salary as increment from salaries;
select * from employees inner join salaries on employees.emp_no = salaries.emp_no;
select em.first_name , sa.salary from employees as em inner join salaries as sa on em.emp_no = sa.emp_no;
select * from employees left join salaries on employees.emp_no = salaries.emp_no;
select em.first_name, sa.salary from employees as em right join salaries as sa on em.emp_no = sa.emp_no;