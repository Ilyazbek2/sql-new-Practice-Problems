WITH monthly_sales AS (
    SELECT
        product_id,
        DATE_TRUNC('month', sale_date) AS month,
        SUM(amount) AS total_sales
    FROM sales
    GROUP BY product_id, DATE_TRUNC('month', sale_date)
),
growth AS (
    SELECT *,
           total_sales - LAG(total_sales) OVER (
               PARTITION BY product_id ORDER BY month
           ) AS growth
    FROM monthly_sales
)
SELECT *
FROM growth
WHERE growth < 0;
