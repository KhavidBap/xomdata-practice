-- Xom Data · First purchase date next to every order
-- Problem: https://xomdata.com/practice/medium-firstval-002
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
select customer_name, order_date, amount,
    min(order_date) over (partition by customer_name) as first_order_date
from orders
order by customer_name, order_date
