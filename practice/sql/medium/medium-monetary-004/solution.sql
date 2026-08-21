-- Xom Data · Each Customer's Record-Setting Order
-- Problem: https://xomdata.com/practice/medium-monetary-004
-- Solved: 2026-08-21

with total as (
    select customer_id, order_id, order_date, amount, row_number() over (partition by customer_id order by amount desc, order_date) as flag
    from orders
)

select customer_id, order_id, order_date, amount
from total
where flag = 1
