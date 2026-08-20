-- Xom Data · Each customer's debut month
-- Problem: https://xomdata.com/practice/medium-cohort-003
-- Solved: 2026-08-20

select customer_id, min(strftime('%Y-%m', order_date)) as cohort_month
from orders
group by customer_id
order by cohort_month, customer_id
