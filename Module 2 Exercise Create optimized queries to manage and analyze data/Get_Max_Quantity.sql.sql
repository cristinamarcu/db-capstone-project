DELIMITER //

create procedure GetMaxQuantity()
BEGIN
select max(Quantity) as result from littlelemondb.orders;
END
//

DELIMITER ;


call GetMaxQuantity();