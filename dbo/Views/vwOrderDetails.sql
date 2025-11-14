CREATE VIEW vwOrderDetails
AS
SELECT 
    O.OrderID,
    O.OrderDate,
    C.FirstName + ' ' + C.LastName AS CustomerName,
    P.ProductName,
    OI.Quantity,
    OI.UnitPrice,
    (OI.Quantity * OI.UnitPrice) AS LineTotal,
    O.TotalAmount AS OrderTotal
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
INNER JOIN OrderItems OI ON O.OrderID = OI.OrderID
INNER JOIN Products P ON OI.ProductID = P.ProductID;
