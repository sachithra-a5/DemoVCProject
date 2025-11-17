PRINT 'Creating SQL Agent Job PaymentReport...';

USE msdb;
GO

-- Delete existing job if any
IF EXISTS (SELECT 1 FROM msdb.dbo.sysjobs WHERE name = 'PaymentReport')
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = 'PaymentReport';
END
GO

-- Create job with owner = sa
EXEC msdb.dbo.sp_add_job 
    @job_name = 'PaymentReport',
    @enabled = 1,
    @description = 'Payment reporting job',
    @category_name = '[Uncategorized (Local)]',
    @owner_login_name = 'sa';
GO

-- Add job step
EXEC msdb.dbo.sp_add_jobstep
    @job_name = 'PaymentReport',
    @step_name = 'Insert_Payment_Audit',
    @subsystem = 'TSQL',
    @command = N'
        USE DemoVCProjectDB;
        INSERT INTO AuditLogs(ActionName, Description)
        SELECT ''PAYMENT_REPORT_JOB'', ''Executed at '' + CONVERT(varchar(20), GETDATE(), 120);
    ',
    @database_name = 'DemoVCProjectDB';
GO

-- Create schedule
EXEC msdb.dbo.sp_add_schedule
    @schedule_name = 'PaymentReport_Every_1_Minute',
    @freq_type = 4,              -- Daily
    @freq_interval = 1,
    @freq_subday_type = 4,       -- Minutes
    @freq_subday_interval = 1;   -- Every 1 minute
GO

-- Attach schedule
EXEC msdb.dbo.sp_attach_schedule
    @job_name = 'PaymentReport',
    @schedule_name = 'PaymentReport_Every_1_Minute';
GO

-- Add job to server
EXEC msdb.dbo.sp_add_jobserver 
    @job_name = 'PaymentReport';
GO
