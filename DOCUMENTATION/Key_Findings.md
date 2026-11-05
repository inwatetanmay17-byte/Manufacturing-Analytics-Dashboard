# Key Findings

## Dataset summary

The following findings are calculated from the supplied synthetic dataset (450 records, 1 June 2026–29 August 2026). They are descriptive results for this portfolio exercise, not claims about a real manufacturing facility.

| Overall metric | Result |
|---|---:|
| Planned production | 241,064 |
| Actual production | 223,489 |
| Rejected quantity | 5,927 |
| Production efficiency | 92.71% |
| Rejection rate | 2.65% |
| Total downtime | 15,347 minutes |

## 1. Machine-wise performance

| Machine | Production efficiency | Rejection rate | Downtime (minutes) |
|---|---:|---:|---:|
| M04 | 98.92% | 1.55% | 1,855 |
| M01 | 94.16% | 1.82% | 2,335 |
| M05 | 93.09% | 2.96% | 3,447 |
| M02 | 91.01% | 2.58% | 2,727 |
| M03 | 86.35% | 4.56% | 4,983 |

- M04 has the highest production efficiency (98.92%) and the lowest rejection rate (1.55%) among the five machines.
- M03 has the lowest production efficiency (86.35%), the highest rejection rate (4.56%), and the highest downtime (4,983 minutes).
- These are associations within the dataset; the analysis does not establish that downtime caused the lower efficiency or higher rejection rate.

## 2. Shift-wise performance

| Shift | Production efficiency | Rejection rate | Downtime (minutes) |
|---|---:|---:|---:|
| C | 93.05% | 2.59% | 4,857 |
| B | 92.90% | 2.56% | 4,956 |
| A | 92.22% | 2.80% | 5,534 |

- Shift C has the highest production efficiency (93.05%) in this dataset.
- Shift A has the lowest production efficiency (92.22%) and the highest downtime (5,534 minutes).
- The efficiency difference between the highest and lowest shifts is approximately 0.82 percentage points.

## 3. Product-wise performance

| Product | Production efficiency | Rejection rate | Downtime (minutes) |
|---|---:|---:|---:|
| Bearing | 93.32% | 2.49% | 2,946 |
| Shaft | 92.82% | 2.60% | 3,024 |
| Gear | 92.76% | 2.65% | 3,425 |
| Flange | 92.33% | 2.78% | 3,565 |
| Housing | 92.17% | 2.76% | 2,387 |

- Bearing has the highest production efficiency (93.32%) and the lowest rejection rate (2.49%) among the product categories.
- Housing has the lowest production efficiency (92.17%).
- Flange has the highest product-wise downtime total (3,565 minutes).

## 4. Dashboard coverage

The Power BI dashboard provides:
- KPI cards for total production, rejected quantity, production efficiency, rejection rate, and downtime.
- Machine-wise production efficiency.
- Machine-wise downtime.
- Shift-wise production efficiency.
- Daily production trend.
- Slicers for shift, date range, product, and machine.

## Interpretation and limitations

The dataset suggests differences in performance across machines, shifts, and product categories. For example, M03 is the clearest area to investigate within this synthetic dataset because it combines the lowest efficiency with the highest rejection rate and downtime. In a real factory, such a pattern would warrant further investigation using maintenance logs, process settings, operator records, and defect-level data. Those additional sources are not part of this project, so no root cause or improvement claim is made here.

The dataset was generated with ChatGPT for educational and portfolio purposes. It is synthetic and should not be represented as real factory data.
