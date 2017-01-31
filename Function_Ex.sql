/*Create Function
------------------------------------*/

/* (1) Calculate Profit */

DELIMITER $$
CREATE FUNCTION calcProfit(cost FLOAT, price FLOAT) RETURNS DECIMAL(9,2) DETERMINISTIC 
BEGIN
  DECLARE profit DECIMAL(9,2);
  SET profit = price-cost;
  RETURN profit;
END$$
DELIMITER ;

/*Calling Function
---------------------------------------------*/
SELECT calcProfit(8000,10000) AS profit FROM dual;

SELECT *,calcProfit(prod_cost,prod_price) AS profit FROM products;

/* (2)Calculate age function
-----------------------------------------------*/
DELIMITER $$
CREATE FUNCTION calAge(bdate date) RETURNS float DETERMINISTIC 
BEGIN
  DECLARE age float;
	set age = abs(DATEDIFF(bdate,curdate()) / 365.25);
  RETURN age;
END$$
DELIMITER ;

