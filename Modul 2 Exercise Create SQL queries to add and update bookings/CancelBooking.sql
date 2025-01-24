drop procedure if exists CancelBooking ;
 
DELIMITER //

create procedure CancelBooking (in a INT)
BEGIN             
declare message_text varchar(100);
delete from littlelemondb.bookings
where BookingID=a;
set message_text=CONCAT('Booking ', CAST(a as char(10)), ' canceled');
BEGIN 
select message_text;
END;
END
//
DELIMITER ;

call CancelBooking(1);
