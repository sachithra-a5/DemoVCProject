CREATE TABLE [dbo].[AuditLogs] (
    [LogID]       INT            IDENTITY (1, 1) NOT NULL,
    [ActionName]  NVARCHAR (100) NULL,
    [Description] NVARCHAR (MAX) NULL,
    [CreatedOn]   DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

