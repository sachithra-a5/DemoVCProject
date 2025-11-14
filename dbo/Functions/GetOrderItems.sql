CREATE FUNCTION GetOrderItems (@OrderID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        OI.OrderItemID,
        P.ProductName,
        OI.Quantity,
        OI.UnitPrice
    FROM OrderItems OI
        INNER JOIN Products P ON OI.ProductID = P.ProductID
    WHERE OI.OrderID = @OrderID
);
