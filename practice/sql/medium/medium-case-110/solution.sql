-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-07-13

WITH total AS (
    SELECT p.name, p.categories, SUM(t.quantity) AS total_sold
    FROM products p
    INNER JOIN transactions t ON t.product_id = p.id
    GROUP BY p.name, p.categories
), classify AS (
    SELECT name, categories, total_sold, 
    CASE WHEN total_sold >= 100 THEN 'Best Seller'
        WHEN total_sold >= 50 THEN 'Average'
        ELSE 'Slow Mover' END AS classification
    FROM total
)

SELECT name, categories, total_sold, classification,
    DENSE_RANK() OVER (PARTITION BY categories ORDER BY total_sold DESC) AS rank_in_cat,
    ROUND(total_sold * 1.0 / SUM(total_sold) OVER (PARTITION BY categories) * 100, 2) AS pct_of_cat_total
FROM classify
ORDER BY categories, total_sold DESC, name
