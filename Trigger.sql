/*Create Trigger
-------------------------------*/
/* This trigger is activated whenever the products table is updated. 
the trigger checks each row to see if the product cost (prod_cost) value is being changed. 
then the trigger automatically sets the item's new price (prod_price) to 1.50 times the item's new cost (in other words, a 50% markup). */

DELIMITER $$
CREATE TRIGGER `updateProductPrice`
BEFORE UPDATE ON `products`
FOR EACH ROW
BEGIN
  IF NEW.prod_cost <> OLD.prod_cost
    THEN
      SET NEW.prod_price = NEW.prod_cost * 1.50;
  END IF ;
END$$
DELIMITER ;

/*Drop Trigger
------------------------------------*/
drop trigger updateProductPrice;

/* Create table emp 
---------------------------------------------------*/

create table emp_del(empid int primary key,
ename varchar(50) not null,
job varchar(20),
mgr int,
hiredate date,
salary decimal(7,2),
deptno int);

/* Trigger for storing deleted record */

DELIMITER $$
CREATE TRIGGER `deleteEmp`
After Delete ON `emp`
FOR EACH ROW
BEGIN
	insert into emp_del 
    values(old.empid,old.ename,old.job,old.mgr,old.hiredate,old.salary,old.deptno);
END$$
DELIMITER ;