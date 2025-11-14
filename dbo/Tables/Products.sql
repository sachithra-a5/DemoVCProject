CREATE TABLE [dbo].[Products] (
    [ProductID]   INT             IDENTITY (1, 1) NOT NULL,
    [ProductName] NVARCHAR (100)  NULL,
    [UnitPrice]   DECIMAL (10, 2) NULL,
    [IsActive]    BIT             DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC)
);

