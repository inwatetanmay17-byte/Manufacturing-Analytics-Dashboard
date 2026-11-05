create database manufacturing_analysis;
use manufacturing_analysis;

CREATE TABLE production_data (
    Production_Date DATE,
    Machine_ID VARCHAR(10),
    Product VARCHAR(50),
    Shift VARCHAR(10),
    Planned_Qty INT,
    Actual_Qty INT,
    Rejected_Qty INT,
    Downtime_Min INT,
    Defect_Type VARCHAR(50)
);
show tables;
describe production_data;
SELECT
    Machine_ID,
    SUM(Actual_Qty) / SUM(Planned_Qty) * 100 AS Efficiency
FROM production_data
GROUP BY Machine_ID;
SELECT COUNT(*) AS total_records
FROM production_data;
SELECT *
FROM production_data
LIMIT 10;

SELECT SUM(Actual_Qty) AS Total_Production
FROM production_data;

SELECT
    SUM(Planned_Qty) AS Total_Planned,
    SUM(Actual_Qty) AS Total_Actual,
    SUM(Rejected_Qty) AS Total_Rejected,
    SUM(Downtime_Min) AS Total_Downtime,
    ROUND(SUM(Actual_Qty) / SUM(Planned_Qty) * 100, 2) AS Production_Efficiency,
    ROUND(SUM(Rejected_Qty) / SUM(Actual_Qty) * 100, 2) AS Rejection_Rate
FROM production_data; 

SELECT
    Machine_ID,
    SUM(Planned_Qty) AS Planned_Production,
    SUM(Actual_Qty) AS Actual_Production,
    SUM(Rejected_Qty) AS Rejected_Quantity,
    SUM(Downtime_Min) AS Total_Downtime,
    ROUND(SUM(Actual_Qty) / SUM(Planned_Qty) * 100, 2) AS Efficiency,
    ROUND(SUM(Rejected_Qty) / SUM(Actual_Qty) * 100, 2) AS Rejection_Rate
FROM production_data
GROUP BY Machine_ID
ORDER BY Efficiency DESC;


SELECT
    Shift,
    SUM(Actual_Qty) AS Production,
    SUM(Rejected_Qty) AS Rejected,
    SUM(Downtime_Min) AS Downtime,
    ROUND(SUM(Actual_Qty) / SUM(Planned_Qty) * 100, 2) AS Efficiency,
    ROUND(SUM(Rejected_Qty) / SUM(Actual_Qty) * 100, 2) AS Rejection_Rate
FROM production_data
GROUP BY Shift
ORDER BY Efficiency DESC;

SELECT
    Product,
    SUM(Actual_Qty) AS Production,
    SUM(Rejected_Qty) AS Rejected,
    SUM(Downtime_Min) AS Downtime,
    ROUND(SUM(Actual_Qty) / SUM(Planned_Qty) * 100, 2) AS Efficiency
FROM production_data
GROUP BY Product
ORDER BY Production DESC;

SELECT
    Defect_Type,
    SUM(Rejected_Qty) AS Rejected_Quantity,
    COUNT(*) AS Occurrences
FROM production_data
GROUP BY Defect_Type
ORDER BY Rejected_Quantity DESC;

SELECT
    Machine_ID,
    SUM(Downtime_Min) AS Total_Downtime
FROM production_data
GROUP BY Machine_ID
ORDER BY Total_Downtime DESC;

SELECT
    DATE_FORMAT(Production_Date, '%Y-%m') AS Month,
    SUM(Actual_Qty) AS Production,
    SUM(Rejected_Qty) AS Rejected
FROM production_data
GROUP BY DATE_FORMAT(Production_Date, '%Y-%m')
ORDER BY Month;