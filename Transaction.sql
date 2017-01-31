/*MySQL Transaction
----------------------------------*/
set autocommit = 0; /*all the transactions needs to be commited explicitely*/
set autocommit = 1; /*all the transactions do not need to commit explicitely*/

/*Create table Account
------------------------------------*/
create table account(accountid int primary key,
account_holder varchar(50),
city varchar(50),
balance double);

/*rename column
-----------------------------------------------*/
alter table account change column accountid account_id int;

/*Insert Records into Account
----------------------------------------*/
insert into account values(1516,"Gautam","Vapi",15000);
insert into account values(1517,"Hardik","Valsad",10000);
insert into account values(1518,"Vimal","Ankleshwar",8500);
insert into account values(1520,"Rahul","Ahmedabad",5500);
insert into account values(1522,"Ketan","Bhavnagar",5000);
insert into account values(1523,"Jayesh","Bhavnagar",7000);
insert into account values(1524,"Naitik","Ahmedabad",4000);
insert into account values(1525,"Chirag","Ahmedabad",400);
insert into account values(1526,"Kiran","Surat",1500);
insert into account values(1528,"Milind","Surat",450);

/*Transaction
----------------------------------------------*/
use testdb;
set autocommit=0;
start transaction;

update account set balance = balance + (balance/10) where account_id = 1518;

update account set balance = (balance - 100) where balance < 500;

savepoint s1;

update account set balance = balance + (balance/5) where account_id = 1523; 

savepoint s2;

update account set city = "Ahmedabad" where account_id = 1516; 

insert into account values(1521,"Jagdish","Bilimora",4900);

rollback to s1;

commit;