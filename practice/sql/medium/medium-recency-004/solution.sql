-- Xom Data · Three Freshness Circles of the Customer Base
-- Problem: https://xomdata.com/practice/medium-recency-004
-- Solved: 2026-09-16

WITH last_order AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
),
fresh AS (
    SELECT
        customer_id,
        CASE
            WHEN julianday('2024-06-30') - julianday(last_order_date) <= 30 THEN 'hot'
            WHEN julianday('2024-06-30') - julianday(last_order_date) <= 90 THEN 'warm'
            ELSE 'cold'
        END AS freshness_bucket
    FROM last_order
)
SELECT
    freshness_bucket,
    COUNT(*) AS customer_count
FROM fresh
GROUP BY freshness_bucket
ORDER BY
    CASE freshness_bucket
        WHEN 'hot' THEN 1
        WHEN 'warm' THEN 2
        WHEN 'cold' THEN 3
    END;
