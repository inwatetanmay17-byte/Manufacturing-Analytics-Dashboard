# KPI Calculations

This document defines the aggregate KPI calculations used in the SQL analysis and dashboard. The calculations are based on summed quantity fields, rather than a simple average of row-level percentage strings.

## 1. Total planned production

**Formula**

`Total Planned Production = SUM(Planned_Qty)`

**Dataset result:** 241,064 units

## 2. Total production

**Formula**

`Total Production = SUM(Actual_Qty)`

**Dataset result:** 223,489 units

## 3. Total rejected quantity

**Formula**

`Total Rejected = SUM(Rejected_Qty)`

**Dataset result:** 5,927 units

## 4. Production efficiency

**Formula**

`Production Efficiency (%) = (SUM(Actual_Qty) / SUM(Planned_Qty)) × 100`

**Calculation**

`(223,489 / 241,064) × 100 = 92.71%`

**Dataset result:** 92.71%

This is a weighted aggregate calculation using total actual production divided by total planned production. It is not the arithmetic average of the row-level efficiency percentages.

## 5. Rejection rate

**Formula**

`Rejection Rate (%) = (SUM(Rejected_Qty) / SUM(Actual_Qty)) × 100`

**Calculation**

`(5,927 / 223,489) × 100 = 2.65%`

**Dataset result:** 2.65%

This calculation uses total rejected quantity divided by total actual quantity.

## 6. Total downtime

**Formula**

`Total Downtime (minutes) = SUM(Downtime_Min)`

**Dataset result:** 15,347 minutes

## 7. Group-level calculations

For machine-wise, shift-wise, and product-wise comparisons, the same formulas are applied within each group:

- Group efficiency = `SUM(Actual_Qty) / SUM(Planned_Qty) × 100`
- Group rejection rate = `SUM(Rejected_Qty) / SUM(Actual_Qty) × 100`
- Group downtime = `SUM(Downtime_Min)`

## Notes

- The CSV's `Production_Efficiency` and `Rejection_Rate` fields are stored as text strings with percent signs. The aggregate calculations above use the numeric quantity columns instead.
- SQL uses `NULLIF` in the denominators to avoid division-by-zero errors.
- Dashboard card labels may display rounded values (for example, 223K, 6K, and 15K). The exact dataset totals are listed above.
