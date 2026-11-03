-- Retail Sales & Profitability Analysis
-- SQL dialect: PostgreSQL
-- Dataset: orders.csv (600 synthetic sample orders, generated for portfolio practice)
-- Import the CSV into a table named retail_orders before running these queries.

-- 1. Overall KPI snapshot
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct,
    ROUND(AVG(sales)::numeric, 2) AS average_order_value
FROM retail_orders;

-- 2. Monthly sales and profit trend
SELECT
    DATE_TRUNC('month', order_date::date)::date AS month,
    ROUND(SUM(sales)::numeric, 2) AS sales,
    ROUND(SUM(profit)::numeric, 2) AS profit
FROM retail_orders
GROUP BY 1
ORDER BY 1;

-- 3. Category performance
SELECT
    category,
    COUNT(DISTINCT order_id) AS orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(sales)::numeric, 2) AS sales,
    ROUND(SUM(profit)::numeric, 2) AS profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM retail_orders
GROUP BY category
ORDER BY sales DESC;

-- 4. Regional performance
SELECT
    region,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales)::numeric, 2) AS sales,
    ROUND(SUM(profit)::numeric, 2) AS profit
FROM retail_orders
GROUP BY region
ORDER BY sales DESC;

-- 5. Product contribution
SELECT
    product,
    SUM(quantity) AS units_sold,
    ROUND(SUM(sales)::numeric, 2) AS sales,
    ROUND(SUM(profit)::numeric, 2) AS profit
FROM retail_orders
GROUP BY product
ORDER BY profit DESC
LIMIT 10;

-- 6. Discount bands and profitability
SELECT
    CASE
        WHEN discount_rate = 0 THEN 'No discount'
        WHEN discount_rate <= 0.10 THEN '1-10%'
        WHEN discount_rate <= 0.20 THEN '11-20%'
        ELSE '21-25%'
    END AS discount_band,
    COUNT(*) AS order_lines,
    ROUND(AVG(discount_rate) * 100, 1) AS avg_discount_pct,
    ROUND(SUM(sales)::numeric, 2) AS sales,
    ROUND(SUM(profit)::numeric, 2) AS profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM retail_orders
GROUP BY 1
ORDER BY MIN(discount_rate);

-- 7. Orders with negative profit (if any)
SELECT order_id, order_date, region, category, product, discount_rate, sales, cost, profit
FROM retail_orders
WHERE profit < 0
ORDER BY profit ASC;
