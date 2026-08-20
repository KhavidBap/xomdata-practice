-- Xom Data · The size of each customer cohort
-- Problem: https://xomdata.com/practice/medium-cohort-004
-- Solved: 2026-08-20

with cohort as (
    select customer_id, min(strftime('%Y-%m', order_date)) as cohort_month
    from orders
    group by customer_id
)

select cohort_month, count(customer_id) as cohort_size
from cohort
group by cohort_month
