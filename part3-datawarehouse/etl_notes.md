## ETL Decisions

### Decision 1 — Date Format Standardization

Problem:
The raw dataset had dates in different formats like 01-01-23, 2023/01/01. This makes it hard to sort or group data properly by month or year.

Resolution:
I converted all dates into a single standard format YYYY-MM-DD. This helped in creating the date dimension (dim_date) and made time-based analysis like monthly sales trends accurate and consistent.

### Decision 2 — Category Name Standardization

Problem:
Product categories were written in different ways such as electronics, ELECTRONICS, and Electronics. This would create duplicate categories during analysis.

Resolution:
I cleaned and standardized all category names to proper format (like Electronics, Furniture, Groceries). This ensured correct grouping and avoided duplicate entries in reports.

### Decision 3 — Handling Missing Values

Problem:
Some records had missing (NULL) values in important fields like quantity, store name, or product details. This could lead to incorrect calculations or errors.

Resolution:
I handled missing values by either removing incomplete rows or filling them with valid values where possible. This ensured that only clean and reliable data was loaded into the warehouse for accurate analysis.