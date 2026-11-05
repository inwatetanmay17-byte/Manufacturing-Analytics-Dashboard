CREATE DATABASE IF NOT EXISTS manufacturing_analysis;
USE manufacturing_analysis;

CREATE TABLE IF NOT EXISTS production_data (
    Production_Date DATE,
    Machine_ID VARCHAR(10),
    Product VARCHAR(50),
    Shift VARCHAR(10),
    Planned_Qty INT,
    Actual_Qty INT,
    Rejected_Qty INT,
    Downtime_Min INT,
    Production_Efficiency VARCHAR(10),
    Rejection_Rate VARCHAR(10)
);


SHOW TABLES;
DESCRIBE production_data;


SELECT COUNT(*) AS total_records
FROM production_data;


SELECT *
FROM production_data
LIMIT 10;


SELECT
    SUM(Planned_Qty) AS Total_Planned_Production,
    SUM(Actual_Qty) AS Total_Production,
    SUM(Rejected_Qty) AS Total_Rejected,
    SUM(Downtime_Min) AS Total_Downtime_Minutes,
    ROUND(100.0 * SUM(Actual_Qty) / NULLIF(SUM(Planned_Qty), 0), 2)
        AS Production_Efficiency_Percent,
    ROUND(100.0 * SUM(Rejected_Qty) / NULLIF(SUM(Actual_Qty), 0), 2)
        AS Rejection_Rate_Percent
FROM production_data;

SELECT
    Machine_ID,
    SUM(Planned_Qty) AS Planned_Production,
    SUM(Actual_Qty) AS Actual_Production,
    SUM(Rejected_Qty) AS Rejected_Quantity,
    SUM(Downtime_Min) AS Total_Downtime_Minutes,
    ROUND(100.0 * SUM(Actual_Qty) / NULLIF(SUM(Planned_Qty), 0), 2)
        AS Production_Efficiency_Percent,
    ROUND(100.0 * SUM(Rejected_Qty) / NULLIF(SUM(Actual_Qty), 0), 2)
        AS Rejection_Rate_Percent
FROM production_data
GROUP BY Machine_ID
ORDER BY Production_Efficiency_Percent DESC;


SELECT
    Shift,
    SUM(Planned_Qty) AS Planned_Production,
    SUM(Actual_Qty) AS Actual_Production,
    SUM(Rejected_Qty) AS Rejected_Quantity,
    SUM(Downtime_Min) AS Total_Downtime_Minutes,
    ROUND(100.0 * SUM(Actual_Qty) / NULLIF(SUM(Planned_Qty), 0), 2)
        AS Production_Efficiency_Percent,
    ROUND(100.0 * SUM(Rejected_Qty) / NULLIF(SUM(Actual_Qty), 0), 2)
        AS Rejection_Rate_Percent
FROM production_data
GROUP BY Shift
ORDER BY Production_Efficiency_Percent DESC;


SELECT
    Product,
    SUM(Planned_Qty) AS Planned_Production,
    SUM(Actual_Qty) AS Actual_Production,
    SUM(Rejected_Qty) AS Rejected_Quantity,
    SUM(Downtime_Min) AS Total_Downtime_Minutes,
    ROUND(100.0 * SUM(Actual_Qty) / NULLIF(SUM(Planned_Qty), 0), 2)
        AS Production_Efficiency_Percent,
    ROUND(100.0 * SUM(Rejected_Qty) / NULLIF(SUM(Actual_Qty), 0), 2)
        AS Rejection_Rate_Percent
FROM production_data
GROUP BY Product
ORDER BY Actual_Production DESC;


SELECT
    Machine_ID,
    SUM(Downtime_Min) AS Total_Downtime_Minutes
FROM production_data
GROUP BY Machine_ID
ORDER BY Total_Downtime_Minutes DESC;


SELECT
    DATE_FORMAT(Production_Date, '%Y-%m') AS Production_Month,
    SUM(Planned_Qty) AS Planned_Production,
    SUM(Actual_Qty) AS Actual_Production,
    SUM(Rejected_Qty) AS Rejected_Quantity,
    ROUND(100.0 * SUM(Actual_Qty) / NULLIF(SUM(Planned_Qty), 0), 2)
        AS Production_Efficiency_Percent,
    ROUND(100.0 * SUM(Rejected_Qty) / NULLIF(SUM(Actual_Qty), 0), 2)
        AS Rejection_Rate_Percent
FROM production_data
GROUP BY DATE_FORMAT(Production_Date, '%Y-%m')
ORDER BY Production_Month;

SELECT
    SUM(Production_Date IS NULL) AS Missing_Production_Date,
    SUM(Machine_ID IS NULL OR Machine_ID = '') AS Missing_Machine_ID,
    SUM(Product IS NULL OR Product = '') AS Missing_Product,
    SUM(Shift IS NULL OR Shift = '') AS Missing_Shift,
    SUM(Planned_Qty IS NULL) AS Missing_Planned_Qty,
    SUM(Actual_Qty IS NULL) AS Missing_Actual_Qty,
    SUM(Rejected_Qty IS NULL) AS Missing_Rejected_Qty,
    SUM(Downtime_Min IS NULL) AS Missing_Downtime_Min
FROM production_data;


SELECT *
FROM production_data
WHERE Planned_Qty < 0
   OR Actual_Qty < 0
   OR Rejected_Qty < 0
   OR Downtime_Min < 0
   OR Rejected_Qty > Actual_Qty;
