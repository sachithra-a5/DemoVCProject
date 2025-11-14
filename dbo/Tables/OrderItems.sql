CREATE TABLE [dbo].[OrderItems] (
    [OrderItemID] INT             IDENTITY (1, 1) NOT NULL,
    [OrderID]     INT             NULL,
    [ProductID]   INT             NULL,
    [Quantity]    INT             NULL,
    [UnitPrice]   DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([OrderItemID] ASC),
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]),
    FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
);

