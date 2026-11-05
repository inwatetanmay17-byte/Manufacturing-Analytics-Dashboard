# Project Methodology

## 1. Project overview

**Project:** Manufacturing Production & Quality Analysis  
**Tools:** Microsoft Excel, MySQL, and Microsoft Power BI  
**Dataset:** `Manufacturing_Production_Data.csv`  
**Analysis period:** 1 June 2026 to 29 August 2026  
**Records:** 450

This project demonstrates an end-to-end analysis workflow for production, quality, machine performance, shift performance, and downtime. The dataset is synthetic and was generated with the assistance of ChatGPT for educational and portfolio purposes. It does not represent measurements from a real factory, company, or production line.

## 2. Objective

The objective is to organize production data, calculate operational KPIs, compare performance across machines, shifts, and products, and present the results in an interactive Power BI dashboard.

The analysis focuses on:
- Production against planned quantity.
- Rejected quantity and rejection rate.
- Production efficiency.
- Machine-wise downtime.
- Shift-wise and product-wise performance.
- Daily production movement over the analysis period.

## 3. Dataset description

The CSV contains 450 rows and 10 columns.

| Column | Description |
|---|---|
| `Production_Date` | Date associated with the production record |
| `Machine_ID` | Machine identifier |
| `Product` | Product category |
| `Shift` | Shift identifier (A, B, or C) |
| `Planned_Qty` | Planned production quantity |
| `Actual_Qty` | Actual production quantity recorded |
| `Rejected_Qty` | Quantity rejected |
| `Downtime_Min` | Downtime in minutes |
| `Production_Efficiency` | Row-level efficiency stored as a percentage string |
| `Rejection_Rate` | Row-level rejection rate stored as a percentage string |

The records cover five machines (M01–M05), three shifts (A–C), and five product categories (Bearing, Flange, Gear, Housing, and Shaft).

## 4. Workflow

### Step 1 — Data inspection in Excel
The CSV was inspected to understand its structure, fields, date coverage, and quantitative measures. The analysis uses the quantity and downtime fields as the basis for aggregate KPIs.

### Step 2 — SQL analysis in MySQL
A `production_data` table was defined to match the CSV's 10 columns. SQL queries were prepared to:
- Check the imported record count and preview records.
- Calculate overall production and quality KPIs.
- Compare machine-wise, shift-wise, and product-wise performance.
- Summarize machine downtime.
- Review monthly production and rejection trends.
- Check for missing required values and quantities outside basic logical bounds.

The percentage columns in the CSV are stored as text values containing a percent sign. The aggregate KPI queries therefore recalculate efficiency and rejection rate from the numeric quantity columns instead of averaging those text values.

### Step 3 — Dashboard development in Power BI
The Power BI report presents KPI cards and charts for machine-wise production efficiency, machine-wise downtime, shift-wise production efficiency, and daily production trend. Slicers allow the report to be filtered by shift, date range, product, and machine.

### Step 4 — Interpretation
The results are described as patterns in this synthetic dataset. They should not be interpreted as verified operational conclusions about a real manufacturing facility.

## 5. Scope and limitations

- The dataset is synthetic, not real industrial or company data.
- The analysis is descriptive; it does not establish causes of low efficiency, rejection, or downtime.
- No defect-type analysis is included because the supplied CSV has no `Defect_Type` column and no separate defect-level dataset was supplied.
- The report's findings depend on the fields and values in this dataset and should not be generalized to real manufacturing operations.
