CREATE PROCEDURE GetOrdersByCustomer
    @CustomerID INT
AS
BEGIN
    SELECT 
        O.OrderID,
        O.OrderDate,
        O.TotalAmount
    FROM Orders O
    WHERE O.CustomerID = @CustomerID;
END
