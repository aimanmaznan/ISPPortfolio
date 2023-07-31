-- CUSTOMER DEMOGRAPHICS ANALYSIS

SELECT *
FROM dbo.CustomerData

-- 1) Customer Count in Each Age Group

SELECT AgeGroup, COUNT(*) AS CustomerCount
FROM dbo.CustomerData
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- 2) The percentage of male and female customers.

SELECT Gender, COUNT(*) AS CustomerCount, (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS Percentage
FROM dbo.CustomerData
GROUP BY Gender
ORDER BY CustomerCount;

-- 3) Customer count in each city.

SELECT City, COUNT(*) AS CustomerCount
FROM dbo.CustomerData
GROUP BY City
ORDER BY CustomerCount



-- SUBSCRIPTION PLAN ANALYSIS

-- 1) Customers count per subscription plan.

SELECT [Subscription Plan], COUNT(*) AS CustomerCount
FROM dbo.CustomerData
GROUP BY [Subscription Plan];

-- 2) Average revenue per user (ARPU) per plan.

SELECT [Subscription Plan], AVG(TotalYearlyRevenue) AS AverageRevenuePerUser
FROM dbo.CustomerData
GROUP BY [Subscription Plan];

--SELECT [Subscription Plan], SUM(TotalYearlyRevenue) AS TotalRevenue
--FROM dbo.CustomerData
--GROUP BY [Subscription Plan];

-- 3) Churn rate per plan

SELECT
    [Subscription Plan],
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS ChurnRate
FROM dbo.CustomerData
GROUP BY [Subscription Plan];

-- CUSTOMER USAGE PATTERNS ANALYSIS

-- 1) Average data consumption, call minutes, and SMS usage per customer.

SELECT  [Customer ID],
    AVG(TotalDataUsage) AS AvgDataUsage,
    AVG(TotalCallMinutes) AS AvgCallMinutes,
    AVG(TotalSMSUsage) AS AvgSMSUsage
FROM dbo.CustomerData
GROUP BY [Customer ID];

-- 2) Is there correlation between usage patterns and customer churn?

SELECT Churn,
    AVG(TotalDataUsage) AS AvgDataUsage,
    AVG(TotalCallMinutes) AS AvgCallMinutes,
    AVG(TotalSMSUsage) AS AvgSMSUsage
FROM dbo.CustomerData
GROUP BY Churn;


--Beyond this is what cannot be done as I used synthetic data that i created myself, hence the lack of real world data does not allow me to do further analysis.

-- CUSTOMER CHURN ANALYSIS

-- 1) Define churn as customers who have canceled their subscriptions in a specific period (e.g., the last quarter).

-- 2) Calculate the churn rate for the selected period.
--		by dividing the number of churned customers by the total number of customers for the selected period.

-- 3) Identify the primary reasons for churn (e.g., late payments, low usage).
--		need additional information or data to identify the primary reasons for churn.


--LOYALTY AND TENURE ANALYSIS

-- 1) Calculate the average customer tenure (time since signup) for each subscription plan.
--		use the DATEDIFF function to calculate the tenure.

-- 2) Identify long-term and high-value customers based on their tenure and billing amount.
--		require additional criteria to define "long-term" and "high-value" customers.


-- PAYMENT AND REVENUE ANALYSIS

-- 1) Calculate the average monthly revenue for each month.
--		use the GROUP BY clause along with the DATEPART or MONTH function.

-- 2) Analyze payment patterns, such as the distribution of payment dates and any trends in late payments.
--		use the payment dates and analyze payment patterns.










-- ALTERING AND UPDATING TABLE

--ALTER TABLE dbo.CustomerData
--ADD AgeGroup varchar(10);

--UPDATE dbo.CustomerData
--SET AgeGroup =
--	CASE 
--		WHEN Age >= 18 AND Age <= 29 THEN '18-29'
--		WHEN Age >= 30 AND Age <= 39 THEN '30-39'
--		WHEN Age >= 40 AND Age <= 49 THEN '40-49'
--		WHEN Age >= 50 AND Age <= 59 THEN '50-59'
--		ELSE '60+'
--	END
--WHERE Age IS NOT NULL;

--ALTER TABLE dbo.CustomerData
--ADD AvgYearlyRevenue float
--ALTER TABLE dbo.CustomerData
--ADD TotalYearlyRevenue float

--UPDATE dbo.CustomerData
--SET TotalYearlyRevenue = [Billing Amount (MYR) 1] + [Billing Amount (MYR) 2] + [Billing Amount (MYR) 3] +
--                        [Billing Amount (MYR) 4] + [Billing Amount (MYR) 5] + [Billing Amount (MYR) 6] +
--                        [Billing Amount (MYR) 7] + [Billing Amount (MYR) 8] + [Billing Amount (MYR) 9] +
--                        [Billing Amount (MYR) 10] + [Billing Amount (MYR) 11] + [Billing Amount (MYR) 12],
--    AvgYearlyRevenue = ( [Billing Amount (MYR) 1] + [Billing Amount (MYR) 2] + [Billing Amount (MYR) 3] +
--                         [Billing Amount (MYR) 4] + [Billing Amount (MYR) 5] + [Billing Amount (MYR) 6] +
--                         [Billing Amount (MYR) 7] + [Billing Amount (MYR) 8] + [Billing Amount (MYR) 9] +
--                         [Billing Amount (MYR) 10] + [Billing Amount (MYR) 11] + [Billing Amount (MYR) 12]
--                       ) / 12;

--ALTER TABLE dbo.CustomerData
--ADD TotalDataUsage float, TotalCallMinutes float, TotalSMSUsage float

--UPDATE dbo.CustomerData
--SET TotalDataUsage = [Data Usage (GB) 1] + [Data Usage (GB) 2] + [Data Usage (GB) 3] +
--                        [Data Usage (GB) 4] + [Data Usage (GB) 5] + [Data Usage (GB) 6] +
--                        [Data Usage (GB) 7] + [Data Usage (GB) 8] + [Data Usage (GB) 9] +
--                        [Data Usage (GB) 10] + [Data Usage (GB) 11] + [Data Usage (GB) 12],
--	TotalCallMinutes = [Call Minutes 1] + [Call Minutes 2] + [Call Minutes 3] +
--                        [Call Minutes 4] + [Call Minutes 5] + [Call Minutes 6] +
--                        [Call Minutes 7] + [Call Minutes 8] + [Call Minutes 9] +
--                        [Call Minutes 10] + [Call Minutes 11] + [Call Minutes 12],
--	TotalSMSUsage = [SMS Usage 1] + [SMS Usage 2] + [SMS Usage 3] +
--                        [SMS Usage 4] + [SMS Usage 5] + [SMS Usage 6] +
--                        [SMS Usage 7] + [SMS Usage 8] + [SMS Usage 9] +
--                        [SMS Usage 10] + [SMS Usage 11] + [SMS Usage 12];
