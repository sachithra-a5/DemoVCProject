CREATE TABLE [dbo].[Orders] (
    [OrderID]     INT             IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT             NULL,
    [OrderDate]   DATETIME        DEFAULT (getdate()) NULL,
    [TotalAmount] DECIMAL (12, 2) NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
);

