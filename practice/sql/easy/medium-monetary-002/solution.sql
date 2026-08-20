-- Xom Data · Average spend per visit, per customer
-- Problem: https://xomdata.com/practice/medium-monetary-002
-- Solved: 2026-08-20

select customer_id, round(1.0 * sum(amount) / count(order_id), 2) as avg_order_value
from orders
group by customer_id
