-- Xom Data · New customers and returning customers each month
-- Problem: https://xomdata.com/practice/hard-cohort-003
-- Solved: 2026-10-25

with monthly as (
    select distinct customer_id,
        to_char(order_date::date, 'yyyy-mm') as month
    from orders
), first_month as (
    select customer_id, min(month) as first_month
    from monthly
    group by customer_id
)

select m.month,
    count(*) filter (where m.month = f.first_month) as new_customers,
    count(*) filter (where m.month > f.first_month) as returning_customers
from monthly m
join first_month f using (customer_id)
group by m.month
order by m.month
