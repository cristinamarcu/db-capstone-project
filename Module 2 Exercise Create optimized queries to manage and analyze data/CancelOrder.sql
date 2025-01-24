 
drop procedure if exists CancelOrder;
 
DELIMITER //

create procedure CancelOrder(in a INT)
BEGIN             
declare message_text varchar(100);
delete from littlelemondb.orders
where OrderID=a;
set message_text=CONCAT('Order ', CAST(a as char(10)), ' canceled');
BEGIN 
select message_text;
END;
END
//
DELIMITER ;

call CancelOrder(1);

