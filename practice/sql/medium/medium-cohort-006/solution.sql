-- Xom Data · Customer Shopping Tenure
-- Problem: https://xomdata.com/practice/medium-cohort-006
-- Solved: 2026-09-11

with min_max as (
    select customer_id, min(order_date) as first_month, max(order_date) as last_month
    from orders
    group by customer_id
)

select customer_id,
    strftime('%Y-%m', first_month) as first_month, strftime('%Y-%m', last_month) as last_month, 
    (strftime('%Y', last_month) * 12 + strftime('%m', last_month)) - (strftime('%Y', first_month) * 12 + strftime('%m', first_month)) as tenure_months
from min_max
