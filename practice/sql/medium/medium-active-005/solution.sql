-- Xom Data · Month-over-month momentum in customer count
-- Problem: https://xomdata.com/practice/medium-active-005
-- Solved: 2026-09-15

with thang as (
    select customer_id, strftime('%Y-%m', order_date) as month
    from orders
)

select month,
    count(distinct customer_id) as active_customers,
    count(distinct customer_id) - lag(count(distinct customer_id), 1) over (order by month) as change_vs_prev
from thang
group by month
