USE ChurnDB;
GO
SELECT TOP 10*
FROM dbo.vw_ChurnData;


SELECT
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(5,2)
    ) AS ChurnPercentage
FROM dbo.vw_ChurnData;

SELECT
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(5,2)
    ) AS ChurnRate
FROM dbo.vw_ChurnData
GROUP BY Contract
ORDER BY ChurnRate DESC;

SELECT
    Churn,
    COUNT(*) AS CustomerCount,
    AVG(MonthlyCharges) AS AverageMonthlyCharges
FROM dbo.vw_ChurnData
GROUP BY Churn;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS TenureGroup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(5,2)
    ) AS ChurnRate
FROM dbo.vw_ChurnData
GROUP BY
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END
ORDER BY ChurnRate DESC;

SELECT
    InternetService,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(5,2)
    ) AS ChurnRate
FROM dbo.vw_ChurnData
GROUP BY InternetService
ORDER BY ChurnRate DESC;