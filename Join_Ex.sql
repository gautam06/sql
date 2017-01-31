/*
Joins
--------------*/

/*create tables customers & orders & suppliers
------------------------------------------------*/
use testdb;

create table customers(
customer_id int primary key auto_increment,
customer_name varchar(50) not null,
contact_name varchar(50) not null,
city varchar(50));

create table orders
(order_id int primary key auto_increment,
customer_id int,
order_date date,
foreign key (customer_id) references customers(customer_id));

create table suppliers(
supplier_id int primary key auto_increment,
supplier_name varchar(50),
city varchar(50));

/*Insert Records in customers
-------------------------------------------*/
insert into customers(customer_name,contact_name,city)
values("Vimal","Tushar","Ahmedabad");
insert into customers(customer_name,contact_name,city)
values("Rahul","Ketan","Ahmedabad");
insert into customers(customer_name,contact_name,city)
values("Raghav","Raghav","Vadodara");
insert into customers(customer_name,contact_name,city)
values("Ramesh","Ramesh","Rajkot");
insert into customers(customer_name,contact_name,city)
values("Shyam","Shyam","Surat");
insert into customers(customer_name,contact_name,city)
values("Raj","Rishi","Surat");

/*Insert Records in orders
------------------------------------------------------*/
insert into orders(customer_id,order_date) 
values(2,'2015-01-10');
insert into orders(customer_id,order_date) 
values(3,'2015-01-12');
insert into orders(customer_id,order_date) 
values(4,'2015-01-15');
insert into orders(customer_id,order_date) 
values(5,'2015-01-15');
insert into orders(customer_id,order_date) 
values(6,'2015-01-18');
insert into orders(customer_id,order_date) 
values(4,'2015-01-19');
insert into orders(customer_id,order_date) 
values(2,'2015-01-25');

/*Insert records in suppliers
---------------------------------------------------------*/
insert into suppliers(supplier_name,city)
values("Mayur","Ahmedabad");
insert into suppliers(supplier_name,city)
values("Akshay","Anand");
insert into suppliers(supplier_name,city)
values("Shaishan","Rajkot");
insert into suppliers(supplier_name,city)
values("Ketul","Vadodara");
insert into suppliers(supplier_name,city)
values("Sanket","Surat");
insert into suppliers(supplier_name,city)
values("Deval","Vapi");


/*Inner Join
-------------------------------------------------------*/
select orders.order_id, customers.customer_name, orders.order_date
from orders
inner join customers
on orders.customer_id=customers.customer_id;

/*Left Join
--------------------------------------------------------*/
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id=orders.customer_id
ORDER BY customers.customer_name;

/*Right Join
-------------------------------------------------------*/
SELECT orders.order_id, customers.contact_name
FROM customers
RIGHT JOIN orders
ON customers.customer_id=orders.customer_id
ORDER BY orders.order_date;

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

/*Union All with where
-------------------------------------------------------*/
SELECT customer_name, city FROM customers
WHERE city='Ahmedabad'
UNION ALL
SELECT supplier_name, city FROM suppliers
WHERE city='Ahmedabad'
ORDER BY City;
