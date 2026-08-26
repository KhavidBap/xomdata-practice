-- Xom Data · The customer's joining month on every order
-- Problem: https://xomdata.com/practice/medium-cohort-001
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
select customer_name, order_date, 
    strftime('%Y-%m', min(order_date) over (partition by customer_name order by order_date)) as cohort_month
from orders
