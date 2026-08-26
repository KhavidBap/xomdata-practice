-- Xom Data · What the First Impression Was Worth
-- Problem: https://xomdata.com/practice/medium-firstlast-003
-- Solved: 2026-08-26

select customer_id, min(order_date) as first_order_date, amount as first_amount
from orders
group by customer_id
order by customer_id
