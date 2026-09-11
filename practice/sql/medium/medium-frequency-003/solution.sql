-- Xom Data · Each Customer's Golden Month
-- Problem: https://xomdata.com/practice/medium-frequency-003
-- Solved: 2026-09-11

with thang as (
    select customer_id, strftime('%Y-%m', order_date) as best_month, count(order_id) as orders_in_month
    from orders
    group by customer_id, strftime('%Y-%m', order_date)
), flagged as (
    select *,
        row_number() over (partition by customer_id order by orders_in_month desc, best_month) as flag
    from thang
)

select customer_id, best_month, orders_in_month
from flagged
where flag = 1
