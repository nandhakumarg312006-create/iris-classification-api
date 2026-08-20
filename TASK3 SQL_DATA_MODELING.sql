1. Check column data types
SELECT
    c.name AS ColumnName,
    t.name AS DataType,
    c.max_length AS MaxLength
FROM sys.columns c
JOIN sys.types t
    ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('dbo.Telco-Customer-Churn')
ORDER BY c.column_id;


-- 2. Check NULL TotalCharges values
SELECT COUNT(*) AS NullTotalCharges
FROM [dbo].[Telco-Customer-Churn]
WHERE TotalCharges IS NULL;


-- 3. Test TotalCharges cleaning and conversion
SELECT
    customerID,
    TotalCharges,
    TRY_CONVERT(
        decimal(18,2),
        NULLIF(LTRIM(RTRIM(TotalCharges)), '')
    ) AS CleanTotalCharges
FROM [dbo].[Telco-Customer-Churn];


-- 4. Create clean View
CREATE VIEW vw_ChurnData AS
SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    TRY_CONVERT(
        decimal(18,2),
        NULLIF(LTRIM(RTRIM(TotalCharges)), '')
    ) AS TotalCharges,
    Churn
FROM [dbo].[Telco-Customer-Churn];


-- 5. Test the View
SELECT TOP 10 *
FROM dbo.vw_ChurnData;


-- 6. Verify TotalCharges is numeric
SELECT
    c.name AS ColumnName,
    t.name AS DataType,
    c.precision,
    c.scale
FROM sys.columns c
JOIN sys.types t
    ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('dbo.vw_ChurnData')
  AND c.name = 'TotalCharges';


-- 7. Verify NULL values in the clean View
SELECT COUNT(*) AS NullTotalCharges
FROM dbo.vw_ChurnData
WHERE TotalCharges IS NULL;
