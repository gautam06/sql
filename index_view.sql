/*Create index on emp table - ename column
-----------------------------------------------*/
create index id_ename on emp(ename);


/*Composite Index
------------------------------------------------*/
create index id_eid_name
on emp (empid, ename);

/*Create View MaxSalary > 25000
--------------------------------------------------*/
create view maxSalary as select * from emp where salary > 25000;

/*use of view
------------------------------------------------*/
select * from maxSalary;

/*MaxPriceView View
-----------------------------------------------*/
create view maxPriceView AS Select prod_name from products where prod_cost >= 8000;

/*display data from view
-----------------------------------------------*/
select * from maxPriceView;