-- Xom Data · Customers Active Over the Past Half Year
-- Problem: https://xomdata.com/practice/medium-frequency-001
-- Solved: 2026-08-20

select customer_id, count(order_id) as order_count
from orders
where order_date >= '2024-01-01' and order_date <= '2024-06-30'
group by customer_id
order by order_count desc, customer_id
