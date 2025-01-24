drop procedure if exists CheckBooking;

DELIMITER //

create procedure CheckBooking(in booking_date date, in table_number int)
BEGIN
#declare BookingStatus char(100);
if not exists (select * from littlelemondb.bookings where BookingDate=booking_date and TableNo=table_number)
then select CONCAT('Table ', table_number, ' is avaialble.') as BookingStatus;
else select CONCAT('Table ', table_number, ' is already booked.') as BookingStatus; end if;
END
//
DELIMITER ;

call CheckBooking('2022-11-12',3);