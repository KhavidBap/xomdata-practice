-- Xom Data · Closing a second order within a month
-- Problem: https://xomdata.com/practice/medium-repeat-004
-- Solved: 2026-09-17

WITH ranked AS (
    SELECT
        customer_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS rn
    FROM orders
),
first_second AS (
    SELECT
        customer_id,
        MAX(CASE WHEN rn = 1 THEN order_date END) AS first_order_date,
        MAX(CASE WHEN rn = 2 THEN order_date END) AS second_order_date
    FROM ranked
    WHERE rn <= 2
    GROUP BY customer_id
)
SELECT
    customer_id,
    first_order_date,
    second_order_date,
    julianday(second_order_date) - julianday(first_order_date) AS days_to_second
FROM first_second
WHERE second_order_date IS NOT NULL
  AND julianday(second_order_date) - julianday(first_order_date) <= 30;
