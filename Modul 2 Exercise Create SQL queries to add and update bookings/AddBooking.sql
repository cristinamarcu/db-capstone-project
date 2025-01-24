drop procedure if exists AddBooking;

DELIMITER //

create procedure AddBooking(in bookingid int, in booking_date date, in table_number int,in customer int)
BEGIN
#declare BookingStatus char(100);
if not exists (select * from littlelemondb.bookings where BookingID=bookingid and Customer=customer and BookingDate=booking_date and TableNo=table_number)
then BEGIN INSERT INTO littlelemondb.bookings (BookingID, BookingDate,EmployeeID, TableNo, Customer)
VALUES
(bookingid,booking_date, 01, table_number, customer);
select CONCAT('Table ', table_number, ' booked succesfully.') as BookingStatus;
END;
else select CONCAT('Table ', table_number, ' is already booked.') as BookingStatus; 
end if;
END
//
DELIMITER ;

call AddBooking(5,'2022-11-12',5,1);