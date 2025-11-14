PRINT 'Executing Post-Deployment script: inserting Payments sample data';

IF NOT EXISTS (SELECT 1 FROM Payments WHERE ReferenceNo = 'TXN1001')
BEGIN
    INSERT INTO Payments (OrderID, Amount, PaymentMethod, ReferenceNo)
    VALUES (1, 500.00, 'CreditCard', 'TXN1001');
END

IF NOT EXISTS (SELECT 1 FROM Payments WHERE ReferenceNo = 'TXN1002')
BEGIN
    INSERT INTO Payments (OrderID, Amount, PaymentMethod, ReferenceNo)
    VALUES (1, 1045.50, 'Cash', 'TXN1002');
END
