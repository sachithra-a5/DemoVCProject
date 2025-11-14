CREATE PROCEDURE CreateOrder
    @CustomerID INT,
    @TotalAmount DECIMAL(12,2)
AS
BEGIN
    INSERT INTO Orders (CustomerID, TotalAmount)
    VALUES (@CustomerID, @TotalAmount);

    SELECT SCOPE_IDENTITY() AS NewOrderID;
END
