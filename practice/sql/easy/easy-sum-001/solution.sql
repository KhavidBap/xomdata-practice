-- Xom Data · Revenue from delivered orders
-- Problem: https://xomdata.com/practice/easy-sum-001
-- Solved: 2026-07-08

-- Viết SQL của bạn ở đây
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Delivered'
