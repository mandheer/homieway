select * from tab;
select * from EMP;
select * from dept;

select * from emp where deptno=20;
select * from emp where sal > 2500;
select * from emp where job='CLERK';

-- using IN
select * from emp where deptno in (10,20);
select * from emp where job in ('CLERK','PRESIDENT');

-- using IS
select * from emp where comm is null;
select * from emp where mgr is null;

-- using LIKE
select * from emp where ename like 'S%';

--using between
--List the employees whose salary is between 2000 and 3000
select * from emp where sal between 2000 and 3000;

-- employees whose ename has 'L' as second char
select * from emp where ename like '_L%';
select * from emp A where instr(A.ename,'L',1,1)=2;

-- only one L and that too at 2nd position
select * from emp A where instr(A.ename,'L',1,1)=2 and instr(A.ename,'L',1,2)=0;

-- emp whose second last character is 'E'
select * from emp where ename like '%E_';
select * from emp A where instr(A.ename,'E',1,-1)=2;



-- employees whose ename has atleast 2 'LL's
select * from emp where ename like '%LL%';

-- emp whose ename is having 'R' at 3rd position
select * from emp where ename like '__R%';

-- emp ename has exactly 5 chars
select * from emp where ename like '_____';

-- emp job has exactly 5 chars
select * from emp where job like '_____';

-- list all salesman in dept 30
select * from emp where deptno = 30 and job = 'SALESMAN';

-- List all the salesmen in dept number 30 and having salary greater than 1500
select * from emp where job= 'SALESMAN' and deptno = 30 and sal > 1500;

-- List all the employees whose name starts with ‘s’ or ‘a’
select * from emp where ename like 'S%' OR ename like 'A%';

-- List all the employees except those who are working in dept 10 & 20. 
select * from emp where deptno not in (10,20);

-- List the employees whose name does not start with ‘S’
select * from emp where ename not like 'S%';

-- List all the employees who are having reporting managers in dept 10
select * from emp where mgr is not NULL and deptno =10;

select A.*,B.deptno "MGR DEPTNO",B.ename "MGR NAME" from emp A, emp B where A.mgr is not null and A.mgr = B.empno and B.deptno =10; 

-- List the employees who are not working as managers and clerks and are in dept 10 and 20 with a salary in the range of 1000 to 3000
select * from emp where job not in ('MANAGER','CLERK') and deptno in (10,20) and sal between 1000 and 3000;

-- List the employees whose salary not in the range of 1000 to 2000 in dept 10,20,30 except all salesmen
select * from emp where sal not between 1000 and 2000 and deptno in (10,20,30) and job != 'SALESMAN';

-- List the department names which are having letter ‘O’ in their locations as well as their department names
select * from dept where loc like '%O%' and dname like '%O%';

---------------------------------------------------
-- SORTING -----------
-----------------------------

-- Arrange all the employees by their salary
select * from emp order by sal asc;

-- Arrange all the employees by their salary in the descending order
select * from emp order by sal desc;

-- Arrange ename, sal, job, empno and sort by descending order of salary
select ename, sal, job, empno from emp order by sal desc;
select ename, sal, job, empno from emp order by 2 desc;

-- NOTE :-  ORDER BY should be used always as the last statement in the SQL query

-- select distinct dept from emp
select distinct deptno from emp ;

-- display the maximum salary, minimum salary and total salary from employee
select max(sal) "max sal", min(sal) "min sal", sum (sal) "total sal" from emp;

-- count emp
select count(*) "All Rows", count(empno) "EMP ROWS" from emp;

-- count commission
select count(*) "All Rows", count(comm) "EMP ROWS" from emp;

-- count emp in dept 30
select count(empno) "employees count" from emp where deptno =30;

-- Display the total salary in department 30
select sum(sal) from emp where deptno =30;

-- List the number of clerks in department 20
select count(*) from emp where deptno = 20 and job = 'CLERK';

-- List the highest and lowest salary earned by salesmen
select max(sal), min(sal) from emp where job = 'SALESMAN';

-- GROUPING
-- It is the process of computing the aggregates by segregating based on one or more columns. 
-- Grouping is done by using ‘group by’ clause. 

-- Display the total salary of all departments
select deptno, sum(sal) from emp group by deptno;

-- Display the maximum of each job
select job, max(sal) from emp group by job;

-- HAVING
-- ‘Having’ is used to filter the grouped data.
-- ‘Where’ is used to filter the non grouped data. 

-- Display job-wise highest salary only if the highest salary is more than Rs1500
select job , max(sal) from emp group by job having max(sal) > 1500;
select job , max(sal) from emp where sal > 1500 group by job ;

-- Display job-wise highest salary only if the highest salary is more than 1500 excluding department 30. 
-- Sort the data based on highest salary in the ascending order.
select job, max(sal) from emp where sal > 1500 and deptno != 30 group by job order by max(sal) asc;
select job, max(sal) from emp where deptno != 30 group by job having max(sal) > 1500 order by 2 asc;

-- RESTRICTIONS ON GROUPING
-- we can select only the columns that are part of ‘group by’ statement
-- below query is an error
select deptno, job, sum(sal), sum(comm) from emp group by deptno;
-- The above query is an error because ‘job’ is there in the select query but not in the group by query. 
select deptno, job, sum(sal), sum(comm) from emp group by deptno, job;
-- Whatever is there in the select statement must be there in the group by statement. 
select deptno, job, sum(sal), sum(comm) from emp group by deptno, job
order by deptno;

-- Display the department numbers along with the number of employees in it
select deptno, count(*) "NO of EMP" from emp group by deptno;

-- Display the department numbers which are having more than 4 employees in them
select deptno from emp group by deptno having count(*) >4;

-- Display the maximum salary for each of the job excluding all the employees whose name ends with ‘S’
select max(sal), job from emp where ename not like '%S' group by job order by 1 asc;
select ename, job, max(sal) from emp where ename not like '%S' group by ename, job order by 3 asc;

-- Display the department numbers which are having more than 9000 as their departmental total salary
select deptno, sum(sal) from emp group by deptno having sum(sal)>9000 order by deptno;

-- CLEAR SCREEN
cl scr;

select * from tab;
desc products;
desc orders;
drop table products;

create table temp as select * from emp;

select * from temp;
desc temp;
desc emp;
drop table temp;
desc products;
create table temp as select * from dept;
rollback;

truncate table temp; -- removes data permanently but keeps structure
drop table temp; -- removes both data and the structure of the table permanently from the database. 
rename temp to temp23;


---------------- alter
alter table temp23 add model_no varchar2(10) not null;
truncate table temp23;
desc temp23;
alter table temp23 drop column model_no;
alter table temp23 rename column loc to location;
drop table temp23;

-------------- update
select * from emp where empno= 7369;
update emp set sal=sal+200, comm = 100 where empno= 7369;

-- increase all salary by 10%
update emp set sal= sal*1.10;
select * from emp;

--- delete :: deletes one/some/all records
create table test1 as select * from emp;
select * from test1;
delete from test1 where empno= 7934;
drop table test1;

---- rollback :: It undoes the DML changes performed on a table. 
select * from emp;
delete from emp;
rollback;

----- commit
create table test as select * from dept;
select * from test;
delete from test;
select * from test;
rollback;
select * from test;

delete from test;
select * from test;
commit;
rollback;
select * from test;

drop table test;

-- savepoint :: It is like a pointer (break-point) till where a DML will be rolled back. 
--- Insert …
---
--- Save point x ;
--- Update …
--- Delete ..
--- 
--- Rollback to x ;
--- …
--- …

--- Here, only DELETE & UPDATE are rolled back.
--- INSERT is neither rolled back nor committed. 

create table students(
    regno number(4,0),
    name varchar2(10) not null,
    semester varchar2(10),
    dob date,
    phone number(10,0),
    constraint pk_student primary key (regno)
);

create table books(
    bookno number(4),
    bname varchar2(10),
    author varchar2(10),
    constraint pk_books primary key (bookno)
);

create table library(
    regno number(4),
    bookno number(4),
    doi date,
    dor date,
    constraint fk_regno foreign key (regno) references students(regno),
    constraint fk_bookno foreign key (bookno) references books(bookno) 
);

