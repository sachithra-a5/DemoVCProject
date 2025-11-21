CREATE TABLE [dbo].[Payments]
(
	PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(12,2) NOT NULL,
    PaymentMethod NVARCHAR(50) NOT NULL,   -- e.g., CreditCard, Cash, PayPal
    ReferenceNo NVARCHAR(100) NULL,        -- Optional transaction reference
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
)
