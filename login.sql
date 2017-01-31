
/*Create table login
------------------------------------------------*/
create table login(
uid int primary key auto_increment,
uname varchar(20),
pass varchar(20));

/*Insert Records in Login
-----------------------------*/
insert into login(uname,pass) values("gautam","123456");
insert into login(uname,pass) values("vimal","654321");


/*Create function for login
--------------------------------*/
DELIMITER $$
 
CREATE FUNCTION checkValidUser(uname varchar(50),pass varchar(50)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE res int;
 
    IF uname = "gautam" and pass="123456" THEN
		SET res = 1;
    ELSE
        SET res = 0;
    END IF;
 
 RETURN (res);
END

/*Execute FUNCTION
----------------------------------------*/
Select checkValidUser("gautam","123456") from dual;

/*Drop FUNCTION
-----------------------------------------*/
drop function checkValidUser;
