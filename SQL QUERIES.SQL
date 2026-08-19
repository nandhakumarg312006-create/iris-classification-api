 USE churnDB;
 GO
 SELECT COUNT(*)AS TotalCustomers
 FROM dbo.[Telco-Customer-Churn]

 SELECT TOP 10*
 FROM[churnDB].[dbo].
 [Telco-Customer-Churn];

 SELECT COUNT(*)AS ChurnedCustomers
 FROM dbo.[Telco-Customer-Churn]
 where churn=1;