select * from tab;

-- composite key
alter table library add constraint pk_newpk primary key (regno,bookno,doi);


-- nested query is qery in query
-- inner query will always be executed first
-- the output of inner query is passsed to outer query

-- List the employees working in ‘Research’ department. 
select * from emp where
    deptno = (select deptno from dept where dname='RESEARCH');
    
select * from emp where
    deptno in (select deptno from dept where dname='RESEARCH');

-- List the department names that are having analysts
select * from dept where
    deptno in (select deptno from emp where job in ('ANALYST'));

select * from dept where
    deptno = (select distinct(deptno) from emp where job = 'ANALYST');

-- List the employees in Research and Sales department
select * from emp where
    deptno in ( select deptno from dept where dname in ('RESEARCH','SALES'))
    order by deptno;
    
-- List the department names which are having salesmen in it. 
select * from dept where
    deptno in (select distinct deptno from emp where job = 'SALESMAN')
    order by deptno;

-- Display the employees whose location is having atleast one ‘O’ in it. 
select A.*,B.loc from emp A, dept B where
    A.deptno in (select distinct deptno from dept where loc like '%O%')
    and A.deptno = B.deptno
    order by A.deptno;

-- List the department names that are having atleast 1 employee in it. 
   select * from dept where
   deptno in (select distinct deptno from emp);
   
   select * from dept where
   deptno in (select deptno from emp group by deptno having count(empno) > 0)
   order by deptno;
    
-- List the department names that are having atleast 4 employees in it
    select * from dept where
   deptno in (select deptno from emp group by deptno having count(empno) >= 4)
   order by deptno;
   
-- Display the department names which are having atleast 2clerks in it
    select * from dept where
   deptno in (select deptno from emp where job= 'CLERK' group by deptno having count(job) >= 2)
   order by deptno;

-- Display the 2nd maximum salary
select max(sal) from emp where sal < (select max(sal) from emp);

-- Display the 3rd maximum salary
select max(sal) from emp where 
    sal < (select max(sal) from emp where
        sal < (select max(sal) from emp)
    );

-- Display the 4th least salary
select min(sal) from emp where 
    sal > (select min(sal) from emp where
        sal > (select min(sal) from emp where
            sal > (select min(sal) from emp)
        )
    );

-- List the department names that are having no employees at all
select dname from dept where deptno not in (select deptno from emp group by deptno having count(*) > 0 );

-- JOINS
select A.ename, A.  sal, B.dname from emp A, dept B;
select A.ename, A.  sal, B.dname from emp A, dept B where A.deptno= B.deptno order by A.ename;

select A.ename, A.  sal, B.dname from emp A, dept B where A.deptno= B.deptno and A.sal > 2000 order by A.ename;

-- Display employee name, his job, his dname and his location for all the managers living in New York or Chicago
select A.ename, A.job, B.dname, B.loc from emp A join dept B 
on A.deptno = B.deptno and A.job = 'MANAGER' and B.loc in ('NEW YORK','CHICAGO');

-- Display employee name and his department name for the employees whose name does not starts with ‘S’
select A.ename, B.dname from emp A join dept B on A.deptno= B.deptno and A.ename not like 'S%';

-- RIGHT JOIN 
-- Display all the department names irrespective of any employee working in it or not. If an employee is working – display his name. 
select A.ename,B.* from emp A right join dept B on A.deptno = B.deptno;

-- LEFT JOIN
-- Display all the department names irrespective of any employee working in it or not. If an employee is working – display his name. 
select A.ename,B.* from dept B left join emp A on A.deptno = B.deptno;

-- FULL JOIN
select A.ename,B.* from dept B full join emp A on A.deptno = B.deptno;

-- Display employee name and his department name for the employees whose name starts with ‘S’
select A.ename,A.deptno, B.dname from emp A join dept B on A.deptno= B.deptno and A.ename like 'S%';

-- Display employee name and his department name who is earning 1st maximum salary
select A.ename, B.dname from emp A join dept B on A.deptno = B.deptno and sal = (select max(sal) from emp);

