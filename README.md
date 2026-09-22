# Customer Support Operations Analysis

Operational analysis of **4,200 synthetic support tickets from 2025**, using **SQL as the analysis layer** and **Excel as the reporting layer**.

## Technologies
SQL • Excel • Relational data modelling

## Business Questions
- How do volume, SLA compliance, escalations and CSAT change over time?
- Which issue categories create the greatest operational pressure?
- How balanced are agent workload and service quality?
- Which customer/channel combinations require attention?

## Data Model
`tickets` is the fact table. `agents`, `customers`, and `categories` are lookup tables. Source CSVs are in `data/`.

## SQL
`sql/support_operations_analysis.sql` includes joins, grouped KPIs, a CTE for agent performance, and a window function for escalation contribution.

## Key Findings
- July–September averaged **58.5% SLA compliance**, versus **80.9%** in the other months.
- Escalations averaged **15.1%** in July–September versus **12.6%** otherwise.
- **Technical Issue** had the lowest category-level SLA compliance at **70.4%**.
- The mid-year deterioration coincided with slower resolution and more escalations, indicating an operational-pressure period rather than a simple ticket-volume change.

## Repository
```text
customer-support-operations-analysis/
├── README.md
├── Customer_Support_Operations_Report.xlsx
├── data/
├── images/
└── sql/
```

> Synthetic portfolio data; findings do not represent a real company.
