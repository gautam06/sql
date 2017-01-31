/* Create table dept
------------------------------------------- */

create table dept(deptid int primary key,
dname varchar(50),
location varchar(50));

/* Create table emp
------------------------------------------- */

create table emp(empid int primary key auto_increment,
ename varchar(50),
job varchar(20),
mgr int,
hiredate date,
salary decimal(7,2),
deptno int references dept(deptno));


/*
Insert records into dept
----------------------------------------------------*/

insert into dept values(10,"Accounting","Ahmedabad");
insert into dept(deptid,dname,location) values(20,"Sales","Vadodara");
insert into dept values(30,"Operation","Surat");

/*Insert records into emp
------------------------------------------------------*/

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("King","President",null,'2012-01-01',48000,10);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Ram","Manager",1,'2012-01-01',35000,10);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Shyam","Manager",1,'2012-01-01',35000,20);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Krishna","Manager",1,'2012-01-01',30000,30);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Ajay","Analyst",4,'2012-01-10',25000,20);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Ranjeet","Clerk",2,'2012-01-18',24000,10);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Kisan","Salesman",3,'2012-01-25',19000,20);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Raghav","Salesman",3,'2012-01-30',19000,20);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Ramesh","Analyst",4,'2012-01-30',22000,30);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Suresh","Salesman",3,'2012-02-02',19000,20);

insert into emp(ename,job,mgr,hiredate,salary,deptno) 
values("Mehul","Clerk",2,'2012-02-18',20000,10);


/*===============================================================*/

Products Table
--------------------------------------
CREATE TABLE products(
prod_id INT NOT NULL AUTO_INCREMENT, 
prod_name VARCHAR(20) NOT NULL, 
prod_cost FLOAT NOT NULL DEFAULT 0.0, 
prod_price FLOAT NOT NULL DEFAULT 0.0, 
PRIMARY KEY(prod_id));

insert into products(prod_name,prod_cost,prod_price) values("LCD",10000,12000);
insert into products(prod_name,prod_cost,prod_price) values("Keyboard",1200,1550);
insert into products(prod_name,prod_cost,prod_price) values("CPU",9000,10500);