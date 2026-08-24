-- Xom Data · Customer With the Widest Monthly Spread
-- Problem: https://xomdata.com/practice/medium-frequency-005
-- Solved: 2026-08-24

with thang as (
    select customer_id, order_id, strftime('%Y-%m', order_date) as month
    from orders
)

select customer_id, count(distinct month) as active_months, count(order_id) as total_orders
from thang
group by customer_id
order by active_months desc, customer_id
