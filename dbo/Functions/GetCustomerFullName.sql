CREATE FUNCTION GetCustomerFullName (@CustomerID INT)
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @FullName NVARCHAR(200);

    SELECT @FullName = FirstName + ' ' + LastName
    FROM Customers
    WHERE CustomerID = @CustomerID;

    RETURN @FullName;
END