-- SELF JOIN
-- display employee name and his manager name
select A.ename "EMPLOYEE", B.ename "MANAGER" from emp A join emp B on A.mgr=B.empno order by 2;

-- Display the employees who are getting the same salary
select A.ename, A.sal from emp A join emp B on A.sal = B.sal and A.empno != B.empno;

-- co-relate queries 
-- They are special type of sub – queries
-- Here, both outer & inner queries are inter-dependent
-- For each & every record of outer query, the entire inner query will be executed
-- They work on the principles of both sub – queries & JOIN(s)

-- Display the employee who is earning the highest salary
select * from emp A where
    0 = (select count(distinct(B.sal)) from emp B where A.sal < B.sal);
    
-- 3rd highest sal
select * from emp A where
    2 = (select count(distinct(B.sal)) from emp B where A.sal < B.sal);
    
-- top 3 persons sal from emp table
select * from emp A where
    2 >= (select count(distinct(B.sal)) from emp B where A.sal < B.sal)
    order by A.sal;

-- least sal
select * from emp A where
    0 = (select count(distinct(B.sal)) from emp B where A.sal > B.sal);
    
-- display 1st and 4th max salary
select * from emp A where
    0 = (select count(distinct(B.sal)) from emp B where A.sal < B.sal)
union
select * from emp A where
    3 = (select count(distinct(B.sal)) from emp B where A.sal < B.sal)
order by 1 desc;

-- Display 1st, 4th & 6th highest salaries in a single query
select * from emp A where
    0 = (select count(distinct(B.sal)) from emp B where A.sal < B.sal)
union
select * from emp A where
    3 = (select count(distinct(B.sal)) from emp B where A.sal < B.sal)
union
select * from emp A where
    5 = (select count(distinct(B.sal)) from emp B where A.sal < B.sal)
order by 1 desc;

-- user defiled functions
select upper('oracle'),lower('ORAcle') from dual;
select ename, lower(ename) from emp;

-- Dual – is a dummy table which is used for performing some independent operations which will not depend on any of the existing tables.
select sysdate, systimestamp from dual;
select 100 + 200 "addition" from dual;
select ename, sal + 100 "new sal" from emp;
select length('oracle') from dual;
select ename, length(ename) "char length" from emp;

-- Display all the employees whose name & job is having exactly 5 characters
select ename, job from emp where length(ename) =5 and length(job)= 5;

select replace('oracle','a','p') from dual;

-- SUBSTR : This is called substring. 
-- It extracts ‘n’ characters from x(th) position of a given string. 
select job, 
substr(job,1,3) "1-3",
substr(job,2,4) "2-4",
substr(job,3) "3-n",
substr(job,-4) "last" from emp;

select ename from emp where instr(ename,'S',1,1) =1;
select ename, job, decode(job,'CLERK','C','ANALYST','A','O') "ENCODED JOB" from emp;
select ename, job, sal, NVL(comm,-100) from emp;
select ename, sal + NVL(comm,0) "GROSS SAL", job, NVL(comm,0), sal from emp;


-- Display all employees whose name is having exactly 1 ‘L’ in it
select * from emp where instr(ename,'L',1,1)>=1 and instr(ename,'L',1,2)=0;

----------------------------------------------------------------------------------
-- CODD rules ( Differentiates between DBMS & RDBMS )
-- 1) should support NULL values
-- 2) should support creation of relationship between tables
-- 3) should support DDL, DML, TCL
-- 4) should support constraints like PK, Unique, CHK
-- 5) should support query techniques like sub – queries, joins, grouping etc. 
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- Normalization is the process of splitting the bigger table into many small tables without changing its functionality. 

-- 1NF
-- - We should collect all the required attributes into 1 or more bigger entities. 
-- - We have to assume no 2 records are same (i.e, records should not be duplicated)
-- - Identify the probable primary key

-- 2NF
-- To perform 2NF,
-- - The tables have to be in 1NF
-- - Here, we identify all the complete dependencies and move them separately into different tables. 

-- 3NF
-- The table will have to be in 2NF
-- Here, we identify all the partial dependencies and move such columns to a separate table. 
-------------------------------------------------------------------------------------------