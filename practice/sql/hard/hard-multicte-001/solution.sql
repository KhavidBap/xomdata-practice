-- Xom Data · Multi-level profit margin analysis
-- Problem: https://xomdata.com/practice/hard-multicte-001
-- Solved: 2026-10-05

WITH metric AS (
    SELECT
        p.category
        , p.name AS product_name
        , SUM(o.quantity * o.price) AS revenue
        , SUM(o.quantity * p.unit_cost) AS cost
        , SUM(o.quantity * o.price - o.quantity * p.unit_cost) AS profit
        , SUM((o.quantity * o.price - o.quantity * p.unit_cost)) * 100.0
        / NULLIF(SUM(o.quantity * o.price), 0) AS margin_pct

    FROM products AS p
    LEFT JOIN orders AS o
    ON p.id = o.product_id
    GROUP BY
        p.category
        , p.name
)
SELECT
    category
    , product_name
    , COALESCE(revenue, 0) AS revenue
    , COALESCE(cost, 0) AS cost
    , COALESCE(profit, 0) AS profit
    , ROUND(margin_pct, 2) AS margin_pct
    , DENSE_RANK() OVER(
        PARTITION BY category 
        ORDER BY profit DESC
    ) AS rank_in_cat
    , ROUND(
        profit * 100.0
        / NULLIF(MAX(profit) OVER(PARTITION BY category),0)
    , 2) AS pct_of_top_in_cat
FROM metric
ORDER BY category, rank_in_cat, product_name;
