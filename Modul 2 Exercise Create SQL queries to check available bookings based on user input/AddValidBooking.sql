drop procedure if exists AddValidBooking;

DELIMITER //

create procedure AddValidBooking(in booking_date date, in table_number int)

BEGIN
    DECLARE rollback_message VARCHAR(255) DEFAULT 'Transaction rolled back: Table already booked';
    DECLARE commit_message VARCHAR(255) DEFAULT 'New booking added successfully';

start transaction;
if not exists (select * from littlelemondb.bookings where BookingDate=booking_date and TableNo=table_number)
then INSERT INTO littlelemondb.bookings (BookingID, BookingDate,EmployeeID, TableNo, Customer)
VALUES
(7,booking_date, 01, table_number, 1);
commit;
select commit_message as BookingStatus;
else ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = rollback_message;
end if;
END
//
DELIMITER ;

call AddValidBooking('2023-11-11',4);

