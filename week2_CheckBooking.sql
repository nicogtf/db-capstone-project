DELIMITER //

CREATE PROCEDURE CheckBooking (booking_date date, table_no int)
BEGIN
	declare counter int default 0;
    
    select count(BookingID)
    INTO counter
    from Bookings
    where Date = booking_date and TableNo = table_no;
    
    if counter > 0 then
		select concat('Table ', table_no, ' is already booked') as BookingStatus;
	else
		select concat('Table ', table_no, ' is available') as BookingStatus;
    end if;
END //

DELIMITER ;