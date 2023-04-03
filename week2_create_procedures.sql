DELIMITER //

CREATE PROCEDURE GetMaxQuantity ()
BEGIN
	SELECT max(Quantity) as MaxQuantityInOrder
    FROM orders;
END //

DELIMITER ;

PREPARE GetOrderDetail FROM 
	'SELECT 
   	    OrderID, Quantity, TotalCost
	FROM Orders
	WHERE OrderID = ?';
    
    
    DELIMITER //

CREATE PROCEDURE CancelOrder (ord_id int)
BEGIN
	delete from Orders
    where OrderID = ord_in;
END //

DELIMITER ;