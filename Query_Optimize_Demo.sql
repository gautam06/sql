/*Query Optimization
========================================================================*/

/* define column name instead of using * in select query */

select customer_id,customer_name,contact_name,city from customers;

/* Query with * */

select * from customers; 

/* having clause used after rows selected. do not use for any other purposes. */
 
 create table student(sid int primary key,
 sname varchar(50) not null,
 course varchar(50) not null,
 semester int not null);

/* Insert Values in student */
 
insert into student values(1,"Akash","MSC",2);
insert into student values(2,"Bajarangi","MCA",4);
insert into student values(3,"Chetan","MSC",2);
insert into student values(4,"Dev","MCA",4);
insert into student values(5,"Akash","MBA",2);
insert into student values(6,"Farhan","MBA",4);
insert into student values(7,"Gaurav","MCA",6);
insert into student values(8,"Hetal","MCOM",4);

/* Query without having -> 0.016 sec */

select semester, count(semester)
from student
where semester != 6 and semester != 2;

/* Query with having -> 0.235 sec */

select semester, count(semester) as total_students
from student
group by semester
having semester != 6 and semester != 2;

/*Try to minimize the number of subquery block in your query. 
===========================================================*/

/* Good */

SELECT name 
FROM employee 
WHERE (salary, age ) = (SELECT MAX (salary), MAX (age) 
FROM employee_details) 
AND dept = 'Sales'; 

/* Bad */

SELECT name 
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee_details) 
AND age = (SELECT MAX(age) FROM employee_details) 
AND emp_dept = 'Sales';


/*EXISTS is efficient when most of the filter criteria is in the main query.
===========================================================================*/

/* Good */

Select * from product p 
where EXISTS (select * from order_items o 
where o.product_id = p.product_id)

/* Bad */

Select * from product p 
where product_id IN 
(select product_id from order_items



/*Use EXISTS instead of DISTINCT when using joins which involves tables having one-to-many relationship. 
=================================================================================*/

/* Good */

SELECT d.dept_id, d.dname
FROM dept d 
WHERE EXISTS ( SELECT 'Gautam' FROM emp e WHERE e.dname = d.dname);

/* Bad */

SELECT DISTINCT d.dept_id, d.dept 
FROM dept d,employee e 
WHERE e.dept = e.dept;


 /*Try to use UNION ALL in place of UNION. 
 ==========================================*/
 
/*Union
-------------------------------------------------------*/
select city from customers
union
select city from suppliers;

/*Union All
------------------------------------------------------*/
select city from customers
union all
select city from suppliers;

/*Other queries
--------------------------------------------
careful while using conditions in WHERE clause. 
-----------------------------------------------
*/

/*(1) Good */
SELECT id, first_name, age FROM student_details WHERE age > 10;

/* Bad */
SELECT id, first_name, age FROM student_details WHERE age != 10;

/*(2) Good */
SELECT id, first_name, age 
FROM student_details 
WHERE first_name LIKE 'Chan%';

/* Bad */

SELECT id, first_name, age 
FROM student_details 
WHERE SUBSTR(first_name,1,3) = 'Cha';

/*(3) Good */

SELECT product_id, product_name 
FROM product 
WHERE unit_price BETWEEN MAX(unit_price) and MIN(unit_price)

/* Bad */

SELECT product_id, product_name 
FROM product 
WHERE unit_price >= MAX(unit_price) 
and unit_price <= MIN(unit_price)

/*(4)  Good */

SELECT id, name, salary 
FROM employee 
WHERE dept = 'Electronics' 
AND location = 'Bangalore';

/* Bad */

SELECT id, name, salary 
FROM employee 
WHERE dept || location= 'ElectronicsBangalore';