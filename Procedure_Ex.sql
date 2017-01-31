/*Create Procedure
-------------------------------------------------*/

/*(1) display all employee */

 DELIMITER //
 CREATE PROCEDURE displayAllEmployees()
   BEGIN
		SELECT *  FROM emp;
   END //
 DELIMITER ;

/*(2) display total no of departments */

DELIMITER $$
 
CREATE PROCEDURE displayTotalNoDept()
BEGIN    
    SELECT count(*) as tot_dept from dept;	
END$$

/*(3) get All Department Names */

DELIMITER $$
create procedure getAllDeptName()
BEGIN
	select dname from dept;
END$$


/*Call Procedure
----------------------------------------------*/
 call displayAllEmployees();

 call displayTotalNoDept();

 call getAllDeptName(); 
 
/*Drop Procedure
----------------------------------------------*/
drop procedure getAllDeptName;

/*Display All Stored Procedures
-----------------------------------------------*/
SELECT ROUTINE_NAME,ROUTINE_DEFINITION FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_SCHEMA = 'testdb' AND ROUTINE_TYPE = 'PROCEDURE';

/*Procedure -> Get Product Price 
-------------------------------------------------- */
DELIMITER $$
CREATE PROCEDURE getProductPrice(pname varchar(50))
BEGIN
  SELECT prod_price FROM products where prod_name=pname;
END$$
DELIMITER ;

/*Calling Procedure
--------------------------------------------------*/
call getProductPrice("CPU");
