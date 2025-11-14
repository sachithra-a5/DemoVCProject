CREATE VIEW vwCustomerOrders
AS
SELECT 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email,
    COUNT(O.OrderID) AS TotalOrders,
    SUM(O.TotalAmount) AS TotalOrderAmount,
    MAX(O.OrderDate) AS LastOrderDate
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Email;
