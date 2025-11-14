CREATE TABLE [dbo].[Customers] (
    [CustomerID]  INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (50)  NULL,
    [LastName]    NVARCHAR (50)  NULL,
    [Email]       NVARCHAR (150) NULL,
    [CreatedDate] DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);

