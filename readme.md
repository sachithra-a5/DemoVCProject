# DemoVCProject (Database scripts)

This repository contains the database project artifacts for DemoVCProject: schema scripts, tables, and a SQL Agent job used for payment reporting and auditing.

## Contents of interest
- `dbo\Tables\AuditLogs.sql` — Audit table definition.
- `dbo\Jobs\PostDeployment\PaymentReport.sql` — Creates the SQL Agent job `PaymentReport`.
- `bin\Debug\DemoVCProject_15.publish.sql` — Generated publish script.

## Overview
The `PaymentReport` job inserts a row into `AuditLogs` (action `PAYMENT_REPORT_JOB`). The job script is included as a post-deployment script and is created in msdb with owner `sa`. By design the job is created then left disabled.

## Prerequisites
- SQL Server instance with SQL Server Agent running.
- Permissions to create jobs in `msdb` (script uses owner `sa`).
- Visual Studio 2026 (Database Project) or SQL Server Management Studio (SSMS) for deployment.

## Deploying
Option A — Visual Studio
1. Open the database project in Visual Studio 2026.
2. Right-click the project ? __Publish...__ (or use __SQL Server Object Explorer__ and __Publish__).
3. Review settings and publish.

Option B — SSMS / Manual
1. Open `bin\Debug\DemoVCProject_15.publish.sql` in SSMS.
2. Execute the script against the target instance.

Post-deployment scripts (including the `PaymentReport` creation script) are executed during publish.

## Enabling and testing the job
- The job is disabled after creation. To enable it:
  - SSMS: Object Explorer ? SQL Server Agent ? Jobs ? right-click `PaymentReport` ? __Enable__.
  - T-SQL:
    ```sql
    EXEC msdb.dbo.sp_update_job @job_name = 'PaymentReport', @enabled = 1;
    ```
- To start the job immediately: