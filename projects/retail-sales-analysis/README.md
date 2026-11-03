# Retail Sales & Profitability Analysis

**Status:** Portfolio practice project  
**Tools:** SQL (PostgreSQL), CSV; Power BI-ready analysis  
**Dataset:** 600 synthetic order records generated specifically for this project.

## Business questions
1. What are the overall sales, profit, order volume and profit margin?
2. How do sales and profit change month to month?
3. Which product categories and regions contribute most?
4. Which products are the strongest contributors?
5. How do discount levels relate to profitability?

## Dataset fields
`order_id`, `order_date`, `region`, `category`, `product`, `quantity`, `unit_price`, `discount_rate`, `sales`, `cost`, `profit`.

## Dataset snapshot
- Orders: 600
- Units sold: 2,357
- Sales: $199466.72
- Profit: $52623.37
- Overall profit margin: 26.38%

These values describe the generated sample only; they are not real company results.

## Files
- `orders.csv` — sample dataset
- `analysis.sql` — PostgreSQL queries for KPI, monthly, category, regional, product and discount analysis

## Run the analysis
1. Create a PostgreSQL database.
2. Import `orders.csv` into a table named `retail_orders` (ensure `order_date` is stored as a date and numeric columns as numeric types).
3. Run the queries in `analysis.sql`.

## Suggested Power BI report
Build a one-page report with:
- KPI cards: Sales, Profit, Profit Margin, Orders and Units
- Monthly sales and profit trend (line chart)
- Sales and profit by category (clustered bar chart)
- Regional sales (bar chart or map)
- Profit by product (bar chart)
- Discount band vs. profit margin (column chart)

Suggested slicers: date, region and category.

## Important limitation
This is a synthetic practice dataset. It is useful for demonstrating query structure and dashboard thinking, but should not be presented as analysis of a real retailer. A Power BI report file is not included yet.
