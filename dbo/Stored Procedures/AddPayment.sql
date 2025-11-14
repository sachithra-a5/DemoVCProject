CREATE PROCEDURE AddPayment
    @OrderID INT,
    @Amount DECIMAL(12,2),
    @PaymentMethod NVARCHAR(50),
    @ReferenceNo NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert into Payments table
    INSERT INTO Payments (OrderID, Amount, PaymentMethod, ReferenceNo)
    VALUES (@OrderID, @Amount, @PaymentMethod, @ReferenceNo);

    DECLARE @PaymentID INT = SCOPE_IDENTITY();

    -- Write audit log
    INSERT INTO AuditLogs (ActionName, Description)
    VALUES (
        'PAYMENT_ADDED',
        'PaymentID ' + CAST(@PaymentID AS NVARCHAR(20)) +
        ' added for OrderID ' + CAST(@OrderID AS NVARCHAR(20)) +
        ', Amount: ' + CAST(@Amount AS NVARCHAR(20))
    );

    -- Return new PaymentID
    SELECT @PaymentID AS NewPaymentID;
END
GO
