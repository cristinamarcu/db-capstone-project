drop procedure if exists UpdateBooking;

DELIMITER //

create procedure UpdateBooking(in bookingid int, in booking_date date)
BEGIN
set sql_safe_updates=0;
#declare BookingStatus char(100);
if exists (select * from littlelemondb.bookings where BookingID=bookingid)
then BEGIN UPDATE littlelemondb.bookings set BookingDate=booking_date where BookingID=bookingid;
select CONCAT('Booking ', bookingid, ' updated succesfully.') as BookingStatus;
END;
else select CONCAT('Booking ', bookingid, " doesn't exist.") as BookingStatus; 
end if;
set sql_safe_updates=1;
END
//
DELIMITER ;

call UpdateBooking(5,'2022-11-13');