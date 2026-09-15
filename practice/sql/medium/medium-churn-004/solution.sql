-- Xom Data · The blacklist of long-silent customers
-- Problem: https://xomdata.com/practice/medium-churn-004
-- Solved: 2026-09-15

select customer_id, 
    max(order_date) as last_order_date,
    julianday('2024-06-30') - julianday(max(order_date)) as days_silent
from orders
group by customer_id
having julianday('2024-06-30') - julianday(max(order_date)) > 90
order by days_silent desc, customer_id
